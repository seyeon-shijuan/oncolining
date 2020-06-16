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
		mem.setId(request.getParameter("id"));
		mem.setPass(request.getParameter("pass"));
		mem.setName(request.getParameter("name"));
		mem.setGender(Integer.parseInt(request.getParameter("gender")));
		mem.setTel(request.getParameter("tel"));
		mem.setEmail(request.getParameter("email"));
		mem.setPicture(request.getParameter("picture"));
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
