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
     1. ��� �Ķ���� ������ Member ��ü�� ����
   2. �Էµ� ��й�ȣ�� db�� ����� ��й�ȣ�� ��
      - ���� ���� ���, "��й�ȣ ����" �޼��� ��� �� updateForm.me �������� �̵�
   3. ��й�ȣ�� ��ġ�ϴ� ���, �Ķ���Ͱ��� ������ Member ��ü�� �̿��Ͽ� db ������ ����
      int MemberDao.update(Member) �޼��� �̿�
      return �� <0 => ���� ���� �޼��� ��� �� updateForm.me �� ������ �̵�
      return �� >0 => ���� ���� �޼��� ��� �� info.me �� ������ �̵� 
 */
public class UpdateAction extends UserLoginAction {
   @Override
   protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
  
	   Member mem = new Member();
	   String msg = "�⺻ ����"; 
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
	         if(result > 0) {   //���� ������ ���
	            return new ActionForward(true, "info.me?mem_id="+mem.getMem_id());
	         }else {
	            msg = "�������� �ʾҽ��ϴ�.";
	            url = "updateForm.me?mem_id="+mem.getMem_id();
	         }//����
	  } catch (IOException e) {
			e.printStackTrace();
		}
      
      
      request.setAttribute("msg", msg);
      request.setAttribute("url", url);
      return new ActionForward(false, "../alert.jsp");
   }

}