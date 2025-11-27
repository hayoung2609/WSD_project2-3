<%@ page contentType="text/html; charset=UTF-8" import="org.example.project2_2.board.*" %>
<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="u" class="org.example.project2_2.board.BoardVO" />
<jsp:setProperty property="*" name="u" />

<%
    BoardDAO boardDAO = new BoardDAO();
    int result = boardDAO.updateBoard(u);

    if(result > 0) {
        response.sendRedirect("view.jsp?id=" + u.getId());
    } else {
        out.println("<script>alert('수정 실패'); history.back();</script>");
    }
%>