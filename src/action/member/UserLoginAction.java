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
			request.setAttribute("msg", "로그인 후 거래하세요");
			request.setAttribute("url", "loginForm.me");
			return new ActionForward(false,"../alert.jsp");
		}
		if(mem_id!=null && !mem_id.equals(login) &&!login.equals("admin")) {
			request.setAttribute("msg", "본인만 거래할 수 있습니다.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false,"../alert.jsp");
		}
		
		return doExecute(request,response);
	}
	protected abstract ActionForward doExecute(HttpServletRequest request, HttpServletResponse response);
	
}
