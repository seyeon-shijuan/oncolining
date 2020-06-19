<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="model.Clinicaltrial"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ӻ� ���� : �ְ� ���� ���� �Է�</title>
<link rel="stylesheet" href="../../css/joinform.css"> 
<style type="text/css">

</style>
<!--�ڡ� ���⵵ ���� ���� �ڡ�-->
<script type="text/javascript">

</script>
</head>
<body>
	 
	<div class="onco_form_outer_frame">
		<div class="onco_form_inner_frame">
			<div>
				
				<img src="../../img/small_logo.JPG"/>
				<br>
				�ְ� ���� ���� �Է��ϱ�
				<br><br>
			</div>
			
			
			<div>
				<!-- ȸ������ �׸� -->
				<form action="ctdata.me" name="f" method="post" class ="table_form">
				<input type="hidden" name="mem_id" value="${mem.mem_id}"> <!-- id�� foreign key�� -->
				
				
				<table class="onco_form_table" >
				  <tr>
				   <th> �г��� </th>
				   <td> <input type = "text" name="mem_nickname" class="short_blank" readonly value="${mem.mem_nickname}"  style="background-color: #F6F6F6"/> </td>
				  </tr>
				  <tr>
				   <th> �� ���� </th>
				   <td> <input type = "text" name="ct_age"/> </td>
				  </tr>
				  <tr>
				   <th> ���� </th>
				   <td> <input type = "text" name="mem_gender" readonly value="${mem.mem_gender}"  style="background-color: #F6F6F6"/> </td>
				  </tr>
				  <tr>
				   <th> ���ܸ� </th>
				   <td> <input type = "text" name="mem_diagnosis" readonly value="${mem.mem_diagnosis}"  style="background-color: #F6F6F6"/> </td>
				  </tr>
				  <tr>
				   <th> ���� ���� </th>
				   <td><input type = "text" name="mem_stage" readonly value="${mem.mem_stage}"  style="background-color: #F6F6F6"/>  </td>
				  </tr>
				  <tr>
				   <th> ���� ����</th>
				   <td> <input type = "text" name="ct_week"/> </td>
				  </tr>
				  <tr>
				   <th> ���� �๰<br>(���� ���� ����)  </th>
				   <td>
				    <input type = "checkbox" name="ct_medicine" value="Albendazole"/> Albendazole
				    <input type = "checkbox" name="ct_medicine" value="Fenbendazole" style="margin-left: 43px;"/> Fenbendazole
				    <br/>
				    <input type = "checkbox" name="ct_medicine" value="Mebendazole"/> Mebendazole
				    <input type = "checkbox" name="ct_medicine" value="Flubendazole" style="margin-left: 35px;"/> Flubendazole
				    <br/>
				    <input type = "checkbox" name="ct_medicine" value="Pyrvinium" /> Pyrvinium
				   </td>
				  </tr>
					<tr>
				   <th> ��� </th>
				   <td>
				   	  <select name="ct_frequency">
					  <option value="7�� ���Ӻ���" selected="selected">7�� ���Ӻ���</option>
					  <option value="4�� ���� - 3�� �޾�">4�� ���� - 3�� �޾�</option>
					  <option value="3�� ���� - 4�� �޾�">3�� ���� - 4�� �޾�</option>
					  <option value="��Ÿ">��Ÿ</option>
					</select>
				   </td>
				  </tr>
				  <tr>
				   <th> ��Ÿ���</th>
				   <td> <input type = "text" name="ct_otherfqc"/> </td>
				  </tr>
				   <tr>
				   <tr>
				   <th> ���뷮</th>
				   <td> <input type = "text" name="ct_dosage"/> </td>
				  </tr>
				   <tr>
				   <th> ���� ġ��<br>(���� ���� ����)  </th>
				   <td>
				    <input type = "checkbox" name="ct_treatment" value="����" /> ����
				    <input type = "checkbox" name="ct_treatment" value="�鿪ġ����" style="margin-left: 91px;"/> �鿪ġ����
				    <br/>
				    <input type = "checkbox" name="ct_treatment" value="�׾�ȭ�п��"/> �׾�ȭ�п��
				    <input type = "checkbox"  name="ct_treatment" value="��缱ġ��" style="margin-left: 36px;"/> ��缱ġ��
				    <br/>
				    <input type = "checkbox" name="ct_treatment" value="ȣ������"/> ȣ������
				    <input type = "checkbox" name="ct_treatment"  value="ǥ��ġ����" style="margin-left: 50px;"/> ǥ��ġ����
				    <br/>
				    <input type = "checkbox" name="ct_treatment" value="��Ÿ���"/> ��Ÿ���
				   </td>
				  </tr>
				  <tr>
				   <th> ������</th>
				   <td> <input type = "text" name="ct_suppliment"/> </td>
				  </tr>
				  <tr>
				   <th> ü�� ����<br/>(���� ��) </th>
				   <td>
				   	  <select name="ct_pain">
					  <option value="�ſ� ��ȭ��" >�ſ� ��ȭ��</option>
					  <option value="��ȭ��" >��ȭ��</option>
					  <option value="��ȭ ����" selected="selected">��ȭ ����</option>
					  <option value="������" >������</option>
					  <option value="�ſ� ������" >�ſ� ������</option>
					</select>
				   </td>
				  </tr>
				   <tr>
				   <th> ��¡��Ƿε�<br/>(���� ��) </th>
				   <td>
				   	  <select name="ct_fatigue">
					  <option value="�ſ� ��ȭ��">�ſ� ��ȭ��</option>
					  <option value="��ȭ��">��ȭ��</option>
					  <option value="��ȭ ����" selected="selected">��ȭ ����</option>
					  <option value="������">������</option>
					  <option value="�ſ� ������">�ſ� ������</option>
					</select>
				   </td>
				  </tr>
				  <tr>
				   <th> ���ۿ롤�ǽ�����</th>
				   <td> <input type = "text" name="ct_side_effect"/> </td>
				  </tr>
				  <tr>
				   <th> ���� ũ�� ��ȭ<br> (�˻��� ���)</th>
				   <td> <input type = "text" name="ct_tumor_size"/> </td>
				  </tr>
				 <tr>
				   <th> ���� ��ġ ��ȭ<br> (�˻��� ���)</th>
				   <td> <input type = "text" name="ct_blood_test"/> </td>
				  </tr>
				  
				</table>
				<input type="submit" value="�����ϱ�" class="btn_group">
				 </form>
				<!-- /ȸ������ �׸� -->
			</div>
			
			<br>
			<button  onclick="location.href='../member/main.me'">���ư���</button>
			
		</div>
	</div>

</form>
</body>
</html>