package action.clinicaltrial;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import action.member.UserLoginAction;
import model.Clinicaltrial;
import model.ClinicaltrialDao;
import model.Member;
import model.MemberDao;


public class ClinicaltrialmainAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		List<Clinicaltrial> list = new ClinicaltrialDao().list();
		request.setAttribute("list", list);
		
		//여기에 차트도하셈
		return new ActionForward();
	}

}
