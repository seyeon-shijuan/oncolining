package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public abstract class UserLoginAction implements Action {
	protected String login;
	protected String mem_id;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login=(String)request.getSession().getAttribute("login");
		mem_id=request.getParameter("mem_id");
		if(login==null) {
			request.setAttribute("msg", "�α��� �� �ŷ��ϼ���");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false,"../alert.jsp");
		}
		if(mem_id!=null && !mem_id.equals(login) &&!login.equals("admin")) {
			request.setAttribute("msg", "���θ� �ŷ��� �� �ֽ��ϴ�.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false,"../alert.jsp");
		}
		
		return doExecute(request,response);
	}
	protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response);
	
}
