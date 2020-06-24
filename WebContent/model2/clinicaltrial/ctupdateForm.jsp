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
<title>주간임상일지 수정</title>
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../css/joinform.css"> 
<script type="text/javascript">
function inputcheck(f) {
	<c:if test="${sessionScope.login !='admin'}">
		if(f.pass.value == "") {
		alert("비밀번호를 입력하세요");
	f.pass.focus();
	return false;
		}
	</c:if>
	}

</script>
</head>
<body>

	
	
	<!-- 기본 div -->
	<div class="onco_form_outer_frame">
		<div class="onco_form_inner_frame">
			<div>
			
				<img src="../../img/small_logo.JPG"/>
				<br><br>
				주간임상일지 데이터 수정
				<br><br>
			</div>
			
			
			<div>
				<!-- 임상입력 항목-->
				<form action="ctupdate.me" name="f" method="post" class ="table_form" onsubmit="return inputcheck(this)">
				<input type="hidden" name="mem_id" value="${ct.mem_id}"> <!-- id가 foreign key라서 -->
				<input type="hidden" name="ct_datano" value="${ct.ct_datano}">
				
				<table class="onco_form_table" >
				  <tr>
				   <th> 닉네임 </th>
				   <td> <input type = "text" name="mem_nickname" class="short_blank" readonly value="${ct.mem_nickname}"  style="background-color: #F6F6F6"/> </td>
				  </tr>
				  <tr>
				   <th> 만 나이 </th>
				   <td> <input type = "text" name="ct.ct_age" value="${ct.ct_age}"/> </td>
				  </tr>
				  <tr>
				   <th> 성별 </th>
				   <td> <input type = "text" name="mem_gender" readonly value="${ct.mem_gender}"  style="background-color: #F6F6F6"/> </td>
				  </tr>
				  <tr>
				   <th> 진단명 </th>
				   <td> <input type = "text" name="mem_diagnosis" readonly value="${ct.mem_diagnosis}"  style="background-color: #F6F6F6"/> </td>
				  </tr>
				  <tr>
				   <th> 종합 병기 </th>
				   <td><input type = "text" name="mem_stage" readonly value="${ct.mem_stage}"  style="background-color: #F6F6F6"/>  </td>
				  </tr>
				  <tr>
				   <th> 복용 주차</th>
				   <td> <input type = "text" name="ct_week" value="${ct.ct_week}"/> </td>
				  </tr>
				  <tr>
				   <th> 복용 약물<br>(복수 선택 가능)  </th>
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
				   <th> 용법 </th>
				   <td>
				   
				   	<!-- ${ct.ct_frequency} = 7일 연속복용 --> 
				   <script type="text/javascript">
				  	 $(function(){
				  		if(${ct.ct_frequency.equals("7일 연속복용")}) {
				  			$(".frequency1").attr("selected","selected");
				  		}
				  		if(${ct.ct_frequency.equals("4일 복용 - 3일 휴약")}) {
				  			$(".frequency2").attr("selected","selected");
				  		}
				  		if(${ct.ct_frequency.equals("3일 복용 - 4일 휴약")}) {
				  			$(".frequency3").attr("selected","selected");
				  		}
				  		if(${ct.ct_frequency.equals("기타")}) {
				  			$(".frequency4").attr("selected","selected");
				  		}
				   })
					</script>
				   		
				   	  <select name="ct_frequency">
					  <option value="7일 연속복용" class="frequency1">7일 연속복용</option>
					  <option value="4일 복용 - 3일 휴약" class="frequency2">4일 복용 - 3일 휴약</option>
					  <option value="3일 복용 - 4일 휴약" class="frequency3">3일 복용 - 4일 휴약</option>
					  <option value="기타" class="frequency4">기타</option>
					</select>
				   </td>
				  </tr>
				  <tr>
				   <th> 기타용법</th>
				   <td> <input type = "text" name="ct_otherfqc" maxlength="180" placeholder="2개 이상 약 복용시 복용량까지 이 곳에 작성" value="${ct.ct_otherfqc}"/> </td>
				  </tr>
				   <tr>
				   <tr>
				   <th> 복용량 (일)</th>
				   <td> 
				   <input type = "text" name="ct_dosage" placeholder="숫자만 입력가능합니다. ex) 300" value="${ct.ct_dosage}"/> <br>
				   <span style="font-size: xx-small;">*복수약물 복용자는 알벤다졸 복용량을 적어주시고, 그 외는 기타용법에 작성해주세요.</span>
				   </td>
				  </tr>
				   <tr>
				   <th> 병행 치료<br>(복수 선택 가능)  </th>
				   <td>
				   
				  <!-- ${ct.ct_treatment} = 면역치료요법, 항암화학요법 --> 
				   <script type="text/javascript">
				  	 $(function(){
				  		if(${ct.ct_treatment.contains("없음")}) {
				  			$(".treatment1").attr("checked","checked");
				  		}
				  		if(${ct.ct_treatment.contains("면역치료요법")}) {
				  			$(".treatment2").attr("checked","checked");
				  		}
				  		if(${ct.ct_treatment.contains("항암화학요법")}) {
				  			$(".treatment3").attr("checked","checked");
				  		}
				  		if(${ct.ct_treatment.contains("방사선치료")}) {
				  			$(".treatment4").attr("checked","checked");
				  		}
				  		if(${ct.ct_treatment.contains("호르몬요법")}) {
				  			$(".treatment5").attr("checked","checked");
				  		}
				  		if(${ct.ct_treatment.contains("표적치료제")}) {
				  			$(".treatment6").attr("checked","checked");
				  		}
				  		if(${ct.ct_treatment.contains("기타요법")}) {
				  			$(".treatment7").attr("checked","checked");
				  		}
				   })
					</script>
				   
				   
				    <input type = "checkbox" name="ct_treatment"  class="treatment1" value="없음" /> 없음
				    <input type = "checkbox" name="ct_treatment"  class="treatment2"  value="면역치료요법" style="margin-left: 91px;"/> 면역치료요법
				    <br/>
				    <input type = "checkbox" name="ct_treatment"  class="treatment3" value="항암화학요법"/> 항암화학요법
				    <input type = "checkbox"  name="ct_treatment"  class="treatment4" value="방사선치료" style="margin-left: 36px;"/> 방사선치료
				    <br/>
				    <input type = "checkbox" name="ct_treatment"  class="treatment5" value="호르몬요법"/> 호르몬요법
				    <input type = "checkbox" name="ct_treatment"   class="treatment6" value="표적치료제" style="margin-left: 50px;"/> 표적치료제
				    <br/>
				    <input type = "checkbox" name="ct_treatment"  class="treatment7" value="기타요법"/> 기타요법
				   </td>
				  </tr>
				  <tr>
				   <th> 보충제</th>
				   <td> <input type = "text" name="ct_suppliment" value="${ct.ct_suppliment}"/> </td>
				  </tr>
				  <tr>
				   <th> 체감 통증<br/>(복용 후) </th>
				   <td>
				   
				   <!-- ${ct.ct_pain} = 매우 악화됨 --> 
				   <script type="text/javascript">
				  	 $(function(){
				  		if(${ct.ct_pain.equals("매우 악화됨")}) {
				  			$(".pain1").attr("selected","selected");
				  		}
				  		if(${ct.ct_pain.equals("악화됨")}) {
				  			$(".pain2").attr("selected","selected");
				  		}
				  		if(${ct.ct_pain.equals("변화 없음")}) {
				  			$(".pain3").attr("selected","selected");
				  		}
				  		if(${ct.ct_pain.equals("개선됨")}) {
				  			$(".pain4").attr("selected","selected");
				  		}
				  		if(${ct.ct_pain.equals("매우 개선됨")}) {
				  			$(".pain5").attr("selected","selected");
				  		}
				   })
					</script>
				   
				   	  <select name="ct_pain">
					  <option value="매우 악화됨" class="pain1">매우 악화됨</option>
					  <option value="악화됨" class="pain2">악화됨</option>
					  <option value="변화 없음" class="pain3">변화 없음</option>
					  <option value="개선됨" class="pain4">개선됨</option>
					  <option value="매우 개선됨" class="pain5">매우 개선됨</option>
					</select>
				   </td>
				  </tr>
				   <tr>
				   <th> 기력·피로도<br/>(복용 후) </th>
				   <td>
				   
				   <!-- ${ct.ct_fatigue} = 매우 악화됨 --> 
				   <script type="text/javascript">
				  	 $(function(){
				  		if(${ct.ct_fatigue.equals("매우 악화됨")}) {
				  			$(".fatigue1").attr("selected","selected");
				  		}
				  		if(${ct.ct_fatigue.equals("악화됨")}) {
				  			$(".fatigue2").attr("selected","selected");
				  		}
				  		if(${ct.ct_fatigue.equals("변화 없음")}) {
				  			$(".fatigue3").attr("selected","selected");
				  		}
				  		if(${ct.ct_fatigue.equals("개선됨")}) {
				  			$(".fatigue4").attr("selected","selected");
				  		}
				  		if(${ct.ct_fatigue.equals("매우 개선됨")}) {
				  			$(".fatigue5").attr("selected","selected");
				  		}
				   })
					</script>
				   		
				   	  <select name="ct_fatigue">
					  <option value="매우 악화됨" class="fatigue1">매우 악화됨</option>
					  <option value="악화됨" class="fatigue2">악화됨</option>
					  <option value="변화 없음"  class="fatigue3">변화 없음</option>
					  <option value="개선됨" class="fatigue4">개선됨</option>
					  <option value="매우 개선됨" class="fatigue5">매우 개선됨</option>
					</select>
				   </td>
				  </tr>
				  <tr>
				   <th> 부작용·의심증상</th>
				   <td> <input type = "text" name="ct_side_effect" maxlength="180" value="${ct.ct_side_effect}"/> </td>
				  </tr>
				  <tr>
				   <th> 종양 크기 변화<br> (검사한 경우)</th>
				   <td> 
				  	 <input type = "text" name="ct_tumor_size" maxlength="180"  placeholder="'줄어들었음' 혹은 '커졌음'을 포함해서 작성해주세요." value="${ct.ct_tumor_size}"/> 
				  	 <br>
				  	 <span style="font-size: xx-small;">*ex) 1cm에서 0.9cm로 줄어들었음</span>
				   </td>
				  </tr>
				 <tr>
				   <th> 종양 수치 변화<br> (검사한 경우)</th>
				   <td> 
				   <input type = "text" name="ct_blood_test" maxlength="180" placeholder="'감소했음' 혹은 '증가했음'을 포함해서 작성해주세요." value="${ct.ct_blood_test}"/> 
				   <br>
				   <span style="font-size: xx-small;">*ex) 피검사 수치가 270에서 190으로 감소했음</span>
				   </td>
				  </tr>
				  
				</table>
				
				
				
				<!-- 
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
					mem객체에서 getGender()했을 때 return value가 M이면 checked 처리하고 아니면 넘어가자
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
				   여기아냐 <td>	 <input type="file" name="mem_docs" value="${mem.mem_docs}"/></td>
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

				</table>-->
				
				<input type="submit" value="수정하기" class="btn_group">
				<br>
				<button  onClick="history.go(-1)">돌아가기</button>
				 </form>
				
			</div>
			
			
			
		</div>
	</div>
	
</body>
</html>
