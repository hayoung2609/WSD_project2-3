<%--
  Created by IntelliJ IDEA.
  User: kanghayoung
  Date: 2025. 11. 27.
  Time: 오전 10:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.example.project23.file.FileUpload"%>
<%@ page import="org.example.project23.file.FileVO"%>
<%
  FileUpload fileUpload = new FileUpload();
  FileVO vo = fileUpload.uploadFile(request);
%>
제목 : <%=vo.getTitle()%><br>
파일명 : <a href="./upload/<%=vo.getFileName()%>"><%=vo.getFileName()%></a><br>
다운로드 : <a href="download.jsp?filename=<%=vo.getFileName()%>"><%=vo.getFileName()%></a>
