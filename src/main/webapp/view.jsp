<%@ page contentType="text/html; charset=UTF-8" import="org.example.project23.board.*" %>
<%
  String idStr = request.getParameter("id");
  int id = Integer.parseInt(idStr);

  BoardDAO boardDAO = new BoardDAO();
  BoardVO u = boardDAO.getBoard(id);
  boardDAO.increaseCnt(id);
%>
<jsp:include page="header.jsp"/>

<div class="card">
  <div class="card-header">
    게시글 상세보기
  </div>
  <div class="card-body">
    <h5 class="card-title">[${u.category}] <%= u.getTitle() %></h5>
    <p class="card-text text-muted">작성자: <%= u.getWriter() %> | 작성일: <%= u.getRegdate() %> | 조회수: <%= u.getCnt() %></p>
    <hr>

    <% if(u.getFilename() != null && !u.getFilename().isEmpty()) { %>
    <div class="mb-3 text-center">
      <img src="${pageContext.request.contextPath}/upload/<%=u.getFilename()%>" class="img-fluid" style="max-height: 500px;">
    </div>
    <% } %>

    <p class="card-text"><%= u.getContent() %></p>

    <a href="list.jsp" class="btn btn-secondary">목록</a>
    <a href="edit.jsp?id=<%= u.getId() %>" class="btn btn-warning">수정</a>
    <a href="delete_ok.jsp?id=<%= u.getId() %>" class="btn btn-danger" onclick="return confirm('정말 삭제하시겠습니까?');">삭제</a>
  </div>
</div>

<jsp:include page="footer.jsp"/>