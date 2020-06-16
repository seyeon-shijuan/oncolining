package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;

public class LoginAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		String msg = "���̵� Ȯ���ϼ���";
		String url="loginForm.me";
		//1. �Ķ���� ����
		String id= request.getParameter("id");
		String pass= request.getParameter("pass");
		//2. db ���� �б�
		Member mem = new MemberDao().selectOne(id);
		//3. ���̵�, ��й�ȣ ��Ī
		if(mem != null) {
			if(pass.equals(mem.getPass())){
				request.getSession().setAttribute("login",id); //�α��� �� �� ���ǿ� id ����, identifier�� login
				msg = mem.getName() + "���� �α��� �߽��ϴ�.";
				url = "main.me";
			} else {
				msg = "��й�ȣ�� Ʋ�Ƚ��ϴ�.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}