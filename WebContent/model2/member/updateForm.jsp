<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 수정</title>
<link rel="stylesheet" href="../../css/main.css"> 
<script type="text/javascript">
function inputcheck(f) {
	<c:if test="${sessionScope.login !='admin'}">
		if(f.pass.value == "") {
		alert("비밀번호를 입력하세요");
	f.pass.focus();
	return false;
		}
	</c:if>
	}

// 패스워드 고치기 함수 만든다.
function win_passchg() {
	var op="width=500, height=250, left=50, top=150";
	open("passwordForm.jsp","",op);
}
// 사진수정하면서 새로 생긴 function
function win_upload(){
	var op = "width=500,height=150,left=50,top=150";
	open("pictureForm.jsp","",op);
	// open: pictureForm.jsp가 열림
}

</script>
</head>
<body>

	<form action="update.me" name="f" method="post" onsubmit="return inputcheck(this)">
	<input type="hidden" name="picture" value="${mem.picture}">
	<table><caption>회원정보 수정</caption>
	<tr><td rowspan="4" valign="bottom">
	<img src="picture/${mem.picture}" width="100" height="120" id="pic"><br>
	<font size="1"><a href="javascript:win_upload()">사진수정</a></font>
	<!-- 여기 href="javascript:win_upload()" 생김 -->
	</td><th>아이디</th>
	<td><input type="text" name="id" readonly value="${mem.id}"></td></tr>
	<!-- readonly value는 수정할 수 없어 -->
	<tr><td>비밀번호</td><td><input type="password" name="pass"></td></tr>
	<tr><td>이름</td>
	<td><input type="text" name="name" value="${mem.name}"></td></tr>
	<tr><td>성별</td>
	<td><input type="radio" name="gender" value ="1"
	${mem.gender==1?"checked":""}>남
	<!-- mem객체에서 getGender()했을 때 return value가 1이면 checked 처리하고 아니면 넘어가자 -->
	<input type="radio" name="gender" value ="2"
	${mem.gender==2?"checked":"" }>여</td></tr>
	<tr><td>전화번호</td>
	<td colspan="2"><input type="text" name="tel" value="${mem.tel}"></td></tr>
	<tr><td>이메일</td>
	<td colspan="2"><input type="text" name="email" value="${mem.email}"></td></tr>
	<tr><td colspan="3"><input type="submit" value="회원수정">
			
	<!-- 비번 바꾸기 -->
	<c:if test="${sessionScope.login !='admin' || mem.id=='admin'}">
	<input type="button" value="비밀번호수정" onclick="win_passchg()">
	</c:if>
	</td></tr>
	<!-- submit 누르면 id가 지정된 data를 물고 update.jsp로 넘어간다. -->
	</table></form>
	
</body>
</html>
