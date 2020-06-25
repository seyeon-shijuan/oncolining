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


public class Graph2Action extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		//좌측 임상데이터
		List<Clinicaltrial> list = new ClinicaltrialDao().list();
		request.setAttribute("list", list);
		
		//우측 차트 : 여기가 함수 시작점
		ClinicaltrialDao dao = new ClinicaltrialDao();
		//list : [{name:'홍길동',cnt:9},{name:'111',cnt:3}] map collection을 list collection이 가지고 있는 형태
		List<Map<String,Integer>> list2 = dao.graph2();
		//System.out.println("=========Graph2Action.java=========");
		//System.out.println(list2);
		//System.out.println("=========/Graph2Action.java=========");
		StringBuilder json = new StringBuilder("[");
		int i = 0;
		String a = null;
		for(Map<String, Integer> m : list2) {
			for(Map.Entry<String, Integer> me : m.entrySet() ) {
				if(me.getKey().equals("cnt")) a="\"cnt\":"+me.getValue()+"},";
				if(me.getKey().equals("mem_diagnosis")) {json.append("{\"mem_diagnosis\":\""+me.getValue()+"\",");
				json.append(a);
				}
				
			}//Map.entry
			i++;
			if(i<list2.size()-1) json.append(",");
			
		}//for
		
		String json2=json.substring(0, json.length() - 1);
		json.delete(0,json.length());
		json.append(json2+"]");
		System.out.println(json);
		request.setAttribute("json", json.toString().trim() );
		System.out.println(json.toString().trim());
		
		return new ActionForward();
	}


}
