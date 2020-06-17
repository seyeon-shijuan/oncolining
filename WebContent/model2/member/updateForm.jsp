<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<link rel="stylesheet" href="../../css/main.css"> 
<script type="text/javascript">
function inputcheck(f) {
	<c:if test="${sessionScope.login !='admin'}">
		if(f.pass.value == "") {
		alert("��й�ȣ�� �Է��ϼ���");
	f.pass.focus();
	return false;
		}
	</c:if>
	}

// �н����� ��ġ�� �Լ� �����.
function win_passchg() {
	var op="width=500, height=250, left=50, top=150";
	open("passwordForm.jsp","",op);
}
// ���������ϸ鼭 ���� ���� function
function win_upload(){
	var op = "width=500,height=150,left=50,top=150";
	open("pictureForm.jsp","",op);
	// open: pictureForm.jsp�� ����
}

</script>
</head>
<body>

	<form action="update.me" name="f" method="post" onsubmit="return inputcheck(this)">
	<input type="hidden" name="picture" value="${mem.picture}">
	<table><caption>ȸ������ ����</caption>
	<tr><td rowspan="4" valign="bottom">
	<img src="picture/${mem.picture}" width="100" height="120" id="pic"><br>
	<font size="1"><a href="javascript:win_upload()">��������</a></font>
	<!-- ���� href="javascript:win_upload()" ���� -->
	</td><th>���̵�</th>
	<td><input type="text" name="id" readonly value="${mem.id}"></td></tr>
	<!-- readonly value�� ������ �� ���� -->
	<tr><td>��й�ȣ</td><td><input type="password" name="pass"></td></tr>
	<tr><td>�̸�</td>
	<td><input type="text" name="name" value="${mem.name}"></td></tr>
	<tr><td>����</td>
	<td><input type="radio" name="gender" value ="1"
	${mem.gender==1?"checked":""}>��
	<!-- mem��ü���� getGender()���� �� return value�� 1�̸� checked ó���ϰ� �ƴϸ� �Ѿ�� -->
	<input type="radio" name="gender" value ="2"
	${mem.gender==2?"checked":"" }>��</td></tr>
	<tr><td>��ȭ��ȣ</td>
	<td colspan="2"><input type="text" name="tel" value="${mem.tel}"></td></tr>
	<tr><td>�̸���</td>
	<td colspan="2"><input type="text" name="email" value="${mem.email}"></td></tr>
	<tr><td colspan="3"><input type="submit" value="ȸ������">
			
	<!-- ��� �ٲٱ� -->
	<c:if test="${sessionScope.login !='admin' || mem.id=='admin'}">
	<input type="button" value="��й�ȣ����" onclick="win_passchg()">
	</c:if>
	</td></tr>
	<!-- submit ������ id�� ������ data�� ���� update.jsp�� �Ѿ��. -->
	</table></form>
	
</body>
</html>
