package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

public class InfoAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
        if(mem_id == null) {
			request.setAttribute("msg", "id 파라미터 오류가 발생했습니다.");
			request.setAttribute("url", "main.me");
			return new ActionForward(false,"../alert.jsp");
        }
		Member mem = new MemberDao().selectOne(mem_id);
		request.setAttribute("mem", mem);
		return new ActionForward();
	}

}
