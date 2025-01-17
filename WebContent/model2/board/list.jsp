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
<link rel="stylesheet" href="../../css/smallbutton.css">
<script type="text/javascript">
	function listdo(page) {
		f = document.sf;
		f.pageNum.value=page;
		f.submit();
	}
</script>
<style>
th {background-color: #E6E6E6;}
td {background-color: #FAFAFA;}
caption {margin: 0 0 20px 0}
#pagechange{text-align:center;}
.inner_frame {text-align: center; margin-top: 2%; padding: 0 4% 0 4%;}

</style>
</head>
<body>
	<div class="outer_frame">
		<button  class="small_button_on" onclick="location.href='../board/list.do'">&nbsp;&nbsp;임상 포럼&nbsp;&nbsp;</button>
		<button  class="small_button_off"  onclick="location.href='../chat/chatform.do'">&nbsp;&nbsp;실시간 채팅&nbsp;&nbsp;</button>
		<div class="inner_frame">
		
			<table>
				<caption>임상 포럼</caption>
				<c:choose><c:when test="${boardcount==0}"> <!-- ★등록된 게시물 없는경우 -->
					<tr><td colspan="6">등록된 게시글이 없습니다.</td></tr>
				</c:when><c:otherwise> <!-- ★등록된 게시물 있는경우 -->
					<tr><td colspan="6" style="text-align:right; background-color: #FFFFFF;">글 개수: ${boardcount}</td></tr>
					<tr>
						<th width="12%">No.</th><th width="45%">토픽 제목</th>
						<th width="15%">작성자</th><th width="14%">등록일</th>
						<th width="14%">조회수</th>
					</tr>
					<c:forEach var="b" items="${list}">
						<tr>
							<td>${boardnum}</td><c:set var="boardnum" value="${boardnum-1}"/>
							<td style="text-align: left">
							
							<!--  ★여기부터 첨부파일이 있으면 @에 하이퍼링크 넣기 -->
							<c:choose>
								<c:when test="${!empty b.board_file}">
									<a href="file/${b.board_file}" style="text-decoration: none;">@</a>
								</c:when>
								<c:otherwise>
									&nbsp;&nbsp;&nbsp;
								</c:otherwise>
							</c:choose>
							<!--  ★여기까지 첨부파일이 있으면 @에 하이퍼링크 넣기 -->
							
							<!-- ★여기부터 reply 이면 3칸 띄어쓰기 -->
							<c:if test="${b.board_grplevel>0}">
								<c:forEach begin="1" end="${b.board_grplevel}">
									&nbsp;&nbsp;&nbsp;
								</c:forEach>
								└
							</c:if>
							<!-- ★여기까지 reply 이면 3칸 띄어쓰기 -->
					
							<a href="info.do?num=${b.board_no}">${b.board_subject}</a>
							</td> <!-- ★ style left -->
							<td>${b.mem_id}</td>
							
							<!-- 여기부터 오늘이면 시간만, 어제까지는 전체 날짜 작성하는 방법 -->
							<td> 
								<fmt:formatDate var="rdate" value="${b.board_regdate}" pattern="yyyy-MM-dd" />
								<c:if test="${today==rdate}">
									<fmt:formatDate value="${b.board_regdate}" pattern="HH:mm:ss" />
								</c:if>
								<c:if test="${today!=rdate}">
									<fmt:formatDate value="${b.board_regdate}" pattern="yyyy-MM-dd"/>
								</c:if>
							</td>
							<td>
								${b.board_readcnt}
							</td>
						</tr>		
					</c:forEach>
					<!-- ★까지 게시글을 조회해주는 부분 -->
					<tr>
						<td colspan="6" style="text-align:right">
							<a href="writeForm.do">글쓰기</a>
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
						<option value="board_subject">제목</option>
						<option value="mem_id">작성자</option>
						<option value="board_content">내용</option>
						<option value="board_subject,mem_id">제목+작성자</option>
						<option value="board_subject,board_content">제목+내용</option>
						<option value="mem_id,board_content">작성자+내용</option>
						<option value="board_subject,mem_id,board_content">제목+작성자+내용</option>
					</select>
					<script>document.sf.column.value = "${param.column}";</script> 
					<input type="text" name="find" value="${param.find}" style="width:50%;">  
					<input type="submit" value="검색">
				</div>
			</div> <!-- inner frame -->
		</div><!-- outer frame -->
	</form>
</body>
</html>