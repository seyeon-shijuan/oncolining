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
		<div>${sessionScope.login}님 환영합니다.</div>
		<div>
			<a href="logout.me">로그아웃</a>
		</div>
		<div>
			<a href="info.me?mem_id=${sessionScope.login}">회원정보보기</a>
		</div>
		<c:if test="${sessionScope.login == 'admin'}">
			<div>
				<a href="list.me">회원목록 보기</a>
			</div>
		</c:if>
		</div>
	</div>

</body>
</html>
