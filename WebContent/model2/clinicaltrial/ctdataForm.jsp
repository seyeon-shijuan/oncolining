<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ������</title>
<!-- <link rel="stylesheet" href="../../css/main.css"> -->
<style type="text/css">
	.style{display: inline;}
	.onco_form_outer_frame{padding-top: 100px;}
	/*login frame with shade*/
	.onco_form_inner_frame{
	/*border: 1px solid lightgray;*/
	height: auto;
	width: 600px;
	Text-align: center;
	box-shadow: 0px 0px 8px lightgray;
	padding: 50px 0 50px 0;
	margin-left: auto;
	margin-right: auto;
	}
	.btn_group {
		border: 1px solid red; background-color: red; color: white;
		width: 405px; height: 40px;
		margin: 20px 0 20px 0;
	}
	.id_section {
		text-align: left;
		padding: 0 50px 0 50px;
		margin: 0 0 50px 0;
	}
	.password_section{
		text-align: left;
		padding: 0 50px 0 50px;
		margin: 0 0 50px 0;
	}
	.id_pw_frame{margin: 20px 0 0 0;}
	

	/*ȸ������ ���̺�*/
	input[type=text],input[type=password] { width: 300px; height: 35px;}
	td, tr, th { text-align: left; width : auto; padding: 15px;}
	
	
   table{
		margin-left: auto;
		margin-right: auto;
		
	}
	
	/*!ȸ������ ���̺�*/
</style>
<!--�ڡ� ���⵵ ���� ���� �ڡ�-->
<script type="text/javascript">
function win_upload(){
	var op = "width=500,height=150,left=50,top=150";
	open("pictureForm.me","",op);
	// open: pictureForm.me�� ����
}
</script>
</head>
<body>
<%--
<form action="join.me" name="f" method="post">
	<!-- former -->
	<input type="hidden" name="picture" value=""> <!-- with picture�� �̹��� �̸��� ����. --> 
	<table><tr><td rowspan="4" valign="bottom">
	<img src="" width="100" height="120" id="pic"><br> <!-- with picture.jsp -->
	
	<font size="1"><a href="javascript:win_upload()">�������</a></font>
	<!-- �ڡ�javascript:win_upload() �߰��� for thumbnail.jsp �ڡ� -->
	
	</td><th>���̵�</th><td><input type="text" name="id"></td></tr>
	<tr><th>��й�ȣ</th><td><input type="password" name="pass"></td></tr>
	<tr><th>�̸�</th><td><input type="text" name="name"></td></tr>
	
	<tr><th>����</th><td>
	<input type="radio" name="gender" value="1" checked>��
	<input type="radio" name="gender" value="2" >��</td></tr>
	<tr><th>��ȭ��ȣ</th><td colspan="2"><input type="text" name="tel"></td></tr>
	<tr><th>�̸���</th><td colspan="2"><input type="text" name="email"></td></tr>
	<tr><td colspan="3"><input type="submit" value="ȸ������"></td>
	</table>
	<!-- /former -->
	 --%>
	 
	<div class="onco_form_outer_frame">
		<div class="onco_form_inner_frame">
			<div>
				
				<img src="../../img/small_logo.JPG"/>
				<br>
				�ӻ�ȸ�� �����ϱ�
				<br><br>
			</div>
			
			
			<div>
				<!-- ȸ������ �׸� -->
				<form action="join.me" name="f" method="post" class ="table_form">
				<input type="hidden" name="mem_docs" value=""> <!-- ÷������ �̸��� ����. --> 
				<table boder = "1px solid gray" cellspacing = "1" class="onco_form_table" >
				  <tr>
				   <th>���̵� </th>
				   <td> 
				   <input type = "text" name="mem_id"/>
				   <input type = "button" value = "�ߺ�Ȯ��"/>
				   </td>
				  </tr>
				  <tr>
				   <th> ��й�ȣ </th>
				   <td> <input type = "password" name="mem_pass"/> </td>
				  </tr>
				  <tr>
				   <th> ��й�ȣ Ȯ�� </th>
				   <td> <input type = "password" name="mem_pass2"/>&nbsp;<br>*��й�ȣ�� �ٽ� �Է����ּ���. </td>
				  </tr>
				  <tr>
				   <th> �̸� </th>
				   <td> <input type = "text" name="mem_name"/> </td>
				  </tr>
				  <tr>
				   <th> �г��� </th>
				   <td> <input type = "text" name="mem_nickname"/> </td>
				  </tr>
				  <tr>
				   <th> ������� </th>
				   <td> <input type='date' name='mem_birthdate'/> </td>
				  </tr>
				  <tr>
				   <th> ���� </th>
				   <td style="text-align: center"> 
				    <input type = "radio" name = "mem_gender"/ checked > ��(M)
				    <input type = "radio" name = "mem_gender"/ style="margin-left: 80px"> ��(F)
				   </td>
				  </tr>
				  <tr>
				   <th> ���ܸ� </th>
				   <td> <input type = "text" name="mem_diagnosis"/> </td>
				  </tr>
				  <tr>
				   <th> �������� </th>
				   <td> <input type='date' name='mem_dgdate'/> </td>
				  </tr>
				  <tr>
				   <th> ���պ��� </th>
				   <td>
				   	  <select name="mem_stage">
					  <option value="1" selected="selected">1</option>
					  <option value="2">2</option>
					  <option value="3">3</option>
					  <option value="4">4</option>
					  <option value="����">����</option>
					</select>
				   </td>
				  </tr>
				  <tr>
				   <th> ���ܼ� </th>
				   <td> <input type="file" name="mem_docs"/> </td>
				  </tr>
				   <tr>
				   <th> ���� </th>
				   <td> <input type = "text" name="mem_hospital"/> </td>
				  </tr>
				  
				  <!-- 
				  <tr>
				   <td> �̸��� </td>
				   <td>
				    <input type = "text"/> @ <input type = "text"/> &nbsp;&nbsp; 
				    <select>
				     <option> �����Է� </option>
				     <option> naver.com </option>
				     <option> daum.net </option>
				     <option> nate.com </option>
				    </select>
				   </td>
				  </tr>
				  <tr>
				   <td> �ּ� </td>
				   <td>
				    <input type = "text"/>
				    <input type = "button" value = "�ּ�ã��"/>
				   </td>
				  </tr>
				  <tr>
				   <td> ���ּ� </td>
				   <td>
				    <input type = "text"/>
				   </td>
				  </tr>
				  <tr>
				   <td> �޴��� </td>
				   <td> 
				    <input type = "radio" name = "phone"/> SKT 
				    <input type = "radio" name = "phone"/> KTF 
				    <input type = "radio" name = "phone"/> LGU+
				   <br/>
				    <select>
				     <option> 010 </option>
				     <option> 011 </option>
				     <option> 016 </option>
				     <option> 018 </option>
				    </select> 
				    <input type = "text" size = "6"/> - <input type = "text" size = "6"/>
				   </td>
				  </tr>
				  <tr>
				   <td> ����  </td>
				   <td>
				    <input type = "checkbox"/> ������
				    <input type = "checkbox"/> ������
				    <input type = "checkbox"/> SUV
				    <input type = "checkbox"/> ����
				    <input type = "checkbox"/> LPG
				   </td>
				  </tr>
				  <tr>
				   <td> �ڱ�Ұ�  </td>
				   <td>
				    <textarea cols = "60" rows = "10"></textarea>
				   </td>
				  </tr>
				   -->
				</table>
				 </form>
				<!-- /ȸ������ �׸� -->
			</div>
			<input type="submit" value="ȸ������" class="btn_group">
			<br>
			
			
		</div>
	</div>

</form>
</body>
</html>