<!-- �ڡ� ���� ������ info.jsp �ڡ�
1. ������ num�� parameter�� �޴´�.
2. ������ num,grp,grplevel,grpstep ������ ����
3. �Է�ȭ�� ǥ��
 -->

<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խ��� ��� ����</title>
<link rel="stylesheet" href="../../css/main.css">
</head>
<body>
	<form action="reply.do" method="post" name="f">
		<!--  ������ Number�� get .. 4���� �������� in hidden format-->
		<input type="hidden" name="num" value="${board.num}">
		<input type="hidden" name="grp" value="${board.grp}">
		<input type="hidden" name="grplevel" value="${board.grplevel}">
		<input type="hidden" name="grpstep" value="${board.grpstep}">
		<table><caption>�Խ��� ��� ���</caption>
			<tr><th>�۾���</th><td><input type="text" name="name"></td></tr>
			<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
			<tr><th>����</th><td><input type="text" name="subject" value="RE:${board.subject}"></td></tr>
			<tr><th>����</th><td><textarea name="content" rows="15"  id="content1"></textarea></td></tr>
			<script>CKEDITOR.replace("content1",{filebrowserImageUploadUrl : "imgupload.do"});</script>
			<tr><td colspan="2">
			<a href= "javascript:document.f.submit()">[�亯�� ���]</a> <a href= "info.do?num=${board.num}">[���ư���]</a> </td></tr>
			<!-- javascript ������� �� document���� f��� form�� submit�ϼ��� -->
		</table>
	</form>
</body>
</html>