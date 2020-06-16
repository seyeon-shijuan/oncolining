package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

/*
 * ������ �ŷ��� ��� ���Ǵ� �߻� Ŭ����
 * 1. �α׾ƿ� ����: �α����� �ʿ��մϴ�. �޼��� ��� loginForm.me ������ �̵�
 * 2. �α��� ����
 *     �Ϲ� �����: �����ڸ� ��� �����մϴ�. �޽��� ���. main.me ������ �̵�
 * 3. ������ ����=> ������ �����
 *     doExecute �޼��� call
 */
public abstract class AdminLoginAction implements Action {
	//error �ȳ��� ���� = �߻� Ŭ������ �߻� �޼��带 ���� �� �־ ������ �ȳ���.
	protected String login;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) {
		login=(String)request.getSession().getAttribute("login");
		if(login == null) {
			request.setAttribute("msg", "�α��� �ϼ���");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false,"../alert.jsp");
		}
		if(!login.equals("admin")) {
			request.setAttribute("msg","�����ڸ� �����մϴ�.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false,"../alert.jsp");
		}
		return doExecute(request,response);
	}
	protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response);

}
