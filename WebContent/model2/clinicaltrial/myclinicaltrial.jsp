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
1. id parameter 값을 조회
2. login 상태 검증
로그아웃 상태라면 : '로그인 하세요'메세지를 출력하고 loginForm.jsp
3. login상태 검증 2
id parameter 값과 login id가 다른 경우: 내정보 조회만 가능합니다. 메세지를 출력 하고 main.jsp 페이지로 이동한다.
4. db에서 id 값으로 데이터 조회.
5. 조회된 내용을 화면에 출력하기
 --%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>나의 임상 보기</title>
<link rel="stylesheet" href="../../css/smallbutton.css">
<style>
.person_table {margin : auto; padding: 50px}
.inner_frame {text-align: center; margin-top: 2%;}
   table{
		margin-left: auto;
		margin-right: auto;
		align-content: center;
		width: 800px;
		font-size: x-small;
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

	}
</style>
<script type="text/javascript">

</script>
</head>
<body>

<div class="outer_frame">
	<button class="small_button_off" onclick="location.href='../member/info.me?mem_id=${sessionScope.login}'">&nbsp;&nbsp;회원 정보&nbsp;&nbsp;</button>
	<button class="small_button_on"onclick="location.href='../clinicaltrial/myclinicaltrial.me'">나의 임상시험</button>
	<div class="inner_frame">
		<span class="spantag">나의 주간임상일지</span>
		<div class="person_table">
			<span>
				<c:forEach var="c" items="${mylist}" begin="0" end="0">
					닉네임: ${c.mem_nickname} /	 만 나이: ${c.ct_age} / 성별: ${c.mem_gender} / 진단명: ${c.mem_diagnosis} /	 종합병기:${c.mem_stage}
				</c:forEach>
			</span>
			<!-- clinical trial data section -->
			<div class="one_div" style="overflow:scroll; white-space:nowrap; width:100%; height:400px; padding: 1%; background-color:#F2F2F2;">

			<table>
				<tr>
					<th>No.</th><th>복용주차</th><th>복용약물</th><th>용법</th>
					<th>기타용법</th><th>복용량</th><th>병행치료</th><th>보충제</th><th>체감통증</th><th>기력·피로도</th><th>부작용·의심증상</th>
					<th>종양크기변화</th><th>종양수치변화</th><th>수정</th><th>삭제</th>
				</tr>
				<c:forEach var="c" items="${mylist}">
					<tr>
							<td>${c.ct_datano}</td>
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
							<td>
								<a href="ctupdateForm.me?num=${c.ct_datano}">수정</a>
							</td>
							<td>
								<a href="ctdeleteForm.me?num=${c.ct_datano}" 
								onclick="window.open(this.href,'_blank','width=460, height=150'); return false;">삭제</a>
							</td>
						</tr>
				</c:forEach>
			</table>
			</div> <!-- one_div -->
		</div>
		<br>
		
		<button type="button" onclick="location.href='../clinicaltrial/ctdataForm.me' " class="btn_group">임상 입력</button>
		

		<c:if test="${param.id != 'admin' && sessionScope.login != 'admin'}">
		<button type="button" onclick="location.href='../clinicaltrial/clinicaltrialmain.me' " class="btn_group">임상 시험</button>
		</c:if>
	</div>
</div>
</body>
</html>
