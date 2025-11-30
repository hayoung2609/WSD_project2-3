<%@ page contentType="text/html; charset=UTF-8" import="org.example.project23.board.*" %>
<%@ page import="java.net.URLEncoder" %>
<%
  String idStr = request.getParameter("id");

  if(idStr == null || idStr.isEmpty()){
    response.sendRedirect("list.jsp");
    return;
  }

  int id = Integer.parseInt(idStr);

  BoardDAO boardDAO = new BoardDAO();

  boardDAO.increaseCnt(id);
  BoardVO u = boardDAO.getBoard(id);

  if(u == null) {
    out.println("<script>alert('삭제되거나 존재하지 않는 게시글입니다.'); location.href='list.jsp';</script>");
    return;
  }
%>
<jsp:include page="header.jsp"/>

<div class="card">
  <div class="card-header">
    게시글 상세보기
  </div>
  <div class="card-body">
    <h5 class="card-title">[<%= u.getCategory() %>] <%= u.getTitle() %></h5>

    <p class="card-text text-muted">
      작성자: <%= u.getWriter() %> |
      작성일: <%= u.getRegdate() %> |
      조회수: <%= u.getCnt() %>
    </p>
    <hr>

    <% if(u.getFilename() != null && !u.getFilename().isEmpty()) {
      // 파일명 인코딩
      String encodedFilename = URLEncoder.encode(u.getFilename(), "UTF-8").replaceAll("\\+", "%20");
    %>
    <div class="mb-3 text-center">
      <img src="${pageContext.request.contextPath}/upload/<%= encodedFilename %>" class="img-fluid" style="max-height: 500px;">
    </div>
    <% } %>

    <p class="card-text"><%= u.getContent().replace("\n", "<br>") %></p>

    <div class="mt-4 text-end">
      <a href="list.jsp" class="btn btn-secondary">목록</a>
      <a href="edit.jsp?id=<%= u.getId() %>" class="btn btn-warning">수정</a>
      <a href="delete_ok.jsp?id=<%= u.getId() %>" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
    </div>
  </div>
</div>

<jsp:include page="footer.jsp"/>