<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- /WebContent/model2/ajax/exchange.jsp  --%>
<%-- 
	list : ��ȭ�ڵ�, ȯ������
	list2 : ������
	today : ���� �Ͻ�
 --%>
<h4><fmt:formatDate value="${today}" pattern="yyyy-MM-dd- HH:mm"/>����</h4>
<table  class="w3-table-all"><caption>���� ȯ��</caption>
	<tr><td colspan="3" class="w3-center">${list2[0]}:${list[0]}</td></tr>
	<tr><th>������</th><th>���� ��</th><th>�Ľ� ��</th></tr>
	<tr><td>${list[3]}</td><td>${list[1]}</td><td>${list[2]}</td></tr>
</table>