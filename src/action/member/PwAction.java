package action.member;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.MemberDao;

public class PwAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		  String id = request.getParameter("id");
		  String email = request.getParameter("email");
		  String tel = request.getParameter("tel");
		  String pw = new MemberDao().pwSearch(id,email,tel);
		  String star="";
		  if(!pw.equals("없습니다.")){
		   for(int i=0;i<pw.length()-((pw.length()+1)/2);i++)
		    star+="*";
		   pw=pw.substring((pw.length()+1)/2);
		  }
		  String output = star.concat(pw);
		  request.setAttribute("output", output);
		return new ActionForward();
	}

}
