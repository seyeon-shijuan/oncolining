package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import action.Action;
import action.ActionForward;
import model.MemberDao;

public class IdAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		  String mem_name = request.getParameter("mem_name");
		  String mem_dateofbirth = request.getParameter("mem_dateofbirth");
		  String id = new MemberDao().idSearch(mem_name,mem_dateofbirth);
		  String star="";
		  if(!id.equals("없습니다.")){
		   for(int i=0;i<id.length()-((id.length()+1)/2);i++){
		    star += "*";
		   }
		   id=id.substring(0,(id.length()+1)/2);
		  }
		  String output = id.concat(star);
		  request.setAttribute("output", output);
		  request.setAttribute("id", id);

		return new ActionForward();
	}

}
