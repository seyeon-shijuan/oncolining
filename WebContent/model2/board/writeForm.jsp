<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ӻ����� �ۼ�</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
function inputcheck(){
	f=document.f;
	if(f.mem_id.value==""){
		alert("�۾��̸� �Է��ϼ���.");
		f.name.focus();
		return;
	}
	if(f.board_subject.value==""){
		alert("������ �Է��ϼ���");
		f.subject.focus();
		return;
	}
	/*
	if(f.board_content.value==""){
		alert("������ �Է��ϼ���");
		f.content.focus();
		return;
	}
	*/
	f.submit();
	// form ��ü�� submit�� ������ �߻���Ų��.
	// �Ʒ��� �ִ� hyperlink [�Խù����]�� submit�� �ƴ϶� �� function�� call�ϱ⸸�Ѵ�.
}
</script>

<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>

</head>
<body>
<form action="write.do" method="post" enctype="multipart/form-data" name="f">
<!-- ���⼭ ���ϴ� f�� document.f; in the 10th line  -->
<table>
<caption>�ӻ����� ����</caption>
<tr><td>�۾���</td><td><input type="text" name="mem_id" value="${sessionScope.login}" readonly></td></tr>
<tr><td>���� ����</td><td><input type="text" name="board_subject"></td></tr>
<tr><td>����</td><td><textarea rows="15" name="board_content" id="content1"></textarea></td></tr>
<script>CKEDITOR.replace("content1",{filebrowserImageUploadUrl : "imgupload.do"});</script>
<tr><td>÷������</td><td><input type="file" name="board_file"></td></tr>
<tr>
	<td colspan="2">
		<a href="javascript:inputcheck()" style="margin-right: 10px;">���ȵ��</a>
		<a href="#" onClick="history.back()" style="margin-left: 10px;">���ư���</a>
	</td>
</tr>
<!-- a�±״� form�� ����� ����.-->

</table>
</form>
</body>
</html>