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
		String msg = "main���� �̵��մϴ�.";
		String url = "main.me";
		Clinicaltrial ct = dao.selectOne(ct_datano);
		
		if (ct == null) {
			msg = "�߸��� �����Դϴ�.";
			url = "myclinicaltrial.me";
		} else {
				if (dao.delete(ct_datano)) {
					msg = "�ӻ� �����Ͱ� �����Ǿ����ϴ�.";
					url = "myclinicaltrial.me";
				} else {
					msg = "�����Ͱ� �������� �ʾҽ��ϴ�.";
					url = "myclinicaltrial.me";
				}
		} // else

		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert2.jsp");
	}

}
