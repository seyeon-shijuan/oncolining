<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>회원가입</title>
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
	

	/*회원가입 테이블*/
	input[type=text],input[type=password] { width: 300px; height: 35px;}
	td, tr, th { text-align: left; width : auto; padding: 15px;}
	
	
   table{
		margin-left: auto;
		margin-right: auto;
		
	}
	
	/*!회원가입 테이블*/
</style>
<!--★★ 여기도 새로 생김 ★★-->
<script type="text/javascript">
function win_upload(){
	var op = "width=500,height=150,left=50,top=150";
	open("pictureForm.me","",op);
	// open: pictureForm.me가 열림
}
</script>
</head>
<body>
<%--
<form action="join.me" name="f" method="post">
	<!-- former -->
	<input type="hidden" name="picture" value=""> <!-- with picture의 이미지 이름이 들어간다. --> 
	<table><tr><td rowspan="4" valign="bottom">
	<img src="" width="100" height="120" id="pic"><br> <!-- with picture.jsp -->
	
	<font size="1"><a href="javascript:win_upload()">사진등록</a></font>
	<!-- ★★javascript:win_upload() 추가됨 for thumbnail.jsp ★★ -->
	
	</td><th>아이디</th><td><input type="text" name="id"></td></tr>
	<tr><th>비밀번호</th><td><input type="password" name="pass"></td></tr>
	<tr><th>이름</th><td><input type="text" name="name"></td></tr>
	
	<tr><th>성별</th><td>
	<input type="radio" name="gender" value="1" checked>남
	<input type="radio" name="gender" value="2" >여</td></tr>
	<tr><th>전화번호</th><td colspan="2"><input type="text" name="tel"></td></tr>
	<tr><th>이메일</th><td colspan="2"><input type="text" name="email"></td></tr>
	<tr><td colspan="3"><input type="submit" value="회원가입"></td>
	</table>
	<!-- /former -->
	 --%>
	 
	<div class="onco_form_outer_frame">
		<div class="onco_form_inner_frame">
			<div>
				
				<img src="../../img/small_logo.JPG"/>
				<br>
				임상회원 가입하기
				<br><br>
			</div>
			
			
			<div>
				<!-- 회원가입 항목 -->
				<form action="join.me" name="f" method="post" class ="table_form">
				<input type="hidden" name="mem_docs" value=""> <!-- 첨부파일 이름이 들어간다. --> 
				<table boder = "1px solid gray" cellspacing = "1" class="onco_form_table" >
				  <tr>
				   <th>아이디 </th>
				   <td> 
				   <input type = "text" name="mem_id"/>
				   <input type = "button" value = "중복확인"/>
				   </td>
				  </tr>
				  <tr>
				   <th> 비밀번호 </th>
				   <td> <input type = "password" name="mem_pass"/> </td>
				  </tr>
				  <tr>
				   <th> 비밀번호 확인 </th>
				   <td> <input type = "password" name="mem_pass2"/>&nbsp;<br>*비밀번호를 다시 입력해주세요. </td>
				  </tr>
				  <tr>
				   <th> 이름 </th>
				   <td> <input type = "text" name="mem_name"/> </td>
				  </tr>
				  <tr>
				   <th> 닉네임 </th>
				   <td> <input type = "text" name="mem_nickname"/> </td>
				  </tr>
				  <tr>
				   <th> 생년월일 </th>
				   <td> <input type='date' name='mem_birthdate'/> </td>
				  </tr>
				  <tr>
				   <th> 성별 </th>
				   <td style="text-align: center"> 
				    <input type = "radio" name = "mem_gender"/ checked > 남(M)
				    <input type = "radio" name = "mem_gender"/ style="margin-left: 80px"> 여(F)
				   </td>
				  </tr>
				  <tr>
				   <th> 진단명 </th>
				   <td> <input type = "text" name="mem_diagnosis"/> </td>
				  </tr>
				  <tr>
				   <th> 진단일자 </th>
				   <td> <input type='date' name='mem_dgdate'/> </td>
				  </tr>
				  <tr>
				   <th> 종합병기 </th>
				   <td>
				   	  <select name="mem_stage">
					  <option value="1" selected="selected">1</option>
					  <option value="2">2</option>
					  <option value="3">3</option>
					  <option value="4">4</option>
					  <option value="말기">말기</option>
					</select>
				   </td>
				  </tr>
				  <tr>
				   <th> 진단서 </th>
				   <td> <input type="file" name="mem_docs"/> </td>
				  </tr>
				   <tr>
				   <th> 병원 </th>
				   <td> <input type = "text" name="mem_hospital"/> </td>
				  </tr>
				  
				  <!-- 
				  <tr>
				   <td> 이메일 </td>
				   <td>
				    <input type = "text"/> @ <input type = "text"/> &nbsp;&nbsp; 
				    <select>
				     <option> 직접입력 </option>
				     <option> naver.com </option>
				     <option> daum.net </option>
				     <option> nate.com </option>
				    </select>
				   </td>
				  </tr>
				  <tr>
				   <td> 주소 </td>
				   <td>
				    <input type = "text"/>
				    <input type = "button" value = "주소찾기"/>
				   </td>
				  </tr>
				  <tr>
				   <td> 상세주소 </td>
				   <td>
				    <input type = "text"/>
				   </td>
				  </tr>
				  <tr>
				   <td> 휴대폰 </td>
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
				   <td> 관심  </td>
				   <td>
				    <input type = "checkbox"/> 수입차
				    <input type = "checkbox"/> 국산차
				    <input type = "checkbox"/> SUV
				    <input type = "checkbox"/> 경차
				    <input type = "checkbox"/> LPG
				   </td>
				  </tr>
				  <tr>
				   <td> 자기소개  </td>
				   <td>
				    <textarea cols = "60" rows = "10"></textarea>
				   </td>
				  </tr>
				   -->
				</table>
				 </form>
				<!-- /회원가입 항목 -->
			</div>
			<input type="submit" value="회원가입" class="btn_group">
			<br>
			
			
		</div>
	</div>

</form>
</body>
</html>