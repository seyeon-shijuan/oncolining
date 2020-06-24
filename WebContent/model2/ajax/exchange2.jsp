<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%-- /WebContent/model2/ajax/exchange2.jsp  --%>
<%-- 
	date : ȯ�� ���� ����
	map : ȯ�� ���� ��ȭ�� �������� ����
 --%>
 
 <table class ="w3-table-all"><caption>KEB�ϳ�����(${date})</caption> 
 	<tr>
 		<th rowspan='2' style="vertical-align: middle;">�ڵ�</th>
 		<th rowspan='2' style="vertical-align: middle;">������</th>
 		<th colspan='2' class="w3-center">����</th>
 	</tr>
 	<tr>
 		<th>�ĽǶ�</th>
 		<th>��Ƕ�</th>
 	</tr>
 	<c:forEach var="m" items="${map}">
 		<tr>
 			<td class="w3-center">${m.key}(${m.value[0]})</td>
 			<td>${m.value[1]}</td><td>${m.value[2]}</td><td>${m.value[3]}</td>
 		</tr>
 	</c:forEach>
 
 </table>
