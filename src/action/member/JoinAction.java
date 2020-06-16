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
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
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
