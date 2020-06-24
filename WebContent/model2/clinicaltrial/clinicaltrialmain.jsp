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
<script type="text/javascript" src="http://www.chartjs.org/dist/2.9.3/Chart.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
.main_contents {margin : auto; /*padding: 50px;*/}
.inner_frame {text-align: center;}
/*.two-divs { float : left; padding : 10px; width: 50%; }*/

   table{
		margin-left: auto;
		margin-right: auto;
		align-content: center;
		width: 800px;
		font-size: xx-small;
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
	
	 canvas {
	  -moz-user-select: none;
	  -webkit-user-select: none;
	  -ms-user-select: none;
	 }
	 
</style>
<script type="text/javascript">
	$(function(){
		bargraph();
	})
	
		function bargraph(){
		$.ajax("${path}/model2/ajax/graph2.me",{
			success : function(data){
				barGraphPrint(data);
			},//success
			error : function(e){
				alert("서버 오류: " + e.status);
			}//error
		})//ajax
	}//graphs
	
	function barGraphPrint(data){
		console.log(data)
		var rows = JSON.parse(data);
		var regdates = []
		var datas = []
		var colors = []
		$.each(rows,function(index,item){
			regdates[index] = item.board_regdate;
			datas[index] = item.cnt;
			colors[index] = randomColor(1);
		})//each
		var chartData = {
			labels : regdates,
			datasets : [{
				type : 'line',
				borderWidth : 2,
				borderColor : colors,
				label : '건수',
				fill : false,
				data : datas
			},{
				type : 'bar',
				label : '건수',
				backgroundColor : colors,
				data : datas
			}]//datasets
		}//chartData : 데이터에 해당
		var config = {
			type : 'bar', //데이터 셋에도 표시하고, 환경설정에도 표시해야 한다.
			data : chartData, // 위에 chartData를 만든 것을 한번에 이 칸에 넣는다.
			options : {
				responsive : true,
				legend : {display : false},
				title : {
		               display : true,
		               text : '가장 최근부터 글이 등록된 7일',
		               position : 'top'
		            },
				scales:{
					xAxes: [{
						display : true,
						stacked : true
					}],//xAxes
					yAxes:[{
						display : true,
						stacked : true,
						scaleLabel : { display: true, labelString:"게시물 작성 건수"},
						// y축 눈금에서 소수점 제거
						ticks: {
			                 beginAtZero: true,
			                 userCallback: function(label, index, labels) {
			                     // when the floored value is the same as the value we have a whole number
			                     if (Math.floor(label) === label) {
			                         return label;
			                     }
			                 }
			             }
					}]//yAxes
				}//scales
			}//options
			
		}//config
		var ctx = document.getElementById("canvas1").getContext("2d");
		new Chart(ctx,config);
	}//barGraphPrint
</script>
</head>
<body>


<div class="outer_frame">
	<div class="inner_frame">
		<span class="spantag">임상시험<br><br></span>
		
		
		<!-- main contents -->
		<div class="main_contents">
			<!-- clinical trial data section -->

			<div class="two-divs" style="overflow:scroll; white-space:nowrap; width:57%; height:600px; padding: 1%; background-color:#F2F2F2; float:left;">
			
				<table>
					<tr>
						<th>No.</th><th>닉네임</th><th>만 나이</th><th>성별</th><th>진단명</th><th>종합병기</th><th>복용주차</th><th>복용약물</th><th>용법</th>
						<th>기타용법</th><th>복용량</th><th>병행치료</th><th>보충제</th><th>체감통증</th><th>기력·피로도</th><th>부작용·의심증상</th>
						<th>종양크기변화</th><th>종양수치변화</th>
					</tr>
					<c:forEach var="c" items="${list}">
						<tr>
							<td>${c.ct_datano}</td>
							<td>${c.mem_nickname}</td>
							<td>${c.ct_age}</td>
							<td>${c.mem_gender}</td>
							<td>${c.mem_diagnosis}</td>
							<td>${c.mem_stage}</td>
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
						</tr>
					</c:forEach>
					
				</table>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
								8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				8<br>
				
			</div>

			<!-- /clinical trial data section -->

				<div class="two-divs" style="width: 40%; height: 600px; margin-left: 3%;  padding: 1%; background-color:#F2F2F2; float:left;">
					<div id="boardcontainer" style="background-color: pink;">
					<canvas id="canvas1" style="width: 100%; border: 1px solid black;"></canvas>				
				</div>
				</div>
			
			<!--chart section  -->
			
			
			<!-- /chart section  -->
		</div><div style="clear:both;"></div>
		 <!-- /main contents -->
		<br>
		
		<div class="two-divs" style="width:57%; height:200px; padding: 1%; border: 2px solid lightgray; float:left;">
			<button type="button" onclick="location.href='../clinicaltrial/ctdataForm.me' " class="btn_group">임상 입력</button>
			<button type="button" onclick="location.href='../clinicaltrial/myclinicaltrial.me' " class="btn_group">내 임상 보기</button>
		</div>
		<div class="two-divs" style="width: 40%; height: 200px; margin-left: 3%; padding: 1%;  border: 2px solid lightgray; float:left;">
		</div>
		
		
		<!-- 
		<button type="button" onclick="location.href='updateForm.me?mem_id=${mem.mem_id}' " class="btn_group">회원정보 수정</button>
		

		<c:if test="${param.id != 'admin' && sessionScope.login != 'admin'}">
		<button type="button" onclick="location.href='deleteForm.me?mem_id=${mem.mem_id}' " class="btn_group">회원 탈퇴</button>
		</c:if>
		 -->
		
	</div> <!-- /inner frame -->
</div>
</body>
</html>


