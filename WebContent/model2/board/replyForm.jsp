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
		<input type="hidden" name="num" value="${board.board_no}">
		<input type="hidden" name="board_grp" value="${board.board_grp}">
		<input type="hidden" name="board_grplevel" value="${board.board_grplevel}">
		<input type="hidden" name="board_grpstep" value="${board.board_grpstep}">
		<table><caption>게시판 답글 등록</caption>
			<tr><th>글쓴이</th><td><input type="text" name="mem_id"></td></tr>
			<tr><th>제목</th><td><input type="text" name="board_subject" value="RE:${board.board_subject}"></td></tr>
			<tr><th>내용</th><td><textarea name="board_content" rows="15"  id="content1"></textarea></td></tr>
			<script>CKEDITOR.replace("content1",{filebrowserImageUploadUrl : "imgupload.do"});</script>
			<tr>
				<td colspan="2">
				<a href= "javascript:document.f.submit()" style="margin: 0 2% 0 2%;">답변글 등록</a>
				<a href= "info.do?num=${board.board_no}" style="margin: 0 2% 0 2%;">돌아가기</a>
				</td>
			</tr>
			<!-- javascript 기능으로 이 document에서 f라는 form을 submit하세요 -->
		</table>
	</form>
</body>
</html>