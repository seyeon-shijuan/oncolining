package action.member;

import java.io.File;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
     1. 모든 파라미터 정보를 Member 객체에 저장
   2. 입력된 비밀번호와 db에 저장된 비밀번호를 비교
      - 같지 않은 경우, "비밀번호 오류" 메세지 출력 후 updateForm.me 페이지로 이동
   3. 비밀번호가 일치하는 경우, 파라미터값을 저장한 Member 객체를 이용하여 db 정보를 수정
      int MemberDao.update(Member) 메서드 이용
      return 값 <0 => 수정 실패 메세지 출력 후 updateForm.me 로 페이지 이동
      return 값 >0 => 수정 성공 메세지 출력 후 info.me 로 페이지 이동 
 */
public class UpdateAction extends UserLoginAction {
   @Override
   protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
  
	   Member mem = new Member();
	   String msg = "기본 오류"; 
	   String url = "updateForm.me?mem_id="+mem.getMem_id();
	   String path = request.getServletContext().getRealPath("/") + "model2/member/file/";
	  
	  try {
		  File f = new File(path);
			if (!f.exists())
				f.mkdirs();
		  MultipartRequest multi = new MultipartRequest(request, path, 10 * 1024 * 1024, "euc-kr");   
		  mem.setMem_id(multi.getParameter("mem_id"));
	      mem.setMem_pass(multi.getParameter("mem_pass"));
	      mem.setMem_name(multi.getParameter("mem_name"));
	      mem.setMem_nickname(multi.getParameter("mem_nickname"));
	      mem.setMem_nickname(multi.getParameter("mem_nickname"));
	      mem.setMem_dateofbirth(multi.getParameter("mem_dateofbirth"));
	      mem.setMem_gender(multi.getParameter("mem_gender"));
	      mem.setMem_diagnosis(multi.getParameter("mem_diagnosis"));
	      mem.setMem_dgdate(multi.getParameter("mem_dgdate"));
	      mem.setMem_stage(multi.getParameter("mem_stage"));
	      mem.setMem_docs(multi.getParameter("mem_docs"));
	      mem.setMem_hospital(multi.getParameter("mem_hospital"));
	      
	      Member db = new MemberDao().selectOne(mem.getMem_id());
	      
	      
	         int result = new MemberDao().update(mem);
	         if(result > 0) {   //수정 성공인 경우
	            return new ActionForward(true, "info.me?mem_id="+mem.getMem_id());
	         }else {
	            msg = "수정되지 않았습니다.";
	            url = "updateForm.me?mem_id="+mem.getMem_id();
	         }//까지
	  } catch (IOException e) {
			e.printStackTrace();
		}
      
      
      request.setAttribute("msg", msg);
      request.setAttribute("url", url);
      return new ActionForward(false, "../alert.jsp");
   }

}