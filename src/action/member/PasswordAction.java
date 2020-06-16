package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
    1.로그아웃상태인 경우 '로그인하세요' 메세지 출력
	   다른사용자의 비밀번호는 변경 불가
	   opener 페이지를 loginForm.me 페이지 이동.
	   현재페이지 닫기
	2.pass, chgpass 파라미터 값저장
	3.pass 비밀번호가 db에 저장된 비밀번호와 다르면
	  비밀번호 오류 메세지 출력. passwordForm.me 페이지 이동
	4.pass 비밀번호가 db에 저장된 비밀번호와 같으면
	   비밀번호 수정.
	   opener 페이지를 updateForm.me 페이지로 이동.
	   현재페이지 닫기
 */
public class PasswordAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		String msg ="변경실패";
		String url="passwordform.me";
		boolean closer=false; //true->alert2로 감
		
		MemberDao dao=new MemberDao();
		//mem=현재로그인한 계정의 정보
		Member mem=dao.selectOne(login);
		//pass= passwordform에서 입력한 현재비밀번호, chgpass=바꿀 비밀번호
		String pass=request.getParameter("pass");
		String chgpass=request.getParameter("chgpass");
		
		//입력한 현재비밀번호가 mem의 비밀번호와 같을 경우 update하고
		//update가 성공했을 경우 closer=true로 바꾼다.
		if(pass.equals(mem.getPass() )) {
			if(dao.updatePass(login, chgpass)>0) {
				msg="비번이 변경되었습니다.";
				url="updateForm.me?id="+login;
				closer=true;
			}
		} else {
			msg="비밀번호가 틀립니다.";
		}
	      
		 request.setAttribute("msg", msg);
	     request.setAttribute("url", url);
	     if(closer)
	    	 return new ActionForward(false,"../alert2.jsp");
	     else
	     return new ActionForward(false, "../alert.jsp");
	}

}
