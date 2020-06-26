<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>임상토픽 작성</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
function inputcheck(){
	f=document.f;
	if(f.mem_id.value==""){
		alert("글쓴이를 입력하세요.");
		f.name.focus();
		return;
	}
	if(f.board_subject.value==""){
		alert("제목을 입력하세요");
		f.subject.focus();
		return;
	}
	/*
	if(f.board_content.value==""){
		alert("내용을 입력하세요");
		f.content.focus();
		return;
	}
	*/
	f.submit();
	// form 객체에 submit을 강제로 발생시킨다.
	// 아래에 있는 hyperlink [게시물등록]은 submit이 아니라 이 function을 call하기만한다.
}
</script>

<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>

</head>
<body>
<form action="write.do" method="post" enctype="multipart/form-data" name="f">
<!-- 여기서 말하는 f는 document.f; in the 10th line  -->
<table>
<caption>임상토픽 쓰기</caption>
<tr><td>글쓴이</td><td><input type="text" name="mem_id" value="${sessionScope.login}" readonly></td></tr>
<tr><td>토픽 제목</td><td><input type="text" name="board_subject"></td></tr>
<tr><td>내용</td><td><textarea rows="15" name="board_content" id="content1"></textarea></td></tr>
<script>CKEDITOR.replace("content1",{filebrowserImageUploadUrl : "imgupload.do"});</script>
<tr><td>첨부파일</td><td><input type="file" name="board_file"></td></tr>
<tr>
	<td colspan="2">
		<a href="javascript:inputcheck()" style="margin-right: 10px;">토픽등록</a>
		<a href="#" onClick="history.back()" style="margin-left: 10px;">돌아가기</a>
	</td>
</tr>
<!-- a태그는 form과 상관이 없다.-->

</table>
</form>
</body>
</html>