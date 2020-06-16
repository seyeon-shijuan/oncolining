<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
 1.모든 parameter 정보를 Member 객체에 저장
 2.입력된 비밀번호와, db에 저장된 비밀번호를 비교
 	- 같지 않은 경우 : "비밀번호가 틀렸습니다."  메세지 alert후 updateForm.jsp 페이지로 이동
 3.parameter을 저장한 Member 객체를 이용해서 db 정보를 수정
 	 - int MemberDao.update(Member)
 	 결과가 0 이하면 '다시 확인해주세요' alert 후 updateForm.jsp 페이지로 이동
 	 결과가 1 이상이면 '수정되었습니다.' alert 후 info.jsp 페이지로 이동 
 --%>

<!--  1.모든 parameter 정보를 Member 객체에 저장 -->
<%request.setCharacterEncoding("euc-kr"); 
// Member mem = new Member();
%>
<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty property="*" name="mem"/>

<!--  2.입력된 비밀번호와, db에 저장된 비밀번호를 비교 -->
<%
	MemberDao dao = new MemberDao();
	// data 저장 객체가 들어간 곳
	Member dbmem = dao.selectOne(mem.getId());
	String login = (String)session.getAttribute("login");
	// 로그인 된 데이터와 연동시키는 것 -> admin인지 확인하려고?
	String msg = "비밀번호가 틀렸습니다.";
	// 비번 검증후에 쓸 msg
	String url = "updateForm.jsp?id="+mem.getId();
	if(login.equals("admin") || mem.getPass().equals(dbmem.getPass())) {
		// 입력된 비밀번호 .equals with db에 저장된 비밀번호 인지 여부
		// or은 앞이 true가되면 뒷 문장을 실행하지 않는다.
		// and는 뒷 문장이 false면 앞 문장을 실행하지 않는다.
		/* 3.parameter을 저장한 Member 객체를 이용해서 db 정보를 수정 */
		int result= dao.update(mem);
		// true면 dao(데이터저장객체)에 들어가서 update라는 method를 만들어야한다.
		if(result >0){ // result 숫자가 n개면 n개의 항목이 고쳐졌다는 의미
			response.sendRedirect("info.jsp?id="+mem.getId());
		// 위에 코드를 실행하고 페이지를 ()로 이동한다.
		} else {
			msg="수정실패";
		}
	}
%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>";
</script>



