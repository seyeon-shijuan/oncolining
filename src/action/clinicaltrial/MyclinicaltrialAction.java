package action.clinicaltrial;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import action.member.UserLoginAction;
import model.Clinicaltrial;
import model.ClinicaltrialDao;

public class MyclinicaltrialAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String login = (String)request.getSession().getAttribute("login");
		List<Clinicaltrial> mylist = new ClinicaltrialDao().mylist(login);
		request.setAttribute("mylist", mylist);
		/*
		데이터 돌려받았는지 확인하는 구문
		for(int i=0; i<mylist.size(); i++) {
			System.out.println(mylist.get(i));
		}
		*/
		return new ActionForward();
	}

}
