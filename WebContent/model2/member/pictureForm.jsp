<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원사진 등록</title>

<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<h3>사진업로드</h3>
<form action="picture.me" method="post" enctype="multipart/form-data">
<input type="file" name="picture">
<input type="submit" value="사진등록">
</form>
</body>
</html>
<!-- 	joinForm.jsp에서 open("pictureForm.me","",op); 로 바꾸기-->