<%--<jsp:useBean id="u" class="org.example.project23.board.BoardVO" />--%>
<%--<jsp:setProperty property="*" name="u" />--%>

<%@ page contentType="text/html; charset=UTF-8" import="org.example.project23.board.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>
<%
  request.setCharacterEncoding("UTF-8");

  String realPath = request.getServletContext().getRealPath("upload");
  File dir = new File(realPath);
  if(!dir.exists()) dir.mkdirs();

  int sizeLimit = 15 * 1024 * 1024;

  try {
    MultipartRequest multi = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

    BoardVO u = new BoardVO();
    u.setTitle(multi.getParameter("title"));
    u.setWriter(multi.getParameter("writer"));
    u.setEmail(multi.getParameter("email"));
    u.setPassword(multi.getParameter("password"));
    u.setCategory(multi.getParameter("category"));
    u.setContent(multi.getParameter("content"));
    u.setFilename(multi.getFilesystemName("photo"));

    BoardDAO boardDAO = new BoardDAO();
    int i = boardDAO.insertBoard(u);

    if(i > 0){
      response.sendRedirect("list.jsp");
    } else {
      throw new Exception("DB Insert Failed");
    }
  } catch (Exception e) {
    e.printStackTrace();
    out.println("<script>alert('글 작성 실패'); history.back();</script>");
  }
%>
