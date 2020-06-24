<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
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
<title>회원 정보</title>
<link rel="stylesheet" href="../../css/main.css">
<link rel="stylesheet" href="../../css/smallbutton.css">
<style>
.person_table {margin : auto; padding: 50px}
.inner_frame {text-align: center; margin-top: 2%;}
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
// 패스워드 고치는 함수
function win_passchg() {
	var op="width=500, height=250, left=50, top=150";
	open("passwordForm.jsp","",op);
}

</script>
</head>
<body>

<div class="outer_frame">
	<button  class="small_button_on" onclick="location.href='../member/info.me?mem_id=${sessionScope.login}'">&nbsp;&nbsp;회원 정보&nbsp;&nbsp;</button>
	<button  class="small_button_off"  onclick="location.href='../clinicaltrial/myclinicaltrial.me'">나의 임상시험</button>
	<div class="inner_frame">
		<span class="spantag">임상회원 정보</span>
		<div class="person_table">
			<table>
				<tr>
					<th>아이디</th><td>${sessionScope.login}</td>
				</tr>
				<tr>
					<th>비밀번호</th><td><input type="button" value="비밀번호수정" onclick="win_passchg()"></td>
				</tr>
				<tr>
					<th>이름</th><td>${mem.mem_name}</td>
				</tr>
				<tr>
					<th>닉네임</th><td>${mem.mem_nickname}</td>
				</tr>
				<tr>
					<th>생년월일</th>
					<td>
						<c:set var="TextValue" value="${mem.mem_dateofbirth}"/>
						${fn:substring(TextValue,0,10)}
					</td>
				</tr>
				<tr>
					<th>성별</th><td>${mem.mem_gender}</td>
				</tr>
				<tr>
					<th>진단명</th><td>${mem.mem_diagnosis}</td>
				</tr>
				<tr>
					<th>진단일자</th>
					<td>
						<c:set var="TextValue" value="${mem.mem_dgdate}"/>
						${fn:substring(TextValue,0,10)}
					</td>
				</tr>
				<tr>
					<th>종합병기</th><td>${mem.mem_stage}</td>
				</tr>
				<tr>
					<th>진단서</th>
					<td>
							<c:if test="${empty mem.mem_docs}">
								&nbsp;
							</c:if>
							<c:if test="${!empty mem.mem_docs}">
								<a href="file/${mem.mem_docs}">${mem.mem_docs}</a>
							</c:if>
					</td>
				</tr>
				<tr>
					<th>병원</th><td>${mem.mem_hospital}</td>
				</tr>
			</table>
		</div>
		<br>
		
		<button type="button" onclick="location.href='updateForm.me?mem_id=${mem.mem_id}' " class="btn_group">회원정보 수정</button>
		

		<c:if test="${param.id != 'admin' && sessionScope.login != 'admin'}">
		<button type="button" onclick="location.href='deleteForm.me?mem_id=${mem.mem_id}' " class="btn_group">회원 탈퇴</button>
		</c:if>
	</div>
</div>
</body>
</html>
