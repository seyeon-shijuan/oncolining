<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- ★ -->
<%@page import="model.BoardDao"%> 
 <%@page import="model.Board"%> 
 <%@ page language="java" contentType="text/html; charset=EUC-KR" 
     pageEncoding="EUC-KR"%> 
 <%-- /WebContent/model1/board/updateForm.jsp 
    1. num값에 해당하는 게시물을 조회 
    2. 조회된 게시물을 화면에 출력 
  --%> 
 
 <!DOCTYPE html> 
 <html> 
 <head> 
 <meta charset="EUC-KR"> 
 <title>게시판 수정 화면</title> 
 <link rel="stylesheet" href="../../css/main.css"> 
 <script> 
   function file_delete() { 
 	  document.f.file2.value=""; 
 	  file_desc.style.display="none"; 
   } 
 </script>
 <script type="text/javascript" src="http://cdn.ckeditor.com/4.5.7/full/ckeditor.js"></script>
 </head> 
 <body> 
 <form action="update.do" method="post" enctype="multipart/form-data" 
    name="f"> 
    <input type="hidden" name="board_no" value="${b.board_no}"> 
    <input type="hidden" name="file2"  
    value="${b.board_file}"> 
    <table><caption>게시판 수정 화면</caption> 
    <tr><td>글쓴이</td><td> 
    <input type="text" name="mem_id" value="${b.mem_id}"></td></tr> 
    <tr><td>제목</td><td> 
    <input type="text" name="board_subject" value="${b.board_subject}"></td></tr> 
    <tr><td>내용</td><td> 
    <textarea rows="15" name="board_content" id="content1">${b.board_content}</textarea></td></tr> 
    <script>CKEDITOR.replace("content1",{filebrowserImageUploadUrl : "imgupload.do"});</script>
    <tr><td>첨부파일</td><td style="text-align: left"> 
    <c:if test="${!empty b.board_file}">
   	 <div id="file_desc">${b.board_file}
     	<a href="javascript:file_delete()">[첨부파일 삭제]</a>
     </div> 
    </c:if> 
    <input type="file" name="board_file"></td></tr> 
    <tr><td colspan="2">
	<a href="javascript:document.f.submit()" style="margin: 0 2% 0 2%">수정하기</a>
    <a href= "#" onClick="history.go(-1)" style="margin: 0 2% 0 2%">돌아가기</a> 
    </td></tr> 
    </table>    
 </form></body></html> 
