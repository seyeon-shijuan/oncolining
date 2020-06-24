package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;

public abstract class UserLoginAction implements Action {
	protected String login;
	protected String mem_id;
	protected String mem_nickname;
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		login=(String)request.getSession().getAttribute("login");
		mem_id=request.getParameter("mem_id");
		mem_nickname=request.getParameter("mem_id");
		if(login==null) {
			request.setAttribute("msg", "로그인 후 접근할 수 있습니다.");
			request.setAttribute("url", "../member/loginForm.me");
			return new ActionForward(false,"../alert.jsp");
		}
		if(mem_id!=null && !mem_id.equals(login) &&!login.equals("admin")) {
			request.setAttribute("msg", "잘못된 접근입니다.");
			request.setAttribute("url", "../member/main.me");
			return new ActionForward(false,"../alert.jsp");
		}
		
		return doExecute(request,response);
	}
	protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response);
	
}
