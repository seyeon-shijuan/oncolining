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
<title>������ �׾� ���� ��</title>
<link rel="stylesheet" href="../../css/smallbutton.css">
<style type="text/css">
	table,td,th {border : 1px dotted gray; border-collapse : collapse;}
	th{background-color: #CECECE;}
	.inner_frame {text-align: center; margin-top: 2%;}
</style>
</head>
<body>
	<div class="outer_frame">
		<button  class="small_button_off" onclick="location.href='../scrap/news.jsp'">&nbsp;&nbsp;���� ���&nbsp;&nbsp;</button>
		<button  class="small_button_on"  onclick="location.href='../scrap/paper.jsp'">&nbsp;&nbsp;�м� ��&nbsp;&nbsp;</button>
		<button  class="small_button_off"  onclick="location.href='../scrap/scrap.jsp'">&nbsp;&nbsp;����Ʈ ��ũ&nbsp;&nbsp;</button>
		<div class="inner_frame">
			<%
				String url ="https://pubmed.ncbi.nlm.nih.gov/?term=albendazole+anticancer";
				String line = "";
				Document doc = null;
				List<String> list = new ArrayList<String>();
				try {
					//doc = Jsoup.connect(url).get();
					doc = Jsoup.connect(url).userAgent("Mozilla/5.0 (Macintosh; Intel Mac OS X 10_9_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/33.0.1750.152 Safari/537.36").get();
		
					Elements e1 = doc.select(".labs-full-docsum"); //class �Ӽ��� rso�� ��� �±׸� ��������
					for(Element ele : e1){
						list.add(ele.html());
						out.print(ele.html());
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
		��ü
		ts.Pg8zWb.b80nOe.C1Iii.FddHQd.tsUanb
		
		select(".l.lLrAF")
		l lLrAF
		����
		
		dhIWPd
		���ƴ���(�����ڷ�) -2020.6.2
		
		st
		����
		
		th BbeB2d
		�̹���
		 -->
		</div> <!-- inner div -->
	</div><!-- outer div -->
</body>
</html>