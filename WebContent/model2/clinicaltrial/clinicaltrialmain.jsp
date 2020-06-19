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
이 페이지를 me로 들어가면
action.properties에
/model2/clinicaltrial/clinicaltrialmain.me=action.clinicaltrial.ClinicaltrialmainAction
있다. - > 로그인 확인하고 켜진다.
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>임상시험</title>
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
		<span class="spantag">임상시험<br><br></span>
		
		
		<!-- main contents -->
		<div class="main_contents">
			<!-- clinical trial data section -->
			<div class="two-divs" style="overflow:scroll; white-space:nowrap; width:57%; height:600px; padding: 1%; background-color:#CECECE; float:left;">
			
				<table>
					<tr>
						<th>No.</th><th>닉네임</th><th>만 나이</th><th>성별</th><th>진단명</th><th>종합병기</th><th>복용주차</th><th>복용약물</th><th>용법</th>
						<th>기타용법</th><th>복용량</th><th>병행치료</th><th>보충제</th><th>체감통증</th><th>기력·피로도</th><th>부작용·의심증상</th>
						<th>종양크기변화</th><th>종양수치변화</th>
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
		
		<button type="button" onclick="location.href='updateForm.me?mem_id=${mem.mem_id}' " class="btn_group">회원정보 수정</button>
		

		<c:if test="${param.id != 'admin' && sessionScope.login != 'admin'}">
		<button type="button" onclick="location.href='deleteForm.me?mem_id=${mem.mem_id}' " class="btn_group">회원 탈퇴</button>
		</c:if>
		
		
	</div> <!-- /inner frame -->
</div>
</body>
</html>


