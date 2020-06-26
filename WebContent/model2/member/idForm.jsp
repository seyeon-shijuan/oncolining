<%@ page language="java" contentType="text/html; charset=EUC-KR" 
     pageEncoding="EUC-KR"%> 
 <%-- /WebContent/model1/board/idForm.jsp --%>     
 <!DOCTYPE html> 
 <html> 
 <head><meta charset="EUC-KR"> 
 <title>아이디찾기</title> 
 <link rel="stylesheet" href="../../css/main.css"> 
 </head> 
 <body> 
 <h3>아이디찾기</h3> 
 <form action="id.me" method="post" name="f">
   <table> 
      <tr><th>이름</th><td><input type="text" name="mem_name"></td></tr> 
      <tr><th>생년월일</th><td><input type="text" name="mem_dateofbirth"></td></tr> 
      <tr><td colspan="2"><input type="submit" value="아이디찾기"></td></tr> 
   </table>	 
 </form></body></html> 
