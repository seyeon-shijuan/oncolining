<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="model.ClinicaltrialDao"%>
<%@page import="model.Clinicaltrial"%>
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
<title>���� �ӻ� ����</title>
<link rel="stylesheet" href="../../css/smallbutton.css">
<style>
.person_table {margin : auto; padding: 50px}
.inner_frame {text-align: center; margin-top: 2%;}
   table{
		margin-left: auto;
		margin-right: auto;
		align-content: center;
		width: 800px;
		font-size: x-small;
	}
	th,td {
	padding: 5px;
	max-width: 300px;
	overflow:hidden;white-space:nowrap; text-overflow:ellipsis;
	border: 1px solid lightgray;
	}
	th {
	background-color: #FEFEFE;
	text-align: center;
	}
	
	.btn_group {
		border: 1px solid red; background-color: red; color: white;
		width: 200px; height: 40px;
		margin: 20px;
	}

	}
</style>
<script type="text/javascript">

</script>
</head>
<body>

<div class="outer_frame">
	<button class="small_button_off" onclick="location.href='../member/info.me?mem_id=${sessionScope.login}'">&nbsp;&nbsp;ȸ�� ����&nbsp;&nbsp;</button>
	<button class="small_button_on"onclick="location.href='../clinicaltrial/myclinicaltrial.me'">���� �ӻ����</button>
	<div class="inner_frame">
		<span class="spantag">���� �ְ��ӻ�����</span>
		<div class="person_table">
			<span>
				<c:forEach var="c" items="${mylist}" begin="0" end="0">
					�г���: ${c.mem_nickname} /	 �� ����: ${c.ct_age} / ����: ${c.mem_gender} / ���ܸ�: ${c.mem_diagnosis} /	 ���պ���:${c.mem_stage}
				</c:forEach>
			</span>
			<!-- clinical trial data section -->
			<div class="one_div" style="overflow:scroll; white-space:nowrap; width:100%; height:400px; padding: 1%; background-color:#F2F2F2;">

			<table>
				<tr>
					<th>No.</th><th>��������</th><th>����๰</th><th>���</th>
					<th>��Ÿ���</th><th>���뷮</th><th>����ġ��</th><th>������</th><th>ü������</th><th>��¡��Ƿε�</th><th>���ۿ롤�ǽ�����</th>
					<th>����ũ�⺯ȭ</th><th>�����ġ��ȭ</th><th>����</th><th>����</th>
				</tr>
				<c:forEach var="c" items="${mylist}">
					<tr>
							<td>${c.ct_datano}</td>
							<td>${c.ct_week}</td>
							<td>${c.ct_medicine}</td>
							<td>${c.ct_frequency}</td>
							<td>${c.ct_otherfqc}</td>
							<td>${c.ct_dosage}</td>
							<td>${c.ct_treatment}</td>
							<td>${c.ct_suppliment}</td>
							<td>${c.ct_pain}</td>
							<td>${c.ct_fatigue}</td>
							<td>${c.ct_side_effect}</td>
							<td>${c.ct_tumor_size}</td>
							<td>${c.ct_blood_test}</td>
							<td>
								<a href="ctupdateForm.me?num=${c.ct_datano}">����</a>
							</td>
							<td>
								<a href="ctdeleteForm.me?num=${c.ct_datano}" 
								onclick="window.open(this.href,'_blank','width=460, height=150'); return false;">����</a>
							</td>
						</tr>
				</c:forEach>
			</table>
			</div> <!-- one_div -->
		</div>
		<br>
		
		<button type="button" onclick="location.href='../clinicaltrial/ctdataForm.me' " class="btn_group">�ӻ� �Է�</button>
		

		<c:if test="${param.id != 'admin' && sessionScope.login != 'admin'}">
		<button type="button" onclick="location.href='../clinicaltrial/clinicaltrialmain.me' " class="btn_group">�ӻ� ����</button>
		</c:if>
	</div>
</div>
</body>
</html>
