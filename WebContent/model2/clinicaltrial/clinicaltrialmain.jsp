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
�� �������� me�� ����
action.properties��
/model2/clinicaltrial/clinicaltrialmain.me=action.clinicaltrial.ClinicaltrialmainAction
�ִ�. - > �α��� Ȯ���ϰ� ������.
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ӻ����</title>
<link rel="stylesheet" href="../../css/main.css">
<style>
.main_contents {margin : auto; /*padding: 50px;*/}
.inner_frame {text-align: center;}
/*.two-divs { float : left; padding : 10px; width: 50%; }*/

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

</script>
</head>
<body>


<div class="outer_frame">
	<div class="inner_frame">
		<span class="spantag">�ӻ����<br><br></span>
		
		
		<!-- main contents -->
		<div class="main_contents">
			<!-- clinical trial data section -->
			<div class="two-divs" style="overflow:scroll; white-space:nowrap; width:57%; height:600px; padding: 1%; background-color:#CECECE; float:left;">
			
				<table>
					<tr>
						<th>No.</th><th>�г���</th><th>�� ����</th><th>����</th><th>���ܸ�</th><th>���պ���</th><th>��������</th><th>����๰</th><th>���</th>
						<th>��Ÿ���</th><th>���뷮</th><th>����ġ��</th><th>������</th><th>ü������</th><th>��¡��Ƿε�</th><th>���ۿ롤�ǽ�����</th>
						<th>����ũ�⺯ȭ</th><th>�����ġ��ȭ</th>
					</tr>
					<c:forEach var="c" items="${list}">
						<tr>
							<td>${c.ct_datano}</td>
						</tr>
					</c:forEach>
					
				</table>
				80808
				8<br>
				8<br><br>
				8<br><br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br><br>
				8<br><br><br>
				
			</div>
			<!-- /clinical trial data section -->
				<div class="two-divs" style="width: 40%; height: 600px; margin-left: 3%;  padding: 1%; background-color:#CECECE; float:left;">
				</div>
			<!--chart section  -->
			
			
			<!-- /chart section  -->
		</div><div style="clear:both;"></div>
		 <!-- /main contents -->
		<br>
		
		<button type="button" onclick="location.href='updateForm.me?mem_id=${mem.mem_id}' " class="btn_group">ȸ������ ����</button>
		

		<c:if test="${param.id != 'admin' && sessionScope.login != 'admin'}">
		<button type="button" onclick="location.href='deleteForm.me?mem_id=${mem.mem_id}' " class="btn_group">ȸ�� Ż��</button>
		</c:if>
		
		
	</div> <!-- /inner frame -->
</div>
</body>
</html>


