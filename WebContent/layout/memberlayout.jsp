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
      <img src="../img/small_logo.JPG"/>
     </a>
    </li>
    <li class="menu"> 
      <a href="../member/main.me" class="w3-bar-item w3-button w3-hide-small w3-hover-white">소개</a>
     </li>
     <li class="menu">
      <a href="../member/info.me?id=${sessionScope.login}" class="w3-bar-item w3-button w3-hide-small w3-hover-white">회원정보</a>
     </li>
     <li class="menu">
      <a href="../member/list.me" class="w3-bar-item w3-button w3-theme-l1">회원관리</a>
     </li>
     <li class="menu">
      <a href="../board/list.do" class="w3-bar-item w3-button w3-theme-l1">게시판</a>
     </li>
    </ul> 
   </div>
 </div>

<!-- Main content: shift it to the right by 250 pixels when the sidebar is visible-->
<br/>
<br/>

 <div class="mainbody">
    <div class="w3-twothird w3-container">
       <decorator:body/>
    </div>

 
 




 
  <!-- Pagination -->
  <!-- 
  <div class="w3-center w3-padding-32">
    <div class="w3-bar">
      <a class="w3-button w3-black" href="#">1</a>
      <a class="w3-button w3-hover-black" href="#">2</a>
      <a class="w3-button w3-hover-black" href="#">3</a>
      <a class="w3-button w3-hover-black" href="#">4</a>
      <a class="w3-button w3-hover-black" href="#">5</a>
      <a class="w3-button w3-hover-black" href="#">▶</a>
    </div>
  </div>
   -->
 
  <footer id="myFooter">
    <div class="w3-container w3-theme-l2 w3-padding-32">
      <h5 align="right">★</h5>
    </div>

    <div class="w3-container w3-theme-l1">
      <p align="right">빅데이터 플랫폼 개발자 양성 과정 2회차 모델2 프로그램 연습</p>
    </div>
  </footer>

<!-- END MAIN -->
</div>

<!--  <script>
// Get the Sidebar
var mySidebar = document.getElementById("mySidebar");

// Get the DIV with overlay effect
var overlayBg = document.getElementById("myOverlay");

// Toggle between showing and hiding the sidebar, and add overlay effect
function w3_open() {
  if (mySidebar.style.display === 'block') {
    mySidebar.style.display = 'none';
    overlayBg.style.display = "none";
  } else {
    mySidebar.style.display = 'block';
    overlayBg.style.display = "block";
  }
}

// Close the sidebar with the close button
function w3_close() {
  mySidebar.style.display = "none";
  overlayBg.style.display = "none";
}
</script>-->

</body>
</html>