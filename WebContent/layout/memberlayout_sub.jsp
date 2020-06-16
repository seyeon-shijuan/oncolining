<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
<style type="text/css">
.top{margin-top:20px;}
p{text-align:right; margin-right:30px;}
ul{margin-top:40px; margin-left:30px;}
li{float:left; list-style:none; margin-right:30px;}
img{width:160px; hight:auto;}
.logo{margin-right:600px;}
.welcoming{font-size:small;}
a:link{color:black; text-decoration: none;}
a:visited{color:black; text-decoration: none;}
a:hover{color:red;}
.menu{margin-top:20px;}


</style>

</head>
<body>
 <div class="top">
  <div class="welcoming">
    <p>
    	<c:if test="${empty sessionScope.login }">
			<a href="${path}/model2/member/loginForm.me">�α���</a>
			<a href="${path}/model2/member/joinForm.me">ȸ������</a>
		</c:if>
		<c:if test="${!empty sessionScope.login}">
			${sessionScope.login}���� �α��� �ϼ̽��ϴ�. &nbsp; &nbsp;
			<a href="${path}/model2/member/logout.me">�α׾ƿ�</a>
		</c:if>
	</p>
   </div>
  <div class="logo-menu">
   <ul>
    <li class="logo">
     <a href="main.do">
      <img src="../img/small_logo.JPG"/>
     </a>
    </li>
    <li class="menu"> 
      <a href="../board/list.do" class="w3-bar-item w3-button w3-hide-small w3-hover-white">board</a>
     </li>
     <li class="menu">
      <a href="../member/main.me" class="w3-bar-item w3-button w3-hide-small w3-hover-white">ȸ������</a>
     </li>
     <li class="menu">
      <a href="../member/list.me" class="w3-bar-item w3-button w3-theme-l1">ȸ������</a>
     </li>
     <li class="menu">
      <a href="../board/list.do" class="w3-bar-item w3-button w3-theme-l1">�Խ���</a>
     </li>
    </ul> 
   </div>
 </div>
 <div class="mainbody">

 </div>
</body>
</html>