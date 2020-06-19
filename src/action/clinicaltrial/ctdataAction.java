package action.clinicaltrial;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import action.member.UserLoginAction;
import model.Clinicaltrial;
import model.ClinicaltrialDao;
import model.Member;
import model.MemberDao;

/*
 * 1.파라미터정보를 Clinicaltrial 객체에 저장
 * 2.Clinicaltrial 객체의 정보를 db에 저장
 * 3.임상 입력 성공: main.me 페이지 이동
 *  입상 입력 실패: ctdataForm.me 페이지 이동
 */

public class ctdataAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//1. 파라미터 정보를 Clinicaltrial 객체에 저장
		Clinicaltrial ct = new Clinicaltrial();
		ct.setMem_id(request.getParameter("mem_id"));
		ct.setCt_week(request.getParameter("ct_week"));
		ct.setCt_age(request.getParameter("ct_age"));
		ct.setCt_medicine(request.getParameter("ct_medicine"));
		ct.setCt_frequency(request.getParameter("ct_frequency"));
		ct.setCt_otherfqc(request.getParameter("ct_otherfqc"));
		ct.setCt_dosage(request.getParameter("ct_dosage"));
		ct.setCt_treatment(request.getParameter("ct_treatment"));
		ct.setCt_suppliment(request.getParameter("ct_suppliment"));
		ct.setCt_pain(request.getParameter("ct_pain"));
		ct.setCt_fatigue(request.getParameter("ct_fatigue"));
		ct.setCt_side_effect(request.getParameter("ct_side_effect"));
		ct.setCt_tumor_size(request.getParameter("ct_tumor_size"));
		ct.setCt_blood_test(request.getParameter("ct_blood_test"));
		
		//2. Clinicaltrial 객체의 정보를 db에 저장
		String msg="임상 데이터가 전송되지 않았습니다.";
		String url = "ctdataForm.me";
		
		ClinicaltrialDao dao = new ClinicaltrialDao();
		int result= dao.insert(ct);
		//3.임상 입력 성공: main.me 페이지 이동
		if(result>0){ //db등록이 된 것이다.
			msg="임상 데이터가 입력되었습니다.";
			url="main.me";
		}
		
		
		
		
		
		return null;
	}


}
