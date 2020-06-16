<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%-- /WebContent/layout/layout.jsp --%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title><decorator:title /></title>
<!-- **����� ��û �������� head �±׸� �����´�. �� title�κи� �����Ѵ�. -->
<decorator:head/>
<link rel="stylesheet" href="${path}/css/main.css">
<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js">
</script>
</head>
<body>
	<table>
		<tr>
			<td colspan="3" align="right">
				������ �÷��� ������ �缺 ���� 2ȸ�� ��2 ���α׷� ����
				<span style="float: right;">
					<c:if test="${empty sessionScope.login }">
						<a href="${path}/model2/member/loginForm.me">�α���</a>
						<a href="${path}/model2/member/joinForm.me">ȸ������</a>
					</c:if>
					<c:if test="${!empty sessionScope.login}">
						${sessionScope.login}���� �α��� �ϼ̽��ϴ�. &nbsp; &nbsp;
						<a href="${path}/model2/member/logout.me">�α׾ƿ�</a>
					</c:if>
				</span>
			</td>
		</tr>
		<tr>
			<td width="15%" style="vertical-align: top">
				<a href="${path}/model2/member/main.me">ȸ������</a><br>
				<a href="${path}/model2/board/list.do">�Խ���</a><br>
				<a href="${path}/model2/chat/chatform.do">ä��</a><br>
			</td>
			<td colspan="2" style="text-align: left; vertical-align: top">
				<!--  �̺κп� body�� ����.-->
				<decorator:body />
			</td>
		</tr>
		<tr>
			<td colspan="3">
				�����ī���� Since 2016
			</td>
		</tr>
	</table>
</body>
</html>