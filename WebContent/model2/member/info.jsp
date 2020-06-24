<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%--
1. id parameter ���� ��ȸ
2. login ���� ����
�α׾ƿ� ���¶�� : '�α��� �ϼ���'�޼����� ����ϰ� loginForm.jsp
3. login���� ���� 2
id parameter ���� login id�� �ٸ� ���: ������ ��ȸ�� �����մϴ�. �޼����� ��� �ϰ� main.jsp �������� �̵��Ѵ�.
4. db���� id ������ ������ ��ȸ.
5. ��ȸ�� ������ ȭ�鿡 ����ϱ�
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<link rel="stylesheet" href="../../css/main.css">
<link rel="stylesheet" href="../../css/smallbutton.css">
<style>
.person_table {margin : auto; padding: 50px}
.inner_frame {text-align: center; margin-top: 2%;}
   table{
		margin-left: auto;
		margin-right: auto;
		align-content: center;
		width: 800px;
	}
	th,td {

	padding: 15px;
	}
	
	.btn_group {
		border: 1px solid red; background-color: red; color: white;
		width: 200px; height: 40px;
		margin: 20px;
	}

</style>
<script type="text/javascript">
// �н����� ��ġ�� �Լ�
function win_passchg() {
	var op="width=500, height=250, left=50, top=150";
	open("passwordForm.jsp","",op);
}

</script>
</head>
<body>

<div class="outer_frame">
	<button  class="small_button_on" onclick="location.href='../member/info.me?mem_id=${sessionScope.login}'">&nbsp;&nbsp;ȸ�� ����&nbsp;&nbsp;</button>
	<button  class="small_button_off"  onclick="location.href='../clinicaltrial/myclinicaltrial.me'">���� �ӻ����</button>
	<div class="inner_frame">
		<span class="spantag">�ӻ�ȸ�� ����</span>
		<div class="person_table">
			<table>
				<tr>
					<th>���̵�</th><td>${sessionScope.login}</td>
				</tr>
				<tr>
					<th>��й�ȣ</th><td><input type="button" value="��й�ȣ����" onclick="win_passchg()"></td>
				</tr>
				<tr>
					<th>�̸�</th><td>${mem.mem_name}</td>
				</tr>
				<tr>
					<th>�г���</th><td>${mem.mem_nickname}</td>
				</tr>
				<tr>
					<th>�������</th>
					<td>
						<c:set var="TextValue" value="${mem.mem_dateofbirth}"/>
						${fn:substring(TextValue,0,10)}
					</td>
				</tr>
				<tr>
					<th>����</th><td>${mem.mem_gender}</td>
				</tr>
				<tr>
					<th>���ܸ�</th><td>${mem.mem_diagnosis}</td>
				</tr>
				<tr>
					<th>��������</th>
					<td>
						<c:set var="TextValue" value="${mem.mem_dgdate}"/>
						${fn:substring(TextValue,0,10)}
					</td>
				</tr>
				<tr>
					<th>���պ���</th><td>${mem.mem_stage}</td>
				</tr>
				<tr>
					<th>���ܼ�</th>
					<td>
							<c:if test="${empty mem.mem_docs}">
								&nbsp;
							</c:if>
							<c:if test="${!empty mem.mem_docs}">
								<a href="file/${mem.mem_docs}">${mem.mem_docs}</a>
							</c:if>
					</td>
				</tr>
				<tr>
					<th>����</th><td>${mem.mem_hospital}</td>
				</tr>
			</table>
		</div>
		<br>
		
		<button type="button" onclick="location.href='updateForm.me?mem_id=${mem.mem_id}' " class="btn_group">ȸ������ ����</button>
		

		<c:if test="${param.id != 'admin' && sessionScope.login != 'admin'}">
		<button type="button" onclick="location.href='deleteForm.me?mem_id=${mem.mem_id}' " class="btn_group">ȸ�� Ż��</button>
		</c:if>
	</div>
</div>
</body>
</html>
