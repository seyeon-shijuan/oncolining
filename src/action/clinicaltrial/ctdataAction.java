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
 * 1.�Ķ���������� Clinicaltrial ��ü�� ����
 * 2.Clinicaltrial ��ü�� ������ db�� ����
 * 3.�ӻ� �Է� ����: main.me ������ �̵�
 *  �Ի� �Է� ����: ctdataForm.me ������ �̵�
 */

public class ctdataAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//1. �Ķ���� ������ Clinicaltrial ��ü�� ����
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
		
		//2. Clinicaltrial ��ü�� ������ db�� ����
		String msg="�ӻ� �����Ͱ� ���۵��� �ʾҽ��ϴ�.";
		String url = "ctdataForm.me";
		
		ClinicaltrialDao dao = new ClinicaltrialDao();
		int result= dao.insert(ct);
		//3.�ӻ� �Է� ����: main.me ������ �̵�
		if(result>0){ //db����� �� ���̴�.
			msg="�ӻ� �����Ͱ� �ԷµǾ����ϴ�.";
			url="main.me";
		}
		
		
		
		
		
		return null;
	}


}
