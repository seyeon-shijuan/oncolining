package action.clinicaltrial;

import java.util.List;
import java.util.Map;

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
		//좌측 임상데이터
		List<Clinicaltrial> list = new ClinicaltrialDao().list();
		request.setAttribute("list", list);
		
		//우측 차트
		ClinicaltrialDao dao = new ClinicaltrialDao();
		List<Map<String,Integer>> list2 = dao.boardgraph2();
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		for(Map<String, Integer> m : list2) {
			for(Map.Entry<String, Integer> me : m.entrySet() ) {
				if(me.getKey().equals("name")) json.append("{\"name\":\""+me.getValue()+"\",");
				if(me.getKey().equals("cnt")) json.append("\"cnt\":"+me.getValue()+"}");
			}//Map.entry
			i++;
			if(i<list.size()) json.append(",");
		}//for
		json.append("]");
		request.setAttribute("json", json.toString().trim() );
		
		return new ActionForward();
	}


}
