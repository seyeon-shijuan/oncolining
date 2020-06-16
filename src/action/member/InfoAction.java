package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

public class InfoAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
        if(id == null) {
			request.setAttribute("msg", "id 파라미터를 오류 입니다.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false,"../alert.jsp");
        }
		Member mem = new MemberDao().selectOne(id);
		request.setAttribute("mem", mem);
		return new ActionForward();
	}

}
