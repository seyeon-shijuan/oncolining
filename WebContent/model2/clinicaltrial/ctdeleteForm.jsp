<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="model.ClinicaltrialDao"%>
<%@page import="model.Clinicaltrial"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ְ��ӻ����� ����</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../css/joinform.css"> 
<script type="text/javascript">

</script>
</head>
<body>
	<form action="ctdelete.me" method="post">
		<div style="text-align: center;">
			<input type="hidden" name="ct_datano" value="${param.num}">
			<p style="font-size: medium;">������ �ӻ� 1���� �����Ͻðڽ��ϱ�?</p>
			<input type="submit" value="����" style="margin: 10px;"/>
			<input type="button" value="���" onClick="window.close()" style="margin: 10px 10px 10px 0;">
		</div>
	</form>

</body>
</html>
