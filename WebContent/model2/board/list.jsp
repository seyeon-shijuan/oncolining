<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- �� -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %><!-- �� -->
<%--
1. ���������� 10���� �Խù��� ����ϱ�. pageNum parameter�� ����
	-> ���� ���� 1�� �����ϱ�.
2. �ֱ� ��ϵ� �Խù��� ���� ���� ��ġ��.
3. db���� �ش� �������� ��µ� ������ ��ȸ�Ͽ� ȭ�鿡 ���.
	�Խù��� ��� �κ�
	������ ���� ��� �κ�
 --%>
<!-- ������ -->
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>�Խù� ��� ����</title>
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
caption {margin: 0 0 20px 0}
#pagechange{text-align:center;}
.inner_frame {text-align: center; margin-top: 2%; padding: 0 4% 0 4%;}

</style>
</head>
<body>
	<div class="outer_frame">
		<button  class="small_button_on" onclick="location.href='../board/list.do'">&nbsp;&nbsp;�ӻ� ����&nbsp;&nbsp;</button>
		<button  class="small_button_off"  onclick="location.href='../chat/chatform.do'">&nbsp;&nbsp;�ǽð� ä��&nbsp;&nbsp;</button>
		<div class="inner_frame">
		
			<table>
				<caption>�ӻ� ����</caption>
				<c:choose><c:when test="${boardcount==0}"> <!-- �ڵ�ϵ� �Խù� ���°�� -->
					<tr><td colspan="6">��ϵ� �Խñ��� �����ϴ�.</td></tr>
				</c:when><c:otherwise> <!-- �ڵ�ϵ� �Խù� �ִ°�� -->
					<tr><td colspan="6" style="text-align:right">�� ����: ${boardcount}</td></tr>
					<tr>
						<th width="4%">No.</th><th width="45%">���� ����</th>
						<th width="12%">�ۼ���</th><th width="17%">�����</th>
						<th width="11%">��ȸ��</th><th width="11%">�ǰ�</th>
					</tr>
					<c:forEach var="b" items="${list}">
						<!--  �̰� �� �Ѱ���??-->
						<tr>
							<td>${boardnum}</td><c:set var="boardnum" value="${boardnum-1}"/>
							<td style="text-align: left">
							
							<!--  �ڿ������ ÷�������� ������ @�� �����۸�ũ �ֱ� -->
							<c:choose>
								<c:when test="${!empty b.board_file}">
									<a href="file/${b.board_file}" style="text-decoration: none;">@</a>
								</c:when>
								<c:otherwise>
									&nbsp;&nbsp;&nbsp;
								</c:otherwise>
							</c:choose>
							<!--  �ڿ������ ÷�������� ������ @�� �����۸�ũ �ֱ� -->
							
							<!-- �ڿ������ reply �̸� 3ĭ ���� -->
							<c:if test="${b.board_grplevel>0}">
								<c:forEach begin="1" end="${b.board_grplevel}">
									&nbsp;&nbsp;&nbsp;
								</c:forEach>
								��
							</c:if>
							<!-- �ڿ������ reply �̸� 3ĭ ���� -->
					
							<a href="info.do?num=${b.board_no}">${b.board_subject}</a>
							</td> <!-- �� style left -->
							<td>${b.mem_id}</td>
							
							<!-- ������� �����̸� �ð���, ���������� ��ü ��¥ �ۼ��ϴ� ��� -->
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
							<td>
								${b.board_readcnt}
							</td>
						</tr>		
					</c:forEach>
					<!-- �ڱ��� �Խñ��� ��ȸ���ִ� �κ� -->
					<tr>
						<td colspan="6" style="text-align:right">
							<a href="writeForm.do">�۾���</a>
						</td>
					</tr>
					
					
			</table>
			
			<!-- ������ �Ѿ�� �κ� -->
			<div id="pagechange">
					<p>
						<p colspan="5">
						<c:if test="${pageNum<=1}">
							[����]
						</c:if>
						<c:if test="${pageNum>1}">
							<a href="javascript:listdo(${pageNum-1})">[����]</a>
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
							[����]
							<!--  if yes, nothing happens -->
						</c:if>
						<c:if test="${pageNum<maxpage}">
							<a href="javascript:listdo(${pageNum + 1})">[����]</a>
							<!-- if no, go to the 2page -->
						</c:if>
						</p> <!-- colspan: 5 -->
					</p>
					<!--  ���� page ó�� �ϴ� clauses -->
					<!--  �Խñ��� �� -->
					</c:otherwise>
					</c:choose>
				</div>
			
			
			<form action="list.do" method="post" name="sf">
				<div style="display : flex; justify-content: center;">
					<input type="hidden" name="pageNum" value="1">
					<select name= "column">
						<option value="">�����ϼ���</option>
						<option value="board_subject">����</option>
						<option value="mem_id">�ۼ���</option>
						<option value="board_content">����</option>
						<option value="board_subject,mem_id">����+�ۼ���</option>
						<option value="board_subject,board_content">����+����</option>
						<option value="mem_id,board_content">�ۼ���+����</option>
						<option value="board_subject,mem_id,board_content">����+�ۼ���+����</option>
					</select>
					<script>document.sf.column.value = "${param.column}";</script> 
					<input type="text" name="find" value="${param.find}" style="width:50%;">  
					<input type="submit" value="�˻�">
				</div>
			</div> <!-- inner frame -->
		</div><!-- outer frame -->
	</form>
</body>
</html>