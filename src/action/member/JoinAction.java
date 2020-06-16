package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
 * 1.파라미터정보를 Member 객체에 저장
 * 2.Member 객체의 정보를 db에 저장
 * 3.회원 가입 성공: loginForm.me 페이지 이동
 *  회원 가입 실패: joinForm.me 페이지 이동
 */

public class JoinAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("euc-kr");
		//1.파라미터정보를 Member 객체에 저장
		//2.Member 객체의 정보를 db에 저장
		Member mem = new Member();
		mem.setMem_id(request.getParameter("mem_id"));
		mem.setMem_pass(request.getParameter("mem_pass"));
		mem.setMem_name(request.getParameter("mem_name"));
		mem.setMem_nickname(request.getParameter("mem_nickname"));
		mem.setMem_birthdate(request.getParameter("mem_birthdate"));
		mem.setMem_gender(request.getParameter("mem_gender"));
		mem.setMem_diagnosis(request.getParameter("mem_diagnosis"));
		mem.setMem_dgdate(request.getParameter("mem_dgdate"));
		mem.setMem_stage(request.getParameter("mem_stage"));
		mem.setMem_docs(request.getParameter("mem_docs"));
	 //id pass name gender tell email picture
		
		String msg="회원가입 실패";
		String url = "joinForm.me";
		MemberDao dao = new MemberDao(); //model 클래스
		int result= dao.insert(mem);
		//3.회원 가입 성공: loginForm.me 페이지 이동
		if(result>0){ //db등록이 된 것이다.
			msg=mem.getName() + "님 회원 가입 완료";
			url="loginForm.me";
		}
		//회원 가입 실패: joinForm.me 페이지 이동
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}
