<%--
1. jspstudy1���� src/model1/ ��Ű���� ��� ������ jspstudy2�� src/model/�� ����
2. jspstudy1�� webContent/model1/member, board ������
   jspstudy2�� webcontent/model2/�� ����
3. jspstudy1�� webContent/WEB-INF/lib ������ ��� ������
    jspstudy2�� webContent/WEB-INF/lib ������ ����
4. jspstudy1�� WebContent/css ������ �����Ͽ�
    jspstudy2�� WebContent/�� �ٿ��ֱ�
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
			alert("���̵� �Է��ϼ���")
			f.id.focus();
			return false;
		}
		if(f.id.value.length <4){
			alert("���̵�� 4�� �̻� �Է��ϼ���")
			f.id.focus();
			return false;
		}
		if(f.pass.value == ''){
			alert("��й�ȣ�� �Է��ϼ���")
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
<table><caption>�α���</caption>
<tr><th>���̵�</th><td><input type="text" name="id"></td></tr>
<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
<tr><td colspan="2">
<input type="submit" value="�α���">
<input type="button" value="ȸ������" onclick="location.href='joinForm.me'">
<input type="button" value="���̵�ã��"   onclick="win_open('idForm')"> 
<input type="button" value="��й�ȣã��" onclick="win_open('pwForm')">  
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
	 			<a href="win_open('idForm')">���̵� ��ﳪ�� �ʾƿ�.</a>
	 		</span>
	 	</label>
	 
	 	<input type="text" name="id">
	</div>
	<div class="password_section">
	 	<label>
	 		<span>password</span>
	 		<span>
	 			<a href="win_open('pwForm')">��й�ȣ�� ��ﳪ�� �ʾƿ�.</a>
	 		</span>
	 	</label>
	 	<input type="password" name="pass">
	</div>
</div>
</form>
</body>
</html>