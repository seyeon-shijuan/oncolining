package action.clinicaltrial;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import model.Board;
import model.BoardDao;
import model.Member;
import model.MemberDao;
import model.Clinicaltrial;
import model.ClinicaltrialDao;

/*
 
 */
public class CtdeleteAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		ClinicaltrialDao dao = new ClinicaltrialDao();
		int ct_datano = Integer.parseInt(request.getParameter("ct_datano"));
		String msg = "main으로 이동합니다.";
		String url = "main.me";
		Clinicaltrial ct = dao.selectOne(ct_datano);
		
		if (ct == null) {
			msg = "잘못된 접근입니다.";
			url = "myclinicaltrial.me";
		} else {
				if (dao.delete(ct_datano)) {
					msg = "임상 데이터가 삭제되었습니다.";
					url = "myclinicaltrial.me";
				} else {
					msg = "데이터가 삭제되지 않았습니다.";
					url = "myclinicaltrial.me";
				}
		} // else

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert2.jsp");
	}

}
