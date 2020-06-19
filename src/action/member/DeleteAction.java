package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

/*
 * 
3.일반사용자인경우
		-id,pass 정보를 이용하여 비밀번호 검증
		비밀번호 불일치 : "비밀번호가 틀렸습니다." alert. deleteForm.me 페이지로 이동
   관리자인경우
		-id가 관리자인 경우 탈퇴불가. list.jsp로 페이지를 이동
4. 탈퇴 성공: member db에서 delete 처리 완료
		일반 사용자: 로그아웃 실행. loginForm.me 페이지 이동 
		관리자 : 삭제 성공 메세지 출력 list.me 페이지 이동
5. 탈퇴 실패: member db에서 delete 처리 시 오류 발생한 경우
		일반 사용자: 탈퇴실패 메세지 출력하고 info.me로 이동
		관리자: 삭제 실패 메세지를 출력하고 list.me 페이지로 이동
 */
public class DeleteAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {


		String pass = request.getParameter("mem_pass"); 
		String msg = null;
		String url = null;

		if(mem_id.equals("admin")){ //탈퇴 대상이 되는 회원은 관리자 안됨
		 	msg="관리자는 탈퇴할 수 없습니다.";
			url="list.me";
		}else{
			MemberDao dao = new MemberDao();
			Member dbmem = dao.selectOne(mem_id); //dB 정보 조회
			if(login.equals("admin") || pass.equals(dbmem.getMem_pass())){
				if(dao.delete(mem_id) >0) { //삭제 성공
					if(login.equals("admin")){//관리자인 경우
						msg=mem_id+" 사용자를 강제 탈퇴시켰습니다.";
						url="list.me";
					} else {//일반 사용자의 경우
						msg=mem_id+ "님 회원탈퇴 되었습니다.";
						url="loginForm.me";
						request.getSession().invalidate();//로그아웃
						//session.invalidate(); //로그아웃
					}
				} else{ // 삭제실패
					msg=mem_id+" 님의 탈퇴 중 오류가 발생했어요";
					if(login.equals("admin")){//관리자인 경우
						url="list.me";
					} else { //일반사용자인 경우
						url = "info.me?mem_id="+mem_id;
					}
				}
			}else{//일반사용자의 비밀번호가 틀린 경우
				msg=mem_id+" 님의 비밀번호가 틀렸습니다.";
				url= "deleteForm.me?mem_id="+mem_id;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
