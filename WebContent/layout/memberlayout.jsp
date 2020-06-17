<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="decorator" uri="http://www.opensymphony.com/sitemesh/decorator" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
<title><decorator:title/></title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<style type="text/css">
.top{margin-top:20px;}
ul{margin-top:20px; margin-left:30px;}
li{float:left; list-style:none; margin:0 25px;}
img{width:160px; hight:auto;}
.logo{margin-right:620px;}
.welcoming{font-size:small; text-align:right; margin-right:30px;}
li a:link{color:gray; text-decoration: none;}
li a:visited{color:gray; text-decoration: none;}
li a:hover{color:red;}
.menu{margin-top:20px;}
a:link{color:black; text-decoration: none;}
a:visited{color:black; text-decoration: none;}
.body_content {}

</style>

<script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
<decorator:head/>

<body>
 
<!-- Navbar -->
<div class="top">
  <div class="welcoming">
    <p class="welcoming">
    	<c:if test="${empty sessionScope.login }">
			<a href="${path}/model2/member/loginForm.me">로그인</a>
			<a href="${path}/model2/member/joinForm.me">회원가입</a>
		</c:if>
		<c:if test="${!empty sessionScope.login}">
			${sessionScope.login}님이 로그인 하셨습니다. &nbsp; &nbsp;
			<a href="${path}/model2/member/logout.me">로그아웃</a>
		</c:if>
	</p>
   </div>
  <div class="logo-menu">
   <ul>
    <li class="logo">
     <a href="../member/main.me">
      <img src="../../img/small_logo.JPG"/>
     </a>
    </li>
    <li class="menu"> 
      <a href="../member/main.me" >소개</a>
     </li>
     <li class="menu">
      <a href="../member/info.me?id=${sessionScope.login}">회원정보</a>
     </li>
     <li class="menu">
      <a href="../member/list.me">회원관리</a>
     </li>
     <li class="menu">
      <a href="../board/list.do">게시판</a>
     </li>
    </ul> 
   </div>
 </div>

<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible-->

 <div class="mainbody">
    <div class="body_content">
       <decorator:body/>
    </div>
 
  <footer id="myFooter">
    <div class="upperFooter">
      <h5 align="right">★</h5>
    </div>

    <div class="lowerFooter">
      <p align="right">Copyright oncolining.ltd all rights reserved.</p>
    </div>
  </footer>


</div>
<!-- END MAIN -->

</body>
</html>