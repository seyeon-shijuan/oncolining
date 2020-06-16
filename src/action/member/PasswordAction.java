package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;
/*
    1.�α׾ƿ������� ��� '�α����ϼ���' �޼��� ���
	   �ٸ�������� ��й�ȣ�� ���� �Ұ�
	   opener �������� loginForm.me ������ �̵�.
	   ���������� �ݱ�
	2.pass, chgpass �Ķ���� ������
	3.pass ��й�ȣ�� db�� ����� ��й�ȣ�� �ٸ���
	  ��й�ȣ ���� �޼��� ���. passwordForm.me ������ �̵�
	4.pass ��й�ȣ�� db�� ����� ��й�ȣ�� ������
	   ��й�ȣ ����.
	   opener �������� updateForm.me �������� �̵�.
	   ���������� �ݱ�
 */
public class PasswordAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		String msg ="�������";
		String url="passwordform.me";
		boolean closer=false; //true->alert2�� ��
		
		MemberDao dao=new MemberDao();
		//mem=����α����� ������ ����
		Member mem=dao.selectOne(login);
		//pass= passwordform���� �Է��� �����й�ȣ, chgpass=�ٲ� ��й�ȣ
		String pass=request.getParameter("pass");
		String chgpass=request.getParameter("chgpass");
		
		//�Է��� �����й�ȣ�� mem�� ��й�ȣ�� ���� ��� update�ϰ�
		//update�� �������� ��� closer=true�� �ٲ۴�.
		if(pass.equals(mem.getPass() )) {
			if(dao.updatePass(login, chgpass)>0) {
				msg="����� ����Ǿ����ϴ�.";
				url="updateForm.me?id="+login;
				closer=true;
			}
		} else {
			msg="��й�ȣ�� Ʋ���ϴ�.";
		}
	      
		 request.setAttribute("msg", msg);
	     request.setAttribute("url", url);
	     if(closer)
	    	 return new ActionForward(false,"../alert2.jsp");
	     else
	     return new ActionForward(false, "../alert.jsp");
	}

}
