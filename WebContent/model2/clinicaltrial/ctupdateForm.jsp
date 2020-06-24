<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@page import="model.ClinicaltrialDao"%>
<%@page import="model.Clinicaltrial"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�ְ��ӻ����� ����</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../css/joinform.css"> 
<script type="text/javascript">
function inputcheck(f) {
	<c:if test="${sessionScope.login !='admin'}">
		if(f.pass.value == "") {
		alert("��й�ȣ�� �Է��ϼ���");
	f.pass.focus();
	return false;
		}
	</c:if>
	}

</script>
</head>
<body>

	
	
	<!-- �⺻ div -->
	<div class="onco_form_outer_frame">
		<div class="onco_form_inner_frame">
			<div>
			
				<img src="../../img/small_logo.JPG"/>
				<br><br>
				�ְ��ӻ����� ������ ����
				<br><br>
			</div>
			
			
			<div>
				<!-- �ӻ��Է� �׸�-->
				<form action="ctupdate.me" name="f" method="post" class ="table_form" onsubmit="return inputcheck(this)">
				<input type="hidden" name="mem_id" value="${ct.mem_id}"> <!-- id�� foreign key�� -->
				<input type="hidden" name="ct_datano" value="${ct.ct_datano}">
				
				<table class="onco_form_table" >
				  <tr>
				   <th> �г��� </th>
				   <td> <input type = "text" name="mem_nickname" class="short_blank" readonly value="${ct.mem_nickname}"  style="background-color: #F6F6F6"/> </td>
				  </tr>
				  <tr>
				   <th> �� ���� </th>
				   <td> <input type = "text" name="ct.ct_age" value="${ct.ct_age}"/> </td>
				  </tr>
				  <tr>
				   <th> ���� </th>
				   <td> <input type = "text" name="mem_gender" readonly value="${ct.mem_gender}"  style="background-color: #F6F6F6"/> </td>
				  </tr>
				  <tr>
				   <th> ���ܸ� </th>
				   <td> <input type = "text" name="mem_diagnosis" readonly value="${ct.mem_diagnosis}"  style="background-color: #F6F6F6"/> </td>
				  </tr>
				  <tr>
				   <th> ���� ���� </th>
				   <td><input type = "text" name="mem_stage" readonly value="${ct.mem_stage}"  style="background-color: #F6F6F6"/>  </td>
				  </tr>
				  <tr>
				   <th> ���� ����</th>
				   <td> <input type = "text" name="ct_week" value="${ct.ct_week}"/> </td>
				  </tr>
				  <tr>
				   <th> ���� �๰<br>(���� ���� ����)  </th>
				   <td>
				   
				 <!-- ${ct.ct_medicine} = Albendazole, Fenbendazole --> 
				   <script type="text/javascript">
				  	 $(function(){
				  		if(${ct.ct_medicine.contains("Albendazole")}) {
				  			$(".Albendazole").attr("checked","checked");
				  		}
				  		if(${ct.ct_medicine.contains("Fenbendazole")}) {
				  			$(".Fenbendazole").attr("checked","checked");
				  		}
				  		if(${ct.ct_medicine.contains("Mebendazole")}) {
				  			$(".Mebendazole").attr("checked","checked");
				  		}
				  		if(${ct.ct_medicine.contains("Flubendazole")}) {
				  			$(".Flubendazole").attr("checked","checked");
				  		}
				  		if(${ct.ct_medicine.contains("Pyrvinium")}) {
				  			$(".Pyrvinium").attr("checked","checked");
				  		}
				   })
					</script>
				   
				    <input type = "checkbox" name="ct_medicine" class="Albendazole" value="Albendazole"/> Albendazole
				    <input type = "checkbox" name="ct_medicine" class="Fenbendazole" value="Fenbendazole" style="margin-left: 43px;"/> Fenbendazole
				    <br/>
				    <input type = "checkbox" name="ct_medicine" class="Mebendazole" value="Mebendazole"/> Mebendazole
				    <input type = "checkbox" name="ct_medicine" class="Flubendazole" value="Flubendazole" style="margin-left: 35px;"/> Flubendazole
				    <br/>
				    <input type = "checkbox" name="ct_medicine" class="Pyrvinium" value="Pyrvinium" /> Pyrvinium
				   </td>
				  </tr>
					<tr>
				   <th> ��� </th>
				   <td>
				   
				   	<!-- ${ct.ct_frequency} = 7�� ���Ӻ��� --> 
				   <script type="text/javascript">
				  	 $(function(){
				  		if(${ct.ct_frequency.equals("7�� ���Ӻ���")}) {
				  			$(".frequency1").attr("selected","selected");
				  		}
				  		if(${ct.ct_frequency.equals("4�� ���� - 3�� �޾�")}) {
				  			$(".frequency2").attr("selected","selected");
				  		}
				  		if(${ct.ct_frequency.equals("3�� ���� - 4�� �޾�")}) {
				  			$(".frequency3").attr("selected","selected");
				  		}
				  		if(${ct.ct_frequency.equals("��Ÿ")}) {
				  			$(".frequency4").attr("selected","selected");
				  		}
				   })
					</script>
				   		
				   	  <select name="ct_frequency">
					  <option value="7�� ���Ӻ���" class="frequency1">7�� ���Ӻ���</option>
					  <option value="4�� ���� - 3�� �޾�" class="frequency2">4�� ���� - 3�� �޾�</option>
					  <option value="3�� ���� - 4�� �޾�" class="frequency3">3�� ���� - 4�� �޾�</option>
					  <option value="��Ÿ" class="frequency4">��Ÿ</option>
					</select>
				   </td>
				  </tr>
				  <tr>
				   <th> ��Ÿ���</th>
				   <td> <input type = "text" name="ct_otherfqc" maxlength="180" placeholder="2�� �̻� �� ����� ���뷮���� �� ���� �ۼ�" value="${ct.ct_otherfqc}"/> </td>
				  </tr>
				   <tr>
				   <tr>
				   <th> ���뷮 (��)</th>
				   <td> 
				   <input type = "text" name="ct_dosage" placeholder="���ڸ� �Է°����մϴ�. ex) 300" value="${ct.ct_dosage}"/> <br>
				   <span style="font-size: xx-small;">*�����๰ �����ڴ� �˺����� ���뷮�� �����ֽð�, �� �ܴ� ��Ÿ����� �ۼ����ּ���.</span>
				   </td>
				  </tr>
				   <tr>
				   <th> ���� ġ��<br>(���� ���� ����)  </th>
				   <td>
				   
				  <!-- ${ct.ct_treatment} = �鿪ġ����, �׾�ȭ�п�� --> 
				   <script type="text/javascript">
				  	 $(function(){
				  		if(${ct.ct_treatment.contains("����")}) {
				  			$(".treatment1").attr("checked","checked");
				  		}
				  		if(${ct.ct_treatment.contains("�鿪ġ����")}) {
				  			$(".treatment2").attr("checked","checked");
				  		}
				  		if(${ct.ct_treatment.contains("�׾�ȭ�п��")}) {
				  			$(".treatment3").attr("checked","checked");
				  		}
				  		if(${ct.ct_treatment.contains("��缱ġ��")}) {
				  			$(".treatment4").attr("checked","checked");
				  		}
				  		if(${ct.ct_treatment.contains("ȣ������")}) {
				  			$(".treatment5").attr("checked","checked");
				  		}
				  		if(${ct.ct_treatment.contains("ǥ��ġ����")}) {
				  			$(".treatment6").attr("checked","checked");
				  		}
				  		if(${ct.ct_treatment.contains("��Ÿ���")}) {
				  			$(".treatment7").attr("checked","checked");
				  		}
				   })
					</script>
				   
				   
				    <input type = "checkbox" name="ct_treatment"  class="treatment1" value="����" /> ����
				    <input type = "checkbox" name="ct_treatment"  class="treatment2"  value="�鿪ġ����" style="margin-left: 91px;"/> �鿪ġ����
				    <br/>
				    <input type = "checkbox" name="ct_treatment"  class="treatment3" value="�׾�ȭ�п��"/> �׾�ȭ�п��
				    <input type = "checkbox"  name="ct_treatment"  class="treatment4" value="��缱ġ��" style="margin-left: 36px;"/> ��缱ġ��
				    <br/>
				    <input type = "checkbox" name="ct_treatment"  class="treatment5" value="ȣ������"/> ȣ������
				    <input type = "checkbox" name="ct_treatment"   class="treatment6" value="ǥ��ġ����" style="margin-left: 50px;"/> ǥ��ġ����
				    <br/>
				    <input type = "checkbox" name="ct_treatment"  class="treatment7" value="��Ÿ���"/> ��Ÿ���
				   </td>
				  </tr>
				  <tr>
				   <th> ������</th>
				   <td> <input type = "text" name="ct_suppliment" value="${ct.ct_suppliment}"/> </td>
				  </tr>
				  <tr>
				   <th> ü�� ����<br/>(���� ��) </th>
				   <td>
				   
				   <!-- ${ct.ct_pain} = �ſ� ��ȭ�� --> 
				   <script type="text/javascript">
				  	 $(function(){
				  		if(${ct.ct_pain.equals("�ſ� ��ȭ��")}) {
				  			$(".pain1").attr("selected","selected");
				  		}
				  		if(${ct.ct_pain.equals("��ȭ��")}) {
				  			$(".pain2").attr("selected","selected");
				  		}
				  		if(${ct.ct_pain.equals("��ȭ ����")}) {
				  			$(".pain3").attr("selected","selected");
				  		}
				  		if(${ct.ct_pain.equals("������")}) {
				  			$(".pain4").attr("selected","selected");
				  		}
				  		if(${ct.ct_pain.equals("�ſ� ������")}) {
				  			$(".pain5").attr("selected","selected");
				  		}
				   })
					</script>
				   
				   	  <select name="ct_pain">
					  <option value="�ſ� ��ȭ��" class="pain1">�ſ� ��ȭ��</option>
					  <option value="��ȭ��" class="pain2">��ȭ��</option>
					  <option value="��ȭ ����" class="pain3">��ȭ ����</option>
					  <option value="������" class="pain4">������</option>
					  <option value="�ſ� ������" class="pain5">�ſ� ������</option>
					</select>
				   </td>
				  </tr>
				   <tr>
				   <th> ��¡��Ƿε�<br/>(���� ��) </th>
				   <td>
				   
				   <!-- ${ct.ct_fatigue} = �ſ� ��ȭ�� --> 
				   <script type="text/javascript">
				  	 $(function(){
				  		if(${ct.ct_fatigue.equals("�ſ� ��ȭ��")}) {
				  			$(".fatigue1").attr("selected","selected");
				  		}
				  		if(${ct.ct_fatigue.equals("��ȭ��")}) {
				  			$(".fatigue2").attr("selected","selected");
				  		}
				  		if(${ct.ct_fatigue.equals("��ȭ ����")}) {
				  			$(".fatigue3").attr("selected","selected");
				  		}
				  		if(${ct.ct_fatigue.equals("������")}) {
				  			$(".fatigue4").attr("selected","selected");
				  		}
				  		if(${ct.ct_fatigue.equals("�ſ� ������")}) {
				  			$(".fatigue5").attr("selected","selected");
				  		}
				   })
					</script>
				   		
				   	  <select name="ct_fatigue">
					  <option value="�ſ� ��ȭ��" class="fatigue1">�ſ� ��ȭ��</option>
					  <option value="��ȭ��" class="fatigue2">��ȭ��</option>
					  <option value="��ȭ ����"  class="fatigue3">��ȭ ����</option>
					  <option value="������" class="fatigue4">������</option>
					  <option value="�ſ� ������" class="fatigue5">�ſ� ������</option>
					</select>
				   </td>
				  </tr>
				  <tr>
				   <th> ���ۿ롤�ǽ�����</th>
				   <td> <input type = "text" name="ct_side_effect" maxlength="180" value="${ct.ct_side_effect}"/> </td>
				  </tr>
				  <tr>
				   <th> ���� ũ�� ��ȭ<br> (�˻��� ���)</th>
				   <td> 
				  	 <input type = "text" name="ct_tumor_size" maxlength="180"  placeholder="'�پ�����' Ȥ�� 'Ŀ����'�� �����ؼ� �ۼ����ּ���." value="${ct.ct_tumor_size}"/> 
				  	 <br>
				  	 <span style="font-size: xx-small;">*ex) 1cm���� 0.9cm�� �پ�����</span>
				   </td>
				  </tr>
				 <tr>
				   <th> ���� ��ġ ��ȭ<br> (�˻��� ���)</th>
				   <td> 
				   <input type = "text" name="ct_blood_test" maxlength="180" placeholder="'��������' Ȥ�� '��������'�� �����ؼ� �ۼ����ּ���." value="${ct.ct_blood_test}"/> 
				   <br>
				   <span style="font-size: xx-small;">*ex) �ǰ˻� ��ġ�� 270���� 190���� ��������</span>
				   </td>
				  </tr>
				  
				</table>
				
				
				
				<!-- 
				<table boder = "1px solid gray" cellspacing = "1" class="onco_form_table" >
				  <tr>
				   <th>���̵� </th>
				   <td> 
				   <input type = "text" name="mem_id" class="short_blank" readonly value="${mem.mem_id}"  style="background-color: lightgray"/><br>
				   </td>
				  </tr>
				  <tr>
				   <th> ��й�ȣ </th>
				   <td> **** </td>
				  </tr>
				  <tr>
				   <th> �̸� </th>
				   <td> <input type = "text" name="mem_name" value="${mem.mem_name}"/> </td>
				  </tr>
				  <tr>
				   <th> �г��� </th>
				   <td> <input type = "text" name="mem_nickname" value="${mem.mem_nickname}"/><br> <input type = "button" value = "�ߺ�Ȯ��"/></td>
				  </tr>
				  <tr>
				   <th> ������� </th>
				   <td> <input type='text' name='mem_dateofbirth' value="${mem.mem_dateofbirth}"/> </td>
				  </tr>
				  <tr>
				   <th> ���� </th>
				   <td style="text-align: center"> 

				   	<input type="radio" name="mem_gender" value ="M"
					${mem.mem_gender.equals("M")?"checked":""}>��(M)
					mem��ü���� getGender()���� �� return value�� M�̸� checked ó���ϰ� �ƴϸ� �Ѿ��
					<input type="radio" name="mem_gender" value ="F" style="margin-left: 80px"
					${mem.mem_gender.equals("F")?"checked":"" }>��(F)
				   </td>
				  </tr>
				  <tr>
				   <th> ���ܸ� </th>
				   <td> <input type = "text" name="mem_diagnosis" value="${mem.mem_diagnosis}"/> </td>
				  </tr>
				  <tr>
				   <th> �������� </th>
				   <td> <input type='text' name='mem_dgdate'  value="${mem.mem_dgdate}"/> </td>
				  </tr>
				  <tr>
				   <th> ���պ��� </th>
				   <td>
				   	  <select name="mem_stage">
					  <option value="1" <c:if test = "${mem.mem_stage eq '1'}"> selected="selected"</c:if> >1</option>
					  <option value="2" <c:if test = "${mem.mem_stage eq '2'}"> selected="selected"</c:if> >2</option>
					  <option value="3" <c:if test = "${mem.mem_stage eq '3'}"> selected="selected"</c:if> >3</option>
					  <option value="4" <c:if test = "${mem.mem_stage eq '4'}"> selected="selected"</c:if> >4</option>
					  <option value="����" <c:if test = "${mem.mem_stage eq '����'}"> selected="selected"</c:if> >����</option>
					</select>
				   </td>
				  </tr>
				  <tr>
				   <th> ���ܼ� </th>
				   ����Ƴ� <td>	 <input type="file" name="mem_docs" value="${mem.mem_docs}"/></td>
				   	 <td style="text-align: left"> 
				    <c:if test="${!empty mem.mem_docs}">
				   	 <div id="file_desc">${mem.mem_docs}
				     	<a href="javascript:file_delete()">[÷������ ����]</a>
				     </div>
				     </c:if> 
				    	<input type="file" name="mem_docs">
				    </td> 
				   
				  </tr>
				   <tr>
				   <th> ���� </th>
				   <td> <input type = "text" name="mem_hospital"value="${mem.mem_hospital}"/> </td>
				  </tr>

				</table>-->
				
				<input type="submit" value="�����ϱ�" class="btn_group">
				<br>
				<button  onClick="history.go(-1)">���ư���</button>
				 </form>
				
			</div>
			
			
			
		</div>
	</div>
	
</body>
</html>
