package action.clinicaltrial;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import action.member.UserLoginAction;
import model.Member;
import model.MemberDao;

public class ctdataFormAction  extends UserLoginAction{


	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		Member mem = new MemberDao().selectOne(login);
		request.setAttribute("mem", mem);
		return new ActionForward();
	}


}
