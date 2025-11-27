<%@ page contentType="text/html; charset=UTF-8" import="org.example.project2_2.board.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="u" class="org.example.project2_2.board.BoardVO" />
<jsp:setProperty property="*" name="u" />

<%
  BoardDAO boardDAO = new BoardDAO();
  int i = boardDAO.insertBoard(u);
  if(i > 0){
    response.sendRedirect("list.jsp");
  } else {
    out.println("<script>alert('글 작성 실패'); history.back();</script>");
  }
%>
