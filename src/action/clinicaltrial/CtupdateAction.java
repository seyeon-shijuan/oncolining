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

public class CtupdateAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//1. 파라미터 정보를 Clinicaltrial 객체에 저장
		
		/*ct_medicine 복용약물 복수응답 처리*/
		String[] value = request.getParameterValues("ct_medicine");
		String value2="";
		for(int i=0; i<value.length; i++) {
			if(i !=0) value2 += ", ";
			value2 += value[i];
		}
		
		/*ct_treatment 병행치료 복수응답 처리*/
		String[] value3 = request.getParameterValues("ct_treatment");
		String value4="";
		for(int i=0; i<value3.length; i++) {
			if(i !=0) value4 += ", ";
			value4 += value3[i];
		}
		
		
		Clinicaltrial ct = new Clinicaltrial();
		ct.setCt_datano(request.getParameter("ct_datano"));
		ct.setMem_id(request.getParameter("mem_id"));
		ct.setCt_week(request.getParameter("ct_week"));
		ct.setCt_age(request.getParameter("ct_age"));
		//ct.setCt_medicine(request.getParameter("ct_medicine"));
		ct.setCt_medicine(value2);
		ct.setCt_frequency(request.getParameter("ct_frequency"));
		ct.setCt_otherfqc(request.getParameter("ct_otherfqc"));
		ct.setCt_dosage(request.getParameter("ct_dosage"));
		//ct.setCt_treatment(request.getParameter("ct_treatment"));
		ct.setCt_treatment(value4);
		ct.setCt_suppliment(request.getParameter("ct_suppliment"));
		ct.setCt_pain(request.getParameter("ct_pain"));
		ct.setCt_fatigue(request.getParameter("ct_fatigue"));
		ct.setCt_side_effect(request.getParameter("ct_side_effect"));
		ct.setCt_tumor_size(request.getParameter("ct_tumor_size"));
		ct.setCt_blood_test(request.getParameter("ct_blood_test"));
		
		//2. Clinicaltrial 객체의 정보를 db에 저장
		String msg="임상 데이터가 수정되지 않았습니다.";
		String url = "ctupdateForm.me?num=${c.ct_datano}"; //여기 리로드로바꾸셈
		
		ClinicaltrialDao dao = new ClinicaltrialDao();
		int result= dao.update(ct);
		//3.임상 입력 성공: main.me 페이지 이동
		if(result>0){ //db등록이 된 것이다.
			msg="임상 데이터가 수정되었습니다.";
			url="../clinicaltrial/myclinicaltrial.me"; 
		}
		//4.임상 입력 실패 : main.me 페이지 이동
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false,"../alert.jsp");
	}


}
