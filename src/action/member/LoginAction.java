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
		String mem_id= request.getParameter("mem_id");
		String mem_pass= request.getParameter("mem_pass");
		//2. db 정보 읽기
		Member mem = new MemberDao().selectOne(mem_id);
		//3. 아이디, 비밀번호 매칭
		if(mem != null) {
			if(mem_pass.equals(mem.getMem_pass())){
				request.getSession().setAttribute("login",mem_id); //로그인 할 때 세션에 id 저장, identifier는 login
				request.getSession().setAttribute("nickname",mem.getMem_nickname()); //로그인 할 때 세션에 nickname 저장, identifier는 nickname
				msg = mem.getMem_name()+ "("+ mem.getMem_nickname() +")"+ "님이 로그인 했습니다.";
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