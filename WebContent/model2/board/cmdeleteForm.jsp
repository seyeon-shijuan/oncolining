<%@ page language="java" contentType="text/html; charset=EUC-KR" 
    pageEncoding="EUC-KR"%> 
<%-- /WebContent/model1/board/cmdeleteForm.jsp --%>     
<!DOCTYPE html> 
<html><head> 
<meta charset="EUC-KR"> 
<title>�Խ��� ���� ȭ��</title> 
<link rel="stylesheet" href="../../css/main.css"> 
</head>
<body>
 
 	<form action="cmdelete.do" name="f" method="post">

		<div style="text-align: center;">
			<input type="hidden" name="num" value="${param.num}">
			<p style="font-size: medium;">�ڸ�Ʈ�� �����Ͻðڽ��ϱ�? <br> (���� �� �������� �ʽ��ϴ�.)</p>
			<input type="submit" value="����" style="margin: 10px;"/>
			<input type="button" value="���" onClick="window.close()" style="margin: 10px 10px 10px 0;">
		</div>
	</form>
 
 
 </body></html> 
