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
		<input type="hidden" name="num" value="${board.board_no}">
		<input type="hidden" name="board_grp" value="${board.board_grp}">
		<input type="hidden" name="board_grplevel" value="${board.board_grplevel}">
		<input type="hidden" name="board_grpstep" value="${board.board_grpstep}">
		<table><caption>�Խ��� ��� ���</caption>
			<tr><th>�۾���</th><td><input type="text" name="mem_id"></td></tr>
			<tr><th>����</th><td><input type="text" name="board_subject" value="RE:${board.board_subject}"></td></tr>
			<tr><th>����</th><td><textarea name="board_content" rows="15"  id="content1"></textarea></td></tr>
			<script>CKEDITOR.replace("content1",{filebrowserImageUploadUrl : "imgupload.do"});</script>
			<tr>
				<td colspan="2">
				<a href= "javascript:document.f.submit()" style="margin: 0 2% 0 2%;">�亯�� ���</a>
				<a href= "info.do?num=${board.board_no}" style="margin: 0 2% 0 2%;">���ư���</a>
				</td>
			</tr>
			<!-- javascript ������� �� document���� f��� form�� submit�ϼ��� -->
		</table>
	</form>
</body>
</html>