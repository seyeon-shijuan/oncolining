<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ȸ�� ����</title>
<link rel="stylesheet" href="../../css/joinform.css"> 
<script type="text/javascript">
function file_delete() { 
	  document.f.mem_docs.value=""; 
	  file_desc.style.display="none"; 
 } 
function inputcheck(f) {
	<c:if test="${sessionScope.login !='admin'}">
		if(f.pass.value == "") {
		alert("��й�ȣ�� �Է��ϼ���");
	f.pass.focus();
	return false;
		}
	</c:if>
	}

// �н����� ��ġ�� �Լ� �����.
function win_passchg() {
	var op="width=500, height=250, left=50, top=150";
	open("passwordForm.jsp","",op);
}
// ���������ϸ鼭 ���� ���� function
function win_upload(){
	var op = "width=500,height=150,left=50,top=150";
	open("pictureForm.jsp","",op);
	// open: pictureForm.jsp�� ����
}

</script>
</head>
<body>

	
	
	<!-- ȸ������ ���� -->
	<div class="onco_form_outer_frame">
		<div class="onco_form_inner_frame">
			<div>
			
				<img src="../../img/small_logo.JPG"/>
				<br><br>
				ȸ�� ���� ����
				<br><br>
			</div>
			
			
			<div>
				<!-- ȸ������ �׸�-->
				<form action="update.me" name="f" method="post" enctype="multipart/form-data" class ="table_form" onsubmit="return inputcheck(this)">
				<input type="hidden" name="mem_docs" value="${mem.mem_docs}"> <!-- ÷������ �̸��� ����. --> 
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
					<!-- mem��ü���� getGender()���� �� return value�� M�̸� checked ó���ϰ� �ƴϸ� �Ѿ�� -->
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
				   <!-- <td>	 <input type="file" name="mem_docs" value="${mem.mem_docs}"/></td> -->
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

				</table>
				<input type="submit" value="�����ϱ�" class="btn_group">
				<br>
				 </form>
				
			</div>
			
			
			
		</div>
	</div>
	
</body>
</html>
