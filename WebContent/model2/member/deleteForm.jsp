<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
1. id �Ķ���� �����ϱ�
2. login ���� �����ϱ�
�α׾ƿ� �����ΰ�� �α����ϼ���. �޼������ �� loginForm.jsp �������� �̵�
3.����ȭ�� ����ϱ�
��2�� ������ ���� �� �����ȴ�(�����κ�) 
 --%>
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ��Ż�� ��й�ȣ �Է�</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
<form action="delete.me" method="post">
<input type="hidden" name="mem_id" value="${param.mem_id }">
<table style="width: 500px">
<caption>ȸ����й�ȣ �Է�</caption>
<tr><th>��й�ȣ</th><td><input type="password" name="mem_pass"/></td></tr>
<tr><td colspan="2"><input type="submit" value="Ż���ϱ�"/></td></tr>
</table>
</form>
</body>
</html>
