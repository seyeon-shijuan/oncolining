<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <!-- �� -->
<%@page import="model.BoardDao"%> 
 <%@page import="model.Board"%> 
 <%@ page language="java" contentType="text/html; charset=EUC-KR" 
     pageEncoding="EUC-KR"%> 
 <%-- /WebContent/model1/board/updateForm.jsp 
    1. num���� �ش��ϴ� �Խù��� ��ȸ 
    2. ��ȸ�� �Խù��� ȭ�鿡 ��� 
  --%> 
 
 <!DOCTYPE html> 
 <html> 
 <head> 
 <meta charset="EUC-KR"> 
 <title>�Խ��� ���� ȭ��</title> 
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
    <table><caption>�Խ��� ���� ȭ��</caption> 
    <tr><td>�۾���</td><td> 
    <input type="text" name="mem_id" value="${b.mem_id}"></td></tr> 
    <tr><td>����</td><td> 
    <input type="text" name="board_subject" value="${b.board_subject}"></td></tr> 
    <tr><td>����</td><td> 
    <textarea rows="15" name="board_content" id="content1">${b.board_content}</textarea></td></tr> 
    <script>CKEDITOR.replace("content1",{filebrowserImageUploadUrl : "imgupload.do"});</script>
    <tr><td>÷������</td><td style="text-align: left"> 
    <c:if test="${!empty b.board_file}">
   	 <div id="file_desc">${b.board_file}
     	<a href="javascript:file_delete()">[÷������ ����]</a>
     </div> 
    </c:if> 
    <input type="file" name="board_file"></td></tr> 
    <tr><td colspan="2">
	<a href="javascript:document.f.submit()" style="margin: 0 2% 0 2%">�����ϱ�</a>
    <a href= "#" onClick="history.go(-1)" style="margin: 0 2% 0 2%">���ư���</a> 
    </td></tr> 
    </table>    
 </form></body></html> 
