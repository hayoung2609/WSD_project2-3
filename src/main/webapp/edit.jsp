<%@ page contentType="text/html; charset=UTF-8" import="org.example.project23.board.*" %>
<%
    String idStr = request.getParameter("id");
    if(idStr == null || idStr.isEmpty()){
        response.sendRedirect("list.jsp");
        return;
    }
    int id = Integer.parseInt(idStr);

    BoardDAO boardDAO = new BoardDAO();
    BoardVO u = boardDAO.getBoard(id);
%>
<jsp:include page="header.jsp"/>

<div class="card">
    <div class="card-header">글 수정</div>
    <div class="card-body">
        <form action="edit_ok.jsp" method="post" enctype="multipart/form-data">
            <input type="hidden" name="id" value="<%= u.getId() %>">

            <input type="hidden" name="oldFile" value="<%= (u.getFilename() != null) ? u.getFilename() : "" %>">

            <div class="mb-3">
                <label class="form-label">제목</label>
                <input type="text" name="title" class="form-control" value="<%= u.getTitle() %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">작성자</label>
                <input type="text" name="writer" class="form-control" value="<%= u.getWriter() %>" required>
            </div>
            <div class="mb-3">
                <label class="form-label">이메일</label>
                <input type="email" name="email" class="form-control" value="<%= u.getEmail() %>">
            </div>
            <div class="mb-3">
                <label class="form-label">비밀번호 확인</label>
                <input type="password" name="password" class="form-control">
            </div>
            <div class="mb-3">
                <label class="form-label">카테고리</label>
                <select name="category" class="form-select">
                    <option value="공지" <%= u.getCategory().equals("공지") ? "selected" : "" %>>공지</option>
                    <option value="질문" <%= u.getCategory().equals("질문") ? "selected" : "" %>>질문</option>
                    <option value="잡담" <%= u.getCategory().equals("잡담") ? "selected" : "" %>>잡담</option>
                </select>
            </div>
            <div class="mb-3">
                <label class="form-label">내용</label>
                <textarea name="content" class="form-control" rows="5" required><%= u.getContent() %></textarea>
            </div>

            <div class="mb-3">
                <label class="form-label">첨부파일</label>
                <% if(u.getFilename() != null) { %>
                <p class="text-muted small">현재 파일: <%= u.getFilename() %></p>
                <% } %>
                <input type="file" name="photo" class="form-control">
            </div>

            <button type="submit" class="btn btn-primary">수정 완료</button>
            <a href="view.jsp?id=<%= u.getId() %>" class="btn btn-secondary">취소</a>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp"/>