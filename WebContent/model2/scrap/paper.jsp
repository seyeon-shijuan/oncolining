<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="org.jsoup.nodes.Document"%>
<%@page import="org.jsoup.nodes.Element"%>
<%@page import="java.io.IOException"%>
<%@page import="org.jsoup.select.Elements"%>
<%@page import="org.jsoup.Jsoup"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
 <%@ taglib prefix ="c" uri ="http://java.sun.com/jsp/jstl/core" %>
 <c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>구충제 항암 관련 논문</title>
<link rel="stylesheet" href="../../css/smallbutton.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<style type="text/css">
 table{
		margin-left: auto;
		margin-right: auto;
		align-content: center;
		width: 1000px;
		}
	table,td,th {border : 1px solid #CECECE; border-collapse : collapse; max-width: 75%; }
	th{background-color: #FAFAFA; text-align: center;}
	td{text-align: left; padding: 1%;}
	.inner_frame {text-align: center; margin-top: 2%;}
	.person_table {margin : auto; padding: 50px}
	.search_bar {padding: 3%; margin: 2%;}
</style>
</head>
<body>
	<div class="outer_frame">
		<button  class="small_button_off" onclick="location.href='../scrap/news.jsp'">&nbsp;&nbsp;관련 기사&nbsp;&nbsp;</button>
		<button  class="small_button_on"  onclick="location.href='../scrap/paper.jsp'">&nbsp;&nbsp;학술 논문&nbsp;&nbsp;</button>
		<button  class="small_button_off"  onclick="location.href='../scrap/scrap.jsp'">&nbsp;&nbsp;사이트 링크&nbsp;&nbsp;</button>
		<div class="inner_frame">
			
			<script type="text/javascript">
				
				function pubmed(){
					location.href="../ajax/pubmed.me?website="+$("#website option:selected").val()+"&keyword="+
							encodeURI(encodeURIComponent($("#keyword").val()))
				}//pubmed
				
			</script>
			
			<div class="search_bar">
				<form action="../ajax/pubmed.me"  method="post" name="f">
					<select id="website" name="website" style="height: 25px;">
			  	 	 <option value="1" selected="selected">Pubmed</option>
			  		  <option value="2">Google Scholar</option>
					</select>
					<input type="text" id="keyword" name="keyword">
					<input type="button" onclick="pubmed()" value="검색">
					<input type="submit" value="submit">
				</form>
			</div>
			
			<div class="result_section">
			</div>
			
			<%
				String url ="https://pubmed.ncbi.nlm.nih.gov/?term=albendazole+anticancer";
				String url2="https://pubmed.ncbi.nlm.nih.gov/?term=albendazole+anticancer";
				String line = "";
				Document doc = null;
				List<String> list = new ArrayList<String>();
				try {
					//doc = Jsoup.connect(url).get();
					doc = Jsoup.connect(url).userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36").get();
		
					Elements e1 = doc.select(".labs-full-docsum"); //class 속성이 rso인 모든 태그를 가져오기
					for(Element ele : e1){
						list.add(ele.html());
						//out.print(ele.html());
					}//for
		
				} catch(IOException e ){
					e.printStackTrace();
				}
				pageContext.setAttribute("list", list);
			%>
			<table>
				<c:forEach items="${list}" var="v" varStatus="stat">
					<tr><td>${v}</td></tr>
				</c:forEach>
			</table>
		
		<!-- 
		ts.Pg8zWb.hqn4Zb.C1Iii.FddHQd.tsUanb
		ts Pg8zWb b80nOe C1Iii FddHQd tsUanb
		전체
		ts.Pg8zWb.b80nOe.C1Iii.FddHQd.tsUanb
		
		select(".l.lLrAF")
		l lLrAF
		제목
		
		dhIWPd
		노컷뉴스(보도자료) -2020.6.2
		
		st
		내용
		
		th BbeB2d
		이미지
		 -->
		</div> <!-- inner frame div-->
	</div><!-- outer frame div -->
</body>
</html>