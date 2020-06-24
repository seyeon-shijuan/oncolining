<%@ page language="java" contentType="text/html; charset=EUC-KR" 
    pageEncoding="EUC-KR"%> 
<%-- /WebContent/model1/board/deleteForm.jsp --%>     
<!DOCTYPE html> 
<html><head> 
<meta charset="EUC-KR"> 
<title>게시판 삭제 화면</title> 
<link rel="stylesheet" href="../../css/main.css"> 
</head>
<body>
 
 	<form action="delete.do" name="f" method="post">

		<div style="text-align: center;">
			<input type="hidden" name="board_no" value="${param.num}">
			<p style="font-size: medium;">토픽을 삭제하시겠습니까? <br> (삭제 후 복구되지 않습니다.)</p>
			<input type="submit" value="삭제" style="margin: 10px;"/>
			<input type="button" value="취소" onClick="window.close()" style="margin: 10px 10px 10px 0;">
		</div>
	</form>
 
 
 </body></html> 
