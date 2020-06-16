<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style>
.container {
	position: relative;
}

.span4 {
	background: #252525;
	position: relative;
	margin: 0;
	padding: 0;
	color: #fefefe;
	height: 90px;
}

.inner-heading {
	color: #fff;
	margin: 20px 0 0 0;
}

.titletext {
	font-size: xx-large;
	display: inline-block;
	vertical-align: middle;
	margin-left: 60px;
}

.content{margin:30px 60px;}
</style>
</head>
<body>
	<!-- black bar container -->
	<div class="container">
		<div class="span4">
			<div class="inner-heading">
				<p class="titletext">about</p>
			</div>
		</div>
	</div>
	<!-- /black bar container -->
	
	<div class="content">
	<div>${sessionScope.login}�ηα��� �Ǿ����ϴ�.</div>
	<div>
		<a href="logout.me">�α׾ƿ�</a>
	</div>
	<div>
		<a href="info.me?id=${sessionScope.login }">ȸ����������</a>
	</div>
	<c:if test="${sessionScope.login == 'admin' }">
		<div>
			<a href="list.me">ȸ����� ����</a>
		</div>
	</c:if>
	</div>

</body>
</html>
