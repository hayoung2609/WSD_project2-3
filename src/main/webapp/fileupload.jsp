<%--
  Created by IntelliJ IDEA.
  User: kanghayoung
  Date: 2025. 11. 27.
  Time: 오전 10:08
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>
<form method="post" action="fileupload2_ok.jsp" enctype="multipart/form-data">
    제목 : <input type="text" name="title" /><br />
    이미지 : <input type="file" name="photo" />
    <input type="submit" value="upload" />
</form>
</body>
</html>
