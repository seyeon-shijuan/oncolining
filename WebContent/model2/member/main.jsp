<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>about</title>
<style>
	.btn_group {
		border: 1px solid red; background-color: red; color: white;
		width: 200px; height: 40px;
		margin: 20px;
	}
	table, td {border: none; border: collapsed; width: 600px; margin-bottom: 30px;}
	.person_table {margin : auto; padding: 50px}
	.inner_frame {text-align: center; margin-top: 2%;}
	ul{ list-style-type:disc;}
</style>
</head>
<body>
	<div class="inner_frame">
		<div style="text-align: center;">
		<h1 style="margin-top: 7%;">Share Your Anthelmintic Treatment</h1>
		<h1 style="font-weight: bolder;">Project OncoLining</h1>
		<h4 style="font-size: medium; font-style: italic; color: gray; margin-bottom: 30px;">Innovative Crowd Clinical Trial Platform for the Patients with Cancer</h4>
		<img src="../../img/silverlining1.jpg" style="width: 60%; height:auto; margin-bottom: 7%;"/>
		</div>
	<div class="inner_frame">
		<h2 style=" margin-bottom: 7%;">프로젝트 온코라이닝에 오신 것을 환영합니다.</h2>
		<div class="content">
			<h4 style="font-style: italic; color: gray; margin-bottom: 2%;">프로젝트 온코라이닝은 무엇인가요?</h4>
			<h5>
				온코라이닝은 암세포 억제 혹은 항암 목적으로 동물/ 사람용 구충제 5종
				Albendazole, Fenbendazole, Mebendazole, Flubendazole, Pyrvinium을
			</h5>
			<h5 style="margin-bottom: 3%;">
				복용하는 암 환자들간 약물 복용에 관련된 데이터를 모아 환자주도 임상 1상을 진행하는
				"크라우드 임상시험 플랫폼" 입니다.
			</h5>
			<h5 ">
				본 사이트는 구충제 복용 암환자로부터 제출된 임상 데이터를 투명하게 공개하며
				회원간 셀프 임상 관련 정보를 공유함으로써 
			</h5>
			<h5 style="margin-bottom: 7%;">
				환자 자신의 최근 구충제 이슈에 대한 의학적 literacy를 높이고 
				암세포 억제 효과가 있는 적응증과 적합한 용법을 찾는 것을 목적으로 합니다.
			</h5>
			<h4 style="font-style: italic; color: gray; margin-bottom: 2%;">임상시험에 참여하려면 어떻게 해야 하나요?</h4>
			<h5>
				임상회원 가입 후 임상시험 탭에서 복용중인 약물에 대한 '주간복약일지'를 주 1회 제출하시면 됩니다.<br>
			</h5>
			<h5 style="margin-bottom: 7%;">
				모든 임상 참여자의 복약일지 데이터는 별도의 절차 없이 실시간으로 확인하실 수 있습니다.
			</h5>
			
			<h6 style="color : gray; font-style: italic;">지금 임상회원으로 가입하세요.</h6>
			<button type="button" onclick="location.href='../member/joinForm.me' " class="btn_group" style="margin-bottom: 7%;">임상 회원 가입</button>
			<br>
			
				<table style="text-align: center;" class="person_table">
					<tr>
						<td>
							<img src="../../img/ct.png" style="width: 50px; height:auto; margin: 0 5% 0 5%;"/><br>
							임상시험
						</td>
						<td>
							<img src="../../img/scrap.png" style="width: 50px; height:auto; margin: 0 5% 0 5%;"/><br>
							학술 스크랩
						</td>
						<td>
				    		<img src="../../img/forum.png" style="width: 50px; height:auto; margin: 0 5% 0 5%;"/><br>
				    		임상포럼
						</td>
					</tr>
				</table>
			<br><br>
			<div style="margin-bottom: 7%;">
			<p>
				● 임상시험 참여자간 병종, 복용 약물, 복용법, 복용 후 효과 등 분석이 가능합니다.
			</p>
			<p>
				● 관련 기사, 논문 및 유용한 사이트 목록을 확인할 수 있습니다.
			</p>
			<p>
				● 임상시험 관련 회원간 토픽을 통해 토론이 가능합니다.
			</p>
			</div>
			
			Copyright ⓒ 2020 Project OncoLining.Co., Ltd. All Rights Reserved.
			</div>
		</div>
	</div>
</body>
</html>
