<%--
  Created by IntelliJ IDEA.
  User: kanghayoung
  Date: 2025. 11. 27.
  Time: 오전 10:10
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.io.File"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>

<%
  // 외부인 파일 크기 제한 약 15MB
  String filename = "";
  int sizeLimit = 15 * 1024 * 1024;

  // 절대경로, upload라는 폴더를 만들어서 파일을 저장.
  String realPath = request.getServletContext().getRealPath("upload");
  System.out.println(realPath);

  // 폴더가 없으면 만듦.
  File dir = new File(realPath);
  if (!dir.exists()) dir.mkdirs();

  // 지정된 경로와 파일 크기 제한 설정에 따라 파일을 서버에 업로드하고,
  // 중복된 파일명이 있을 경우 자동으로 이름을 변경하여 저장하는 객체를 생성
  MultipartRequest multpartRequest = null;
  multpartRequest = new MultipartRequest(request, realPath,
          sizeLimit, "utf-8",new DefaultFileRenamePolicy());

  filename = multpartRequest.getFilesystemName("photo");
  String imagepath = "";
  if(filename != ""){
    out.print("<img src='./upload/" + filename + "' height=400>");
  }
%>
