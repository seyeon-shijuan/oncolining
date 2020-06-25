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
 
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>구충제 항암 관련 기사</title>
<link rel="stylesheet" href="../../css/smallbutton.css">
<style type="text/css">
	   table{
		margin-left: auto;
		margin-right: auto;
		align-content: center;
		width: 800px;
		}
	table,td,th {border : 1px solid #CECECE; border-collapse : collapse; max-width: 75%; }
	th{background-color: #FAFAFA; text-align: center;}
	td{text-align: left; padding: 1%;}
	.inner_frame {text-align: center; margin-top: 2%;}
	.person_table {margin : auto; padding: 50px}
</style>
</head>
<body>
	<div class="outer_frame">
		<button  class="small_button_on" onclick="location.href='../scrap/news.jsp'">&nbsp;&nbsp;관련 기사&nbsp;&nbsp;</button>
		<button  class="small_button_off"  onclick="location.href='../scrap/paper.jsp'">&nbsp;&nbsp;학술 논문&nbsp;&nbsp;</button>
		<button  class="small_button_off"  onclick="location.href='../scrap/scrap.jsp'">&nbsp;&nbsp;사이트 링크&nbsp;&nbsp;</button>
		<div class="inner_frame">

		<span class="spantag">
			Google 알벤다졸, 펜벤다졸 등 구충제 항암 이슈 관련 기사
			<br>
			[&nbsp;
			<script type="text/javascript">
				var today = new Date();
				document.write(today.toLocaleString());
			</script>
			&nbsp;기준 ]
		</span>
		<div class="person_table">
			<%
				String url ="https://www.google.com/search?biw=1280&bih=610&tbm=nws&sxsrf=ALeKk009tGXPFytYFH52RTeQ6HmqiRTP2w%3A1592704527350&ei=D77uXvT7FMKJmAWszLboBA&q=*%EC%95%8C%EB%B2%A4%EB%8B%A4%EC%A1%B8or%ED%95%AD%EC%95%94&oq=*%EC%95%8C%EB%B2%A4%EB%8B%A4%EC%A1%B8or%ED%95%AD%EC%95%94&gs_l=psy-ab.3...35843.36004.0.36218.3.3.0.0.0.0.174.174.0j1.1.0....0...1c.1j4.64.psy-ab..2.0.0....0.aDCU6-yn25o";
				String line = "";
				Document doc = null;
				List<String> list = new ArrayList<String>();
				List<String> list2 = new ArrayList<String>();
				List<String> list3 = new ArrayList<String>();
				List<String> list4 = new ArrayList<String>();
				List<String> list5 = new ArrayList<String>();

				try {
					//doc = Jsoup.connect(url).get();
					doc = Jsoup.connect(url).userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36").get();
		
					Elements e1 = doc.select("#rso").select(".r.dO0Ag"); //제목
					for(Element ele : e1){
						list.add(ele.html());
						//out.print(ele.html());
					}//for
					
					Elements e2 = doc.select("#rso").select(".top.NQHJEb.dfhHve"); //이미지
					for(Element ele : e2){
						list2.add(ele.html());
						//out.print(ele.html());
					}//for
					
					Elements e3 = doc.select("#rso").select(".dhIWPd"); //날짜
					for(Element ele : e3){
						list3.add(ele.html());
						//out.print(ele.html());
					}//for
					Elements e4 = doc.select("#rso").select(".st"); //간추린 텍스트
					for(Element ele : e4){
						list4.add(ele.text());
						//out.print(ele.html());
					}//for
					Elements e5 = doc.select("#rso").select(".ErI7Gd.card-section"); //카드섹션1
					for(Element ele : e5){
						list5.add(ele.html());
						//out.print(ele.html());
					}//for

		
				} catch(IOException e ){
					e.printStackTrace();
				}
				pageContext.setAttribute("list", list);
				pageContext.setAttribute("list2", list2);
				pageContext.setAttribute("list3", list3);
				pageContext.setAttribute("list4", list4);
				pageContext.setAttribute("list5", list5);

			%>
			
			
			<table>
				<tr>
					<th>썸네일</th><th>기사</th>
				</tr>
				<c:forEach items="${list}" var="v" varStatus="stat">
					<tr>
						<th>
							<div style="width: 130px; height: 130px; overflow:hidden; ;">
							${list2[stat.index]}
							</div>
						</th>
						<td>
							<span style="font-weight: bold;">
								${v}
							</span>
							<br>
							${list3[stat.index]}<br>
							${list4[stat.index]}<br>
							<div style="font-size: x-small;">
								${list5[stat.index]}<br>
							</div>
						</td>
					</tr>
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
		 	</div>
		</div> <!-- inner div -->
	</div><!-- outer div -->
</body>
</html>