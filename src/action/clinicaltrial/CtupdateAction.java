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

public class CtupdateAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		//1. �Ķ���� ������ Clinicaltrial ��ü�� ����
		
		/*ct_medicine ����๰ �������� ó��*/
		String[] value = request.getParameterValues("ct_medicine");
		String value2="";
		for(int i=0; i<value.length; i++) {
			if(i !=0) value2 += ", ";
			value2 += value[i];
		}
		
		/*ct_treatment ����ġ�� �������� ó��*/
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
		
		//2. Clinicaltrial ��ü�� ������ db�� ����
		String msg="�ӻ� �����Ͱ� �������� �ʾҽ��ϴ�.";
		String url = "ctupdateForm.me?num=${c.ct_datano}"; //���� ���ε�ιٲټ�
		
		ClinicaltrialDao dao = new ClinicaltrialDao();
		int result= dao.update(ct);
		//3.�ӻ� �Է� ����: main.me ������ �̵�
		if(result>0){ //db����� �� ���̴�.
			msg="�ӻ� �����Ͱ� �����Ǿ����ϴ�.";
			url="../clinicaltrial/myclinicaltrial.me"; 
		}
		//4.�ӻ� �Է� ���� : main.me ������ �̵�
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		
		return new ActionForward(false,"../alert.jsp");
	}


}
