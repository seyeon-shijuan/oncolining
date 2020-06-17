package action.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

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
		
	 
		
		String msg="회원가입이 되지 않았습니다.";
		String url = "joinForm.me";
		String path = request.getServletContext().getRealPath("/") + "model2/member/file/";
		
		try {
			File f = new File(path);
			if (!f.exists())
				f.mkdirs(); // 존재하지 않으면 폴더 만들기
			MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");
			
			Member mem = new Member();
			mem.setMem_id(multi.getParameter("mem_id"));
			mem.setMem_pass(multi.getParameter("mem_pass"));
			mem.setMem_name(multi.getParameter("mem_name"));
			mem.setMem_nickname(multi.getParameter("mem_nickname"));
			mem.setMem_dateofbirth(multi.getParameter("mem_dateofbirth"));
			mem.setMem_gender(multi.getParameter("mem_gender"));
			mem.setMem_diagnosis(multi.getParameter("mem_diagnosis"));
			mem.setMem_dgdate(multi.getParameter("mem_dgdate"));
			mem.setMem_stage(multi.getParameter("mem_stage"));
			mem.setMem_docs(multi.getFilesystemName("mem_docs"));
			
			
			MemberDao dao = new MemberDao(); //model 클래스
			int result= dao.insert(mem);
			//3.회원 가입 성공: loginForm.me 페이지 이동
			if(result>0){ //db등록이 된 것이다.
				msg=mem.getMem_name() + "님 회원가입이 완료되었습니다.";
				url="loginForm.me";
			}//if
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		//회원 가입 실패: joinForm.me 페이지 이동
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}
