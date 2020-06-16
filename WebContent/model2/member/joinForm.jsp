<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
<link rel="stylesheet" href="../../css/main.css">
<style type="text/css">
	.style{display: inline;}
	.onco_form_outer_frame{padding-top: 100px;}
	/*login frame with shade*/
	.onco_form_inner_frame{
	/*border: 1px solid lightgray;*/
	height: 500px;
	width: 550px;
	Text-align: center;
	box-shadow: 0px 0px 8px lightgray;
	}
	.btn_group {
		border: 1px solid red; background-color: red; color: white;
		width: 400px; height: 40px;
		margin-bottom: 20px;
	}
	.id_section {
		text-align: left;
		padding: 0 50px 0 50px;
		margin: 0 0 20px 0;
	}
	.password_section{
		text-align: left;
		padding: 0 50px 0 50px;
		margin: 0 0 50px 0;
	}

</style>
<!--★★ 여기도 새로 생김 ★★-->
<script type="text/javascript">
function win_upload(){
	var op = "width=500,height=150,left=50,top=150";
	open("pictureForm.me","",op);
	// open: pictureForm.me가 열림
}
</script>
</head>
<body>
<form action="join.me" name="f" method="post">
	<!-- former -->
	<!-- 	<input type="hidden" name="picture" value=""> /*여기요 with picture의 이미지 이름이 들어간다.*/ 
	<table><tr><td rowspan="4" valign="bottom">
	<img src="" width="100" height="120" id="pic"><br> */여기요 with picture.jsp*/
	
	<font size="1"><a href="javascript:win_upload()">사진등록</a></font>
	★★javascript:win_upload() 추가됨 for thumbnail.jsp ★★
	
	</td><th>아이디</th><td><input type="text" name="id"></td></tr>
	<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
	<tr><th>이름</th><td><input type="text" name="name"></td></tr>
	
	<tr><th>성별</th><td>
	<input type="radio" name="gender" value="1" checked>남
	<input type="radio" name="gender" value="2" >여</td></tr>
	<tr><th>전화번호</th><td colspan="2"><input type="text" name="tel"></td></tr>
	<tr><th>이메일</th><td colspan="2"><input type="text" name="email"></td></tr>
	<tr><td colspan="3"><input type="submit" value="회원가입"></td>
	</table>  -->
	<!-- /former -->

	<div class="onco_form_outer_frame">
		<div class="onco_form_inner_frame">
			<div>
				<br><br>
				<img src="../../img/small_logo.JPG"/>
				<br><br>
			</div>
				<div class="id_pw_frame">
				<div class="id_section">
				 	<label>
				 		<span>ID</span>
				 		<span>
				 			<a href="#" onclick="win_open('idForm')" style="color: gray; font-size:small;">아이디가 기억나지 않아요.</a>
				 		</span>
				 	</label>
				 	<br>
				 	<input type="text" name="id" style="width:400px; height:25px;">
				</div>
				<div class="password_section">
				 	<label>
				 		<span>Password</span>
				 		<span>
				 			<a href="#" onclick="win_open('pwForm')" style="color: gray; font-size:small;">비밀번호가 기억나지 않아요.</a>
				 		</span>
				 	</label>
				 	<br>
				 	<input type="password" name="pass" style="width:400px; height:25px;">
				</div>
			</div>
			<input type="submit" value="login" class="btn_group">
			<br>
			<a href="joinForm.me"  style="color: gray; font-size:small;">회원 가입</a>
	
		</div>
	</div>

</form>
</body>
</html>