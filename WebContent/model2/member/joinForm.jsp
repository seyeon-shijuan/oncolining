<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
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
<!--�ڡ� ���⵵ ���� ���� �ڡ�-->
<script type="text/javascript">
function win_upload(){
	var op = "width=500,height=150,left=50,top=150";
	open("pictureForm.me","",op);
	// open: pictureForm.me�� ����
}
</script>
</head>
<body>
<form action="join.me" name="f" method="post">
	<!-- former -->
	<!-- 	<input type="hidden" name="picture" value=""> /*����� with picture�� �̹��� �̸��� ����.*/ 
	<table><tr><td rowspan="4" valign="bottom">
	<img src="" width="100" height="120" id="pic"><br> */����� with picture.jsp*/
	
	<font size="1"><a href="javascript:win_upload()">�������</a></font>
	�ڡ�javascript:win_upload() �߰��� for thumbnail.jsp �ڡ�
	
	</td><th>���̵�</th><td><input type="text" name="id"></td></tr>
	<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
	<tr><th>�̸�</th><td><input type="text" name="name"></td></tr>
	
	<tr><th>����</th><td>
	<input type="radio" name="gender" value="1" checked>��
	<input type="radio" name="gender" value="2" >��</td></tr>
	<tr><th>��ȭ��ȣ</th><td colspan="2"><input type="text" name="tel"></td></tr>
	<tr><th>�̸���</th><td colspan="2"><input type="text" name="email"></td></tr>
	<tr><td colspan="3"><input type="submit" value="ȸ������"></td>
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
				 			<a href="#" onclick="win_open('idForm')" style="color: gray; font-size:small;">���̵� ��ﳪ�� �ʾƿ�.</a>
				 		</span>
				 	</label>
				 	<br>
				 	<input type="text" name="id" style="width:400px; height:25px;">
				</div>
				<div class="password_section">
				 	<label>
				 		<span>Password</span>
				 		<span>
				 			<a href="#" onclick="win_open('pwForm')" style="color: gray; font-size:small;">��й�ȣ�� ��ﳪ�� �ʾƿ�.</a>
				 		</span>
				 	</label>
				 	<br>
				 	<input type="password" name="pass" style="width:400px; height:25px;">
				</div>
			</div>
			<input type="submit" value="login" class="btn_group">
			<br>
			<a href="joinForm.me"  style="color: gray; font-size:small;">ȸ�� ����</a>
	
		</div>
	</div>

</form>
</body>
</html>