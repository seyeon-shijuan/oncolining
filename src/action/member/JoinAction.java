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
 * 1.�Ķ���������� Member ��ü�� ����
 * 2.Member ��ü�� ������ db�� ����
 * 3.ȸ�� ���� ����: loginForm.me ������ �̵�
 *  ȸ�� ���� ����: joinForm.me ������ �̵�
 */

public class JoinAction implements Action{
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		request.setCharacterEncoding("euc-kr");
		//1.�Ķ���������� Member ��ü�� ����
		//2.Member ��ü�� ������ db�� ����
		
	 
		
		String msg="ȸ�������� ���� �ʾҽ��ϴ�.";
		String url = "joinForm.me";
		String path = request.getServletContext().getRealPath("/") + "model2/member/file/";
		
		try {
			File f = new File(path);
			if (!f.exists())
				f.mkdirs(); // �������� ������ ���� �����
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
			
			
			MemberDao dao = new MemberDao(); //model Ŭ����
			int result= dao.insert(mem);
			//3.ȸ�� ���� ����: loginForm.me ������ �̵�
			if(result>0){ //db����� �� ���̴�.
				msg=mem.getMem_name() + "�� ȸ�������� �Ϸ�Ǿ����ϴ�.";
				url="loginForm.me";
			}//if
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		
		//ȸ�� ���� ����: joinForm.me ������ �̵�
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}
}
