<%@ page contentType="text/html; charset=UTF-8" import="org.example.project23.board.*, java.util.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
    String keyword = request.getParameter("keyword");
    String sort = request.getParameter("sort");

    BoardDAO boardDAO = new BoardDAO();
    List<BoardVO> list = boardDAO.getBoardList(keyword, sort);
    request.setAttribute("list", list);
%>
<jsp:include page="header.jsp"/>

<div class="row mb-3">
    <div class="col-md-6">
        <h3>게시판 목록</h3>
    </div>

    <div class="col-md-6 text-end">
        <form action="list.jsp" method="get" class="d-flex justify-content-end gap-2">

            <select name="sort" class="form-select form-select-sm w-auto" onchange="this.form.submit()">
                <option value="regdate" ${param.sort == 'regdate' ? 'selected' : ''}>최신순</option>
                <option value="old" ${param.sort == 'old' ? 'selected' : ''}>오래된순</option> <option value="cnt" ${param.sort == 'cnt' ? 'selected' : ''}>조회수순</option>
            </select>

            <input type="text" name="keyword" class="form-control w-50" placeholder="제목 또는 작성자 검색" value="${param.keyword}">
            <button type="submit" class="btn btn-outline-primary">검색</button>
        </form>
    </div>
</div>

<table class="table table-striped table-bordered table-hover">
    <thead class="table-dark">
    <tr>
        <th>번호</th>
        <th>카테고리</th>
        <th>제목</th>
        <th>작성자</th>
        <th>작성일</th>
        <th>조회수</th>
    </tr>
    </thead>
    <tbody>
    <c:forEach items="${list}" var="u">
        <tr>
            <td>${u.id}</td>
            <td>${u.category}</td>
            <td><a href="view.jsp?id=${u.id}">${u.title}</a></td>
            <td>${u.writer}</td>
            <td>${u.regdate}</td>
            <td>${u.cnt}</td>
        </tr>
    </c:forEach>
    </tbody>
</table>
<div class="text-end">
    <a href="write.jsp" class="btn btn-primary">새 글 작성</a>
</div>

<jsp:include page="footer.jsp"/>