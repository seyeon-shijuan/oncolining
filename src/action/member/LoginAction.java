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
		String mem_id= request.getParameter("mem_id");
		String mem_pass= request.getParameter("mem_pass");
		//2. db ���� �б�
		Member mem = new MemberDao().selectOne(mem_id);
		//3. ���̵�, ��й�ȣ ��Ī
		if(mem != null) {
			if(mem_pass.equals(mem.getMem_pass())){
				request.getSession().setAttribute("login",mem_id); //�α��� �� �� ���ǿ� id ����, identifier�� login
				request.getSession().setAttribute("nickname",mem.getMem_nickname()); //�α��� �� �� ���ǿ� nickname ����, identifier�� nickname
				msg = mem.getMem_name()+ "("+ mem.getMem_nickname() +")"+ "���� �α��� �߽��ϴ�.";
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