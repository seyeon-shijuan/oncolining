<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>about</title>
<style>

</style>
</head>
<body>

	<div class="inner_frame">
		<div class="content">
		<div>${sessionScope.login}�� ȯ���մϴ�.</div>
		<div>
			<a href="logout.me">�α׾ƿ�</a>
		</div>
		<div>
			<a href="info.me?mem_id=${sessionScope.login}">ȸ����������</a>
		</div>
		<c:if test="${sessionScope.login == 'admin'}">
			<div>
				<a href="list.me">ȸ����� ����</a>
			</div>
		</c:if>
		</div>
	</div>

</body>
</html>
