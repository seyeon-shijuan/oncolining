package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 * 1.�Ķ���������� Member ��ü�� ����
 * 2.Member ��ü�� ������ db�� ����
 * 3.ȸ�� ���� ����: loginForm.me ������ �̵�
 *  ȸ�� ���� ����: joinForm.me ������ �̵�
 */

public class JoinAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("euc-kr");
		//1.�Ķ���������� Member ��ü�� ����
		//2.Member ��ü�� ������ db�� ����
		Member mem = new Member();
		mem.setMem_id(request.getParameter("mem_id"));
		mem.setMem_pass(request.getParameter("mem_pass"));
		mem.setMem_name(request.getParameter("mem_name"));
		mem.setMem_nickname(request.getParameter("mem_nickname"));
		mem.setMem_birthdate(request.getParameter("mem_birthdate"));
		mem.setMem_gender(request.getParameter("mem_gender"));
		mem.setMem_diagnosis(request.getParameter("mem_diagnosis"));
		mem.setMem_dgdate(request.getParameter("mem_dgdate"));
		mem.setMem_stage(request.getParameter("mem_stage"));
		mem.setMem_docs(request.getParameter("mem_docs"));
	 //id pass name gender tell email picture
		
		String msg="ȸ������ ����";
		String url = "joinForm.me";
		MemberDao dao = new MemberDao(); //model Ŭ����
		int result= dao.insert(mem);
		//3.ȸ�� ���� ����: loginForm.me ������ �̵�
		if(result>0){ //db����� �� ���̴�.
			msg=mem.getName() + "�� ȸ�� ���� �Ϸ�";
			url="loginForm.me";
		}
		//ȸ�� ���� ����: joinForm.me ������ �̵�
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}
