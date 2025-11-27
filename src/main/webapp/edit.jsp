<%@ page contentType="text/html; charset=UTF-8" import="org.example.project2_2.board.*" %>
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
        <form action="edit_ok.jsp" method="post">
            <input type="hidden" name="id" value="<%= u.getId() %>">

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
            <!-- 비밀번호는 기존 값을 보여주지 않거나, 수정을 위해 새로 입력받음 (여기선 새로 입력) -->
            <div class="mb-3">
                <label class="form-label">비밀번호 확인 (수정하려면 입력)</label>
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

            <button type="submit" class="btn btn-primary">수정 완료</button>
            <a href="view.jsp?id=<%= u.getId() %>" class="btn btn-secondary">취소</a>
        </form>
    </div>
</div>

<jsp:include page="footer.jsp"/>