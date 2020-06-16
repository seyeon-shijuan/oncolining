<%@page import="model.MemberDao"%>
<%@page import="model.Member"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--
 1.��� parameter ������ Member ��ü�� ����
 2.�Էµ� ��й�ȣ��, db�� ����� ��й�ȣ�� ��
 	- ���� ���� ��� : "��й�ȣ�� Ʋ�Ƚ��ϴ�."  �޼��� alert�� updateForm.jsp �������� �̵�
 3.parameter�� ������ Member ��ü�� �̿��ؼ� db ������ ����
 	 - int MemberDao.update(Member)
 	 ����� 0 ���ϸ� '�ٽ� Ȯ�����ּ���' alert �� updateForm.jsp �������� �̵�
 	 ����� 1 �̻��̸� '�����Ǿ����ϴ�.' alert �� info.jsp �������� �̵� 
 --%>

<!--  1.��� parameter ������ Member ��ü�� ���� -->
<%request.setCharacterEncoding("euc-kr"); 
// Member mem = new Member();
%>
<jsp:useBean id="mem" class="model.Member"/>
<jsp:setProperty property="*" name="mem"/>

<!--  2.�Էµ� ��й�ȣ��, db�� ����� ��й�ȣ�� �� -->
<%
	MemberDao dao = new MemberDao();
	// data ���� ��ü�� �� ��
	Member dbmem = dao.selectOne(mem.getId());
	String login = (String)session.getAttribute("login");
	// �α��� �� �����Ϳ� ������Ű�� �� -> admin���� Ȯ���Ϸ���?
	String msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
	// ��� �����Ŀ� �� msg
	String url = "updateForm.jsp?id="+mem.getId();
	if(login.equals("admin") || mem.getPass().equals(dbmem.getPass())) {
		// �Էµ� ��й�ȣ .equals with db�� ����� ��й�ȣ ���� ����
		// or�� ���� true���Ǹ� �� ������ �������� �ʴ´�.
		// and�� �� ������ false�� �� ������ �������� �ʴ´�.
		/* 3.parameter�� ������ Member ��ü�� �̿��ؼ� db ������ ���� */
		int result= dao.update(mem);
		// true�� dao(���������尴ü)�� ���� update��� method�� �������Ѵ�.
		if(result >0){ // result ���ڰ� n���� n���� �׸��� �������ٴ� �ǹ�
			response.sendRedirect("info.jsp?id="+mem.getId());
		// ���� �ڵ带 �����ϰ� �������� ()�� �̵��Ѵ�.
		} else {
			msg="��������";
		}
	}
%>
<script>
	alert("<%=msg%>")
	location.href="<%=url%>";
</script>



