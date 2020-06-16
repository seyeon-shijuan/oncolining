<%--
1. jspstudy1에서 src/model1/ 패키지의 모든 파일을 jspstudy2의 src/model/로 복사
2. jspstudy1의 webContent/model1/member, board 폴더를
   jspstudy2의 webcontent/model2/로 복사
3. jspstudy1의 webContent/WEB-INF/lib 폴더의 모든 파일을
    jspstudy2의 webContent/WEB-INF/lib 폴더에 복사
4. jspstudy1의 WebContent/css 폴더를 복사하여
    jspstudy2의 WebContent/에 붙여넣기
 --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>login</title>
<link rel="stylesheet" href="../../css/main.css">
<style type="text/css">
	.style{display: inline;}

</style>
<script type="text/javascript">
	function inputcheck(f){
		if(f.id.value == ''){
			alert("아이디를 입력하세요")
			f.id.focus();
			return false;
		}
		if(f.id.value.length <4){
			alert("아이디는 4자 이상 입력하세요")
			f.id.focus();
			return false;
		}
		if(f.pass.value == ''){
			alert("비밀번호를 입력하세요")
			f.pass.focus();
			return false;
		}
		return true;
	}
	function win_open(page) { 
		var op = "width=500, height=350, left=50,top=150"; 
		open(page+".me","",op); 
		}
</script>
</head>
<body>
<form action="login.me" method="post" name="f" onsubmit="return inputcheck(this)">
<!--  
<table><caption>로그인</caption>
<tr><th>아이디</th><td><input type="text" name="id"></td></tr>
<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2">
<input type="submit" value="로그인">
<input type="button" value="회원가입" onclick="location.href='joinForm.me'">
<input type="button" value="아이디찾기"   onclick="win_open('idForm')"> 
<input type="button" value="비밀번호찾기" onclick="win_open('pwForm')">  
</td></tr>
</table>
-->
<div>
	<div>
		<img src="../img/small_logo.JPG"/>
	</div>
	<div class="id_section">
	 	<label>
	 		<span>ID</span>
	 		<span>
	 			<a href="win_open('idForm')">아이디가 기억나지 않아요.</a>
	 		</span>
	 	</label>
	 
	 	<input type="text" name="id">
	</div>
	<div class="password_section">
	 	<label>
	 		<span>password</span>
	 		<span>
	 			<a href="win_open('pwForm')">비밀번호가 기억나지 않아요.</a>
	 		</span>
	 	</label>
	 	<input type="password" name="pass">
	</div>
</div>
</form>
</body>
</html>