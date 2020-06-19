<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- ★ -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- ★ -->
<%--
1. 한페이지당 10건의 게시물을 출력하기. pageNum parameter을 저장
	-> 없는 경우는 1로 설정하기.
2. 최근 등록된 게시물이 가장 위에 배치됨.
3. db에서 해당 페이지에 출력될 내용을 조회하여 화면에 출력.
	게시물을 출력 부분
	페이지 구분 출력 부분
 --%>
<!-- ★지움 -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>게시물 목록 보기</title>
<link rel="stylesheet" href="../../css/main.css">
<script type="text/javascript">
	function listdo(page) {
		f = document.sf;
		f.pageNum.value=page;
		f.submit();
	}
</script>
<style>
.container {
	position: relative;
}

.span4 {
	background: #252525;
	position: relative;
	margin: 0;
	padding: 0;
	color: #fefefe;
	height: 90px;
}

.inner-heading {
	color: #fff;
	margin: 20px 0 0 0;
}

.titletext {
	font-size: xx-large;
	display: inline-block;
	vertical-align: middle;
	margin-left: 60px;
}

.content{margin:30px 60px;}

caption {margin: 0 0 20px 0}

#pagechange{text-align:center;}
</style>
</head>
<body>



	
	<table>
		<caption>게시판 목록</caption>
		<c:choose><c:when test="${boardcount==0}"> <!-- ★등록된 게시물 없는경우 -->
			<tr><td colspan="6">등록된 게시글이 없습니다.</td></tr>
		</c:when><c:otherwise> <!-- ★등록된 게시물 있는경우 -->
			<tr><td colspan="6" style="text-align:right">글 개수: ${boardcount}</td></tr>
			<tr>
				<th width="4%">No.</th><th width="50%">토픽 제목</th>
				<th width="10%">작성자</th><th width="17%">등록일</th>
				<th width="10%">조회수</th><th width="9%">의견</th>
			</tr>
			<c:forEach var="b" items="${list}">
				<!--  이게 뭘 한거지??-->
				<tr>
					<td>${boardnum}</td><c:set var="boardnum" value="${boardnum-1}"/>
					<td style="text-align: left">
					
					<!--  ★여기부터 첨부파일이 있으면 @에 하이퍼링크 넣기 -->
					<c:choose>
						<c:when test="${!empty b.file1 }">
							<a href="file/${b.file1}" style="text-decoration: none;">@</a>
						</c:when>
						<c:otherwise>
							&nbsp;&nbsp;&nbsp;
						</c:otherwise>
					</c:choose>
					<!--  ★여기까지 첨부파일이 있으면 @에 하이퍼링크 넣기 -->
					
					<!-- ★여기부터 reply 이면 3칸 띄어쓰기 -->
					<c:if test="${b.grplevel>0}">
						<c:forEach begin="1" end="${b.grplevel}">
							&nbsp;&nbsp;&nbsp;
						</c:forEach>
						└
					</c:if>
					<!-- ★여기까지 reply 이면 3칸 띄어쓰기 -->
			
					<a href="info.do?num=${b.num}">${b.subject}</a>
					</td> <!-- ★ style left -->
					<td>${b.name}</td>
					
					<!-- 여기부터 오늘이면 시간만, 어제까지는 전체 날짜 작성하는 방법 -->
					<td> 
						<fmt:formatDate var="rdate" value="${b.regdate}" pattern="yyyy-MM-dd" />
						<c:if test="${today==rdate}">
							<fmt:formatDate value="${b.regdate}" pattern="HH:mm:ss" />
						</c:if>
						<c:if test="${today!=rdate}">
							<fmt:formatDate value="${b.regdate}" pattern="yyyy-MM-dd"/>
						</c:if>
					</td>
					<td>
						${b.readcnt}
					</td>
					<td>
						${b.readcnt}
					</td>
				</tr>		
			</c:forEach>
			<!-- ★까지 게시글을 조회해주는 부분 -->
			<tr>
				<td colspan="6" style="text-align:right">
					<a href="writeForm.me">[글쓰기]</a>
				</td>
			</tr>
			
			
	</table>
	
	<!-- 페이지 넘어가는 부분 -->
	<div id="pagechange">
			<p>
				<p colspan="5">
				<c:if test="${pageNum<=1}">
					[이전]
				</c:if>
				<c:if test="${pageNum>1}">
					<a href="javascript:listdo(${pageNum-1})">[이전]</a>
				</c:if>
				<c:forEach var="a" begin="${startpage}" end="${endpage}">
 					<c:if test="${a==pageNum}">
        		  		 [${a}]
        			 </c:if>
			         <c:if test="${a!=pageNum}">
			         <a href="javascript:listdo(${a})">[${a}]</a>
      				 </c:if>
				</c:forEach>
				
				<c:if test="${pageNum>=maxpage}">
					[다음]
					<!--  if yes, nothing happens -->
				</c:if>
				<c:if test="${pageNum<maxpage}">
					<a href="javascript:listdo(${pageNum + 1})">[다음]</a>
					<!-- if no, go to the 2page -->
				</c:if>
				</p> <!-- colspan: 5 -->
			</p>
			<!--  까지 page 처리 하는 clauses -->
			<!--  게시글의 끝 -->
			</c:otherwise>
			</c:choose>
		</div>
	
	
	<form action="list.do" method="post" name="sf">
		<div style="display : flex; justify-content: center;">
			<input type="hidden" name="pageNum" value="1">
			<select name= "column">
				<option value="">선택하세요</option>
				<option value="subject">제목</option>
				<option value="name">작성자</option>
				<option value="content">내용</option>
				<option value="subject,name">제목+작성자</option>
				<option value="subject,content">제목+내용</option>
				<option value="name,content">작성자+내용</option>
				<option value="subject,name,content">제목+작성자+내용</option>
			</select>
			<script>document.sf.column.value = "${param.column}";</script> 
			<input type="text" name="find" value="${param.find}" style="width:50%;">  
			<input type="submit" value="검색">
		</div>
	</form>
</body>
</html>