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
		String msg = "아이디를 확인하세요";
		String url="loginForm.me";
		//1. 파라미터 저장
		String id= request.getParameter("id");
		String pass= request.getParameter("pass");
		//2. db 정보 읽기
		Member mem = new MemberDao().selectOne(id);
		//3. 아이디, 비밀번호 매칭
		if(mem != null) {
			if(pass.equals(mem.getPass())){
				request.getSession().setAttribute("login",id); //로그인 할 때 세션에 id 저장, identifier는 login
				msg = mem.getName() + "님이 로그인 했습니다.";
				url = "main.me";
			} else {
				msg = "비밀번호가 틀렸습니다.";
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}