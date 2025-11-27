<%@ page contentType="text/html; charset=UTF-8" import="org.example.project2_2.board.*" %>
<%@ page import="org.example.project2_2.board.BoardDAO" %>
<%
  String idStr = request.getParameter("id");
  int id = Integer.parseInt(idStr);

  BoardDAO boardDAO = new BoardDAO();
  int result = boardDAO.deleteBoard(id);

  if(result == 0){
    out.println("<script>alert('글 삭제 실패'); history.back();</script>");
  } else {
    response.sendRedirect("list.jsp");
  }
%>