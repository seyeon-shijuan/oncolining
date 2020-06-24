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
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="../../css/blackbar.css">
<link rel="stylesheet" href="../../css/sublayout.css">
<style type="text/css">
.top{margin-top:1%;}
ul{margin-top:2%; margin-left:2%;}
li{
/*float:left;*/
display: inline; 
list-style:none; margin:0 3%;
}
img{width:160px; hight:auto;}
.logo{margin-right:90%;}
.welcoming{font-size:small; text-align:right; margin-right:5%;}
.welcoming_inner_a { margin : 1%;}
li a:link{color:gray; text-decoration: none;}
li a:visited{color:gray; text-decoration: none;}
li a:hover{color:red;}
.tab{margin-top:20px;}
a:link{color:black; text-decoration: none;}
a:visited{color:black; text-decoration: none;}

.tab_outer {margin-bottom: 2%; text-align: right;}
.mainbody {margin : 2%; text-align: center; align-content: center;}
.top{margin-bottom: 1%;}
.logo_image {
	position: relative;
	left: 5%;
	top: 5%;
	width: 20%;
        }
.titletext {font-size: x-small; color: gray; font-family: courier; font-style: italic;  }
</style>
<%-- <script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script> --%>
<decorator:head/>
<body>
 
<!-- Navbar -->
<div class="top"> <!-- margin-top:1%; -->
	<!-- menu: mypage, login, register -->
 	<div class="menu_section"> 
	  <p class="welcoming"> <!-- font-size:small; text-align:right; margin-right:5%;; -->
	    	<c:if test="${empty sessionScope.login }">
	    		 <!--  welcoming_inner_a -> margin : 1%; -->
	    		<a href="${path}/model2/member/info.me?mem_id=${sessionScope.login}" class="welcoming_inner_a">mypage</a>
				<a href="${path}/model2/member/joinForm.me" class="welcoming_inner_a">register</a>
				<a href="${path}/model2/member/loginForm.me" class="welcoming_inner_a">login</a>
			</c:if>
			<c:if test="${!empty sessionScope.login}">
				반갑습니다, ${sessionScope.login} 님 &nbsp;
				<a href="${path}/model2/member/info.me?mem_id=${sessionScope.login}" class="welcoming_inner_a">mypage</a>
				<a href="${path}/model2/member/logout.me">logout</a>
			</c:if>
		</p>
   </div>
   <!-- /menu: mypage, login, register -->
   
	   <!-- logo image and tab -->   
	 	<div class="tab_outer">
	 		<div class="two_divs">
		 		<ul>
			    <div class="logo">
			     <a href="../member/main.me">
			      <img src="../../img/small_logo.JPG"/>
			     </a>
		   	 </div> <!-- logo -->
	 		</div>
	 		<div class="two_divs">
		    <li class="tab"> 
		      <a href="../member/main.me?id=${sessionScope.login}" class="123">소개</a>
		     </li>
		     <li class="tab">
		      <a href="../clinicaltrial/clinicaltrialmain.me" class="123">임상시험</a>
		     </li>
		     <!--
		      <li class="tab">
		      <a href="../clinicaltrial/ctdataForm.me" class="123">임상입력</a>
		     </li>  -->
		     <li class="tab">
		      <a href="../scrap/news.jsp" class="123" >학술 스크랩</a>
		     </li>
		     <!--
		     <li class="tab">
		      <a href="../member/list.me?id=${sessionScope.login}" class="123" >회원관리</a>
		     </li>  -->
		     <li class="tab">
		      <a href="../board/list.do" class="123">임상포럼</a>
		     </li>
		    </ul>
		   </div>
	   </div> <!-- tab_outer -->
	   <!-- /logo image and tab -->
 </div>
<!-- Navbar -->


	<!-- black bar container -->
	<div class="container">
		<div class="span4">
			<div class="inner-heading">
				<p class="titletext">Clinical Trial Platform for the Patients with Cancer</p>
			</div>
		</div>
	</div>
	<br>
	<!-- /black bar container -->


<!-- Main content-->
 <div class="mainbody">
    <div class="body_content">
       <decorator:body/>
    </div>
</div>
<!-- END MAIN -->

<!-- 

	<footer id="myFooter">
	    <div class="upperFooter">
	      <h5 align="right">★</h5>
	    </div>
	
	    <div class="lowerFooter">
	      <p align="right">Copyright oncolining.ltd all rights reserved.</p>
	    </div>
	 </footer>

 -->
</body>
</html>