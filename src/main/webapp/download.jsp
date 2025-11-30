<%--
  Created by IntelliJ IDEA.
  User: kanghayoung
  Date: 2025. 11. 27.
  Time: 오전 10:52
  To change this template use File | Settings | File Templates.
--%>
<%@ page import="java.io.*"%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%
      request.setCharacterEncoding("UTF-8");
      String fileName = request.getParameter("filename");

      // [보안 패치 1] null 체크
      if (fileName == null || fileName.trim().equals("")) {
            response.sendRedirect("list.jsp");
            return;
      }

      // [보안 패치 2] Path Traversal 방어 (가장 중요!)
      // 파일명에 경로 이동 문자(.., /, \)가 포함되어 있으면 차단
      if (fileName.contains("..") || fileName.contains("/") || fileName.contains("\\")) {
            out.println("<script>alert('유효하지 않은 파일명입니다. (경로 조작 시도 감지)'); history.back();</script>");
            return;
      }

      String savePath = "./upload";
      ServletContext context = request.getServletContext();
      String realPath = context.getRealPath(savePath);

      // 실제 파일 경로 생성
      String sFilePath = realPath + File.separator + fileName;

      // [보안 패치 3] 파일 존재 여부 확인
      File file = new File(sFilePath);
      if (!file.exists()) {
            out.println("<script>alert('파일이 존재하지 않습니다.'); history.back();</script>");
            return;
      }

      // 파일 다운로드 처리 (MIME 타입 등)
      String sMimeType = context.getMimeType(sFilePath);
      if (sMimeType == null) sMimeType = "application/octet-stream";

      response.setContentType(sMimeType);

      // 파일명 인코딩 (한글 깨짐 방지)
      String agent = request.getHeader("User-Agent");
      String downloadName = null;
      if(agent.contains("MSIE") || agent.contains("Trident")) {
            downloadName = java.net.URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", " ");
      } else {
            downloadName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
      }

      response.setHeader("Content-Disposition", "attachment; filename=\"" + downloadName + "\"");

      // 스트림 초기화 (JSP 출력 스트림과 충돌 방지)
      out.clear();
      out = pageContext.pushBody();

      // 파일 전송
      ServletOutputStream fileOut = response.getOutputStream();
      FileInputStream in = null;

      try {
            in = new FileInputStream(file);
            byte[] b = new byte[4096];
            int numRead;
            while ((numRead = in.read(b, 0, b.length)) != -1) {
                  fileOut.write(b, 0, numRead);
            }
      } catch(Exception e) {
            e.printStackTrace();
      } finally {
            if(fileOut != null) fileOut.flush();
            if(fileOut != null) fileOut.close();
            if(in != null) in.close();
      }
%>