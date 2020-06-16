<!-- ★★ 이전 페이지 info.jsp ★★
1. 원글의 num을 parameter로 받는다.
2. 원글의 num,grp,grplevel,grpstep 정보를 저장
3. 입력화면 표시
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시판 답글 쓰기</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<form action="reply.do" method="post" name="f">
		<!--  원글의 Number를 get .. 4가지 가져오기 in hidden format-->
		<input type="hidden" name="num" value="${board.num}">
		<input type="hidden" name="grp" value="${board.grp}">
		<input type="hidden" name="grplevel" value="${board.grplevel}">
		<input type="hidden" name="grpstep" value="${board.grpstep}">
		<table><caption>게시판 답글 등록</caption>
			<tr><th>글쓴이</th><td><input type="text" name="name"></td></tr>
			<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
			<tr><th>제목</th><td><input type="text" name="subject" value="RE:${board.subject}"></td></tr>
			<tr><th>내용</th><td><textarea name="content" rows="15"  id="content1"></textarea></td></tr>
			<script>CKEDITOR.replace("content1",{filebrowserImageUploadUrl : "imgupload.do"});</script>
			<tr><td colspan="2">
			<a href= "javascript:document.f.submit()">[답변글 등록]</a> <a href= "info.do?num=${board.num}">[돌아가기]</a> </td></tr>
			<!-- javascript 기능으로 이 document에서 f라는 form을 submit하세요 -->
		</table>
	</form>
</body>
</html>