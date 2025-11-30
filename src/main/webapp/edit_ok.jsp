<%@ page contentType="text/html; charset=UTF-8" import="org.example.project23.board.*" %>
<%@ page import="com.oreilly.servlet.MultipartRequest" %>
<%@ page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy" %>
<%@ page import="java.io.File" %>

<%
    request.setCharacterEncoding("UTF-8");

    String realPath = request.getServletContext().getRealPath("upload");
    int sizeLimit = 15 * 1024 * 1024;

    try {
        MultipartRequest multi = new MultipartRequest(request, realPath, sizeLimit, "utf-8", new DefaultFileRenamePolicy());

        BoardVO u = new BoardVO();
        u.setId(Integer.parseInt(multi.getParameter("id")));
        u.setTitle(multi.getParameter("title"));
        u.setWriter(multi.getParameter("writer"));
        u.setEmail(multi.getParameter("email"));
        u.setCategory(multi.getParameter("category"));
        u.setContent(multi.getParameter("content"));

        String newFilename = multi.getFilesystemName("photo");
        String oldFilename = multi.getParameter("oldFile");

        if (newFilename != null) {
            u.setFilename(newFilename);
        } else {
            u.setFilename(oldFilename);
        }

        BoardDAO boardDAO = new BoardDAO();
        int result = boardDAO.updateBoard(u);

        if(result > 0) {
            response.sendRedirect("view.jsp?id=" + u.getId());
        } else {
            throw new Exception("Update Failed");
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('수정 실패!'); history.back();</script>");
    }
%>