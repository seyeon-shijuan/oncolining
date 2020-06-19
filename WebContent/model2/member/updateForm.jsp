<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원 수정</title>
<link rel="stylesheet" href="../../css/joinform.css"> 
<script type="text/javascript">
function file_delete() { 
	  document.f.mem_docs.value=""; 
	  file_desc.style.display="none"; 
 } 
function inputcheck(f) {
	<c:if test="${sessionScope.login !='admin'}">
		if(f.pass.value == "") {
		alert("비밀번호를 입력하세요");
	f.pass.focus();
	return false;
		}
	</c:if>
	}

// 패스워드 고치기 함수 만든다.
function win_passchg() {
	var op="width=500, height=250, left=50, top=150";
	open("passwordForm.jsp","",op);
}
// 사진수정하면서 새로 생긴 function
function win_upload(){
	var op = "width=500,height=150,left=50,top=150";
	open("pictureForm.jsp","",op);
	// open: pictureForm.jsp가 열림
}

</script>
</head>
<body>

	
	
	<!-- 회원가입 복사 -->
	<div class="onco_form_outer_frame">
		<div class="onco_form_inner_frame">
			<div>
			
				<img src="../../img/small_logo.JPG"/>
				<br><br>
				회원 정보 수정
				<br><br>
			</div>
			
			
			<div>
				<!-- 회원가입 항목-->
				<form action="update.me" name="f" method="post" enctype="multipart/form-data" class ="table_form" onsubmit="return inputcheck(this)">
				<input type="hidden" name="mem_docs" value="${mem.mem_docs}"> <!-- 첨부파일 이름이 들어간다. --> 
				<table boder = "1px solid gray" cellspacing = "1" class="onco_form_table" >
				  <tr>
				   <th>아이디 </th>
				   <td> 
				   <input type = "text" name="mem_id" class="short_blank" readonly value="${mem.mem_id}"  style="background-color: lightgray"/><br>
				   </td>
				  </tr>
				  <tr>
				   <th> 비밀번호 </th>
				   <td> **** </td>
				  </tr>
				  <tr>
				   <th> 이름 </th>
				   <td> <input type = "text" name="mem_name" value="${mem.mem_name}"/> </td>
				  </tr>
				  <tr>
				   <th> 닉네임 </th>
				   <td> <input type = "text" name="mem_nickname" value="${mem.mem_nickname}"/><br> <input type = "button" value = "중복확인"/></td>
				  </tr>
				  <tr>
				   <th> 생년월일 </th>
				   <td> <input type='text' name='mem_dateofbirth' value="${mem.mem_dateofbirth}"/> </td>
				  </tr>
				  <tr>
				   <th> 성별 </th>
				   <td style="text-align: center"> 

				   	<input type="radio" name="mem_gender" value ="M"
					${mem.mem_gender.equals("M")?"checked":""}>남(M)
					<!-- mem객체에서 getGender()했을 때 return value가 M이면 checked 처리하고 아니면 넘어가자 -->
					<input type="radio" name="mem_gender" value ="F" style="margin-left: 80px"
					${mem.mem_gender.equals("F")?"checked":"" }>여(F)
				   </td>
				  </tr>
				  <tr>
				   <th> 진단명 </th>
				   <td> <input type = "text" name="mem_diagnosis" value="${mem.mem_diagnosis}"/> </td>
				  </tr>
				  <tr>
				   <th> 진단일자 </th>
				   <td> <input type='text' name='mem_dgdate'  value="${mem.mem_dgdate}"/> </td>
				  </tr>
				  <tr>
				   <th> 종합병기 </th>
				   <td>
				   	  <select name="mem_stage">
					  <option value="1" <c:if test = "${mem.mem_stage eq '1'}"> selected="selected"</c:if> >1</option>
					  <option value="2" <c:if test = "${mem.mem_stage eq '2'}"> selected="selected"</c:if> >2</option>
					  <option value="3" <c:if test = "${mem.mem_stage eq '3'}"> selected="selected"</c:if> >3</option>
					  <option value="4" <c:if test = "${mem.mem_stage eq '4'}"> selected="selected"</c:if> >4</option>
					  <option value="말기" <c:if test = "${mem.mem_stage eq '말기'}"> selected="selected"</c:if> >말기</option>
					</select>
				   </td>
				  </tr>
				  <tr>
				   <th> 진단서 </th>
				   <!-- <td>	 <input type="file" name="mem_docs" value="${mem.mem_docs}"/></td> -->
				   	 <td style="text-align: left"> 
				    <c:if test="${!empty mem.mem_docs}">
				   	 <div id="file_desc">${mem.mem_docs}
				     	<a href="javascript:file_delete()">[첨부파일 삭제]</a>
				     </div>
				     </c:if> 
				    	<input type="file" name="mem_docs">
				    </td> 
				   
				  </tr>
				   <tr>
				   <th> 병원 </th>
				   <td> <input type = "text" name="mem_hospital"value="${mem.mem_hospital}"/> </td>
				  </tr>

				</table>
				<input type="submit" value="수정하기" class="btn_group">
				<br>
				 </form>
				
			</div>
			
			
			
		</div>
	</div>
	
</body>
</html>
