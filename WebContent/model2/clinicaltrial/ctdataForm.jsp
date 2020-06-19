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
<title>임상 시험 : 주간 복용 일지 입력</title>
<link rel="stylesheet" href="../../css/joinform.css"> 
<style type="text/css">

</style>
<!--★★ 여기도 새로 생김 ★★-->
<script type="text/javascript">

</script>
</head>
<body>
	 
	<div class="onco_form_outer_frame">
		<div class="onco_form_inner_frame">
			<div>
				
				<img src="../../img/small_logo.JPG"/>
				<br>
				주간 복용 일지 입력하기
				<br><br>
			</div>
			
			
			<div>
				<!-- 회원가입 항목 -->
				<form action="ctdata.me" name="f" method="post" class ="table_form">
				<input type="hidden" name="mem_id" value="${mem.mem_id}"> <!-- id가 foreign key라서 -->
				
				
				<table class="onco_form_table" >
				  <tr>
				   <th> 닉네임 </th>
				   <td> <input type = "text" name="mem_nickname" class="short_blank" readonly value="${mem.mem_nickname}"  style="background-color: #F6F6F6"/> </td>
				  </tr>
				  <tr>
				   <th> 만 나이 </th>
				   <td> <input type = "text" name="ct_age"/> </td>
				  </tr>
				  <tr>
				   <th> 성별 </th>
				   <td> <input type = "text" name="mem_gender" readonly value="${mem.mem_gender}"  style="background-color: #F6F6F6"/> </td>
				  </tr>
				  <tr>
				   <th> 진단명 </th>
				   <td> <input type = "text" name="mem_diagnosis" readonly value="${mem.mem_diagnosis}"  style="background-color: #F6F6F6"/> </td>
				  </tr>
				  <tr>
				   <th> 종합 병기 </th>
				   <td><input type = "text" name="mem_stage" readonly value="${mem.mem_stage}"  style="background-color: #F6F6F6"/>  </td>
				  </tr>
				  <tr>
				   <th> 복용 주차</th>
				   <td> <input type = "text" name="ct_week"/> </td>
				  </tr>
				  <tr>
				   <th> 복용 약물<br>(복수 선택 가능)  </th>
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
				   <th> 용법 </th>
				   <td>
				   	  <select name="ct_frequency">
					  <option value="7일 연속복용" selected="selected">7일 연속복용</option>
					  <option value="4일 복용 - 3일 휴약">4일 복용 - 3일 휴약</option>
					  <option value="3일 복용 - 4일 휴약">3일 복용 - 4일 휴약</option>
					  <option value="기타">기타</option>
					</select>
				   </td>
				  </tr>
				  <tr>
				   <th> 기타용법</th>
				   <td> <input type = "text" name="ct_otherfqc"/> </td>
				  </tr>
				   <tr>
				   <tr>
				   <th> 복용량</th>
				   <td> <input type = "text" name="ct_dosage"/> </td>
				  </tr>
				   <tr>
				   <th> 병행 치료<br>(복수 선택 가능)  </th>
				   <td>
				    <input type = "checkbox" name="ct_treatment" value="없음" /> 없음
				    <input type = "checkbox" name="ct_treatment" value="면역치료요법" style="margin-left: 91px;"/> 면역치료요법
				    <br/>
				    <input type = "checkbox" name="ct_treatment" value="항암화학요법"/> 항암화학요법
				    <input type = "checkbox"  name="ct_treatment" value="방사선치료" style="margin-left: 36px;"/> 방사선치료
				    <br/>
				    <input type = "checkbox" name="ct_treatment" value="호르몬요법"/> 호르몬요법
				    <input type = "checkbox" name="ct_treatment"  value="표적치료제" style="margin-left: 50px;"/> 표적치료제
				    <br/>
				    <input type = "checkbox" name="ct_treatment" value="기타요법"/> 기타요법
				   </td>
				  </tr>
				  <tr>
				   <th> 보충제</th>
				   <td> <input type = "text" name="ct_suppliment"/> </td>
				  </tr>
				  <tr>
				   <th> 체감 통증<br/>(복용 후) </th>
				   <td>
				   	  <select name="ct_pain">
					  <option value="매우 악화됨" >매우 악화됨</option>
					  <option value="악화됨" >악화됨</option>
					  <option value="변화 없음" selected="selected">변화 없음</option>
					  <option value="개선됨" >개선됨</option>
					  <option value="매우 개선됨" >매우 개선됨</option>
					</select>
				   </td>
				  </tr>
				   <tr>
				   <th> 기력·피로도<br/>(복용 후) </th>
				   <td>
				   	  <select name="ct_fatigue">
					  <option value="매우 악화됨">매우 악화됨</option>
					  <option value="악화됨">악화됨</option>
					  <option value="변화 없음" selected="selected">변화 없음</option>
					  <option value="개선됨">개선됨</option>
					  <option value="매우 개선됨">매우 개선됨</option>
					</select>
				   </td>
				  </tr>
				  <tr>
				   <th> 부작용·의심증상</th>
				   <td> <input type = "text" name="ct_side_effect"/> </td>
				  </tr>
				  <tr>
				   <th> 종양 크기 변화<br> (검사한 경우)</th>
				   <td> <input type = "text" name="ct_tumor_size"/> </td>
				  </tr>
				 <tr>
				   <th> 종양 수치 변화<br> (검사한 경우)</th>
				   <td> <input type = "text" name="ct_blood_test"/> </td>
				  </tr>
				  
				</table>
				<input type="submit" value="저장하기" class="btn_group">
				 </form>
				<!-- /회원가입 항목 -->
			</div>
			
			<br>
			<button  onclick="location.href='../member/main.me'">돌아가기</button>
			
		</div>
	</div>

</form>
</body>
</html>