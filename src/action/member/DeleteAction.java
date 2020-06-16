package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.ActionForward;
import model.Member;
import model.MemberDao;

/*
 * 
3.�Ϲݻ�����ΰ��
		-id,pass ������ �̿��Ͽ� ��й�ȣ ����
		��й�ȣ ����ġ : "��й�ȣ�� Ʋ�Ƚ��ϴ�." alert. deleteForm.me �������� �̵�
   �������ΰ��
		-id�� �������� ��� Ż��Ұ�. list.jsp�� �������� �̵�
4. Ż�� ����: member db���� delete ó�� �Ϸ�
		�Ϲ� �����: �α׾ƿ� ����. loginForm.me ������ �̵� 
		������ : ���� ���� �޼��� ��� list.me ������ �̵�
5. Ż�� ����: member db���� delete ó�� �� ���� �߻��� ���
		�Ϲ� �����: Ż����� �޼��� ����ϰ� info.me�� �̵�
		������: ���� ���� �޼����� ����ϰ� list.me �������� �̵�
 */
public class DeleteAction extends UserLoginAction {

	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {


		String pass = request.getParameter("pass"); 
		String msg = null;
		String url = null;

		if(id.equals("admin")){ //Ż�� ����� �Ǵ� ȸ���� ������ �ȵ�
		 	msg="�����ڴ� Ż���� �� �����ϴ�.";
			url="list.me";
		}else{
			MemberDao dao = new MemberDao();
			Member dbmem = dao.selectOne(id); //dB ���� ��ȸ
			if(login.equals("admin") || pass.equals(dbmem.getPass())){
				if(dao.delete(id) >0) { //���� ����
					if(login.equals("admin")){//�������� ���
						msg=id+" ����ڸ� ���� Ż����׽��ϴ�.";
						url="list.me";
					} else {//�Ϲ� ������� ���
						msg=id+ "�� ȸ��Ż�� �Ǿ����ϴ�.";
						url="loginForm.me";
						request.getSession().invalidate();//�α׾ƿ�
						//session.invalidate(); //�α׾ƿ�
					}
				} else{ // ��������
					msg=id+" ���� Ż�� �� ������ �߻��߾��";
					if(login.equals("admin")){//�������� ���
						url="list.me";
					} else { //�Ϲݻ������ ���
						url = "info.me?id="+id;
					}
				}
			}else{//�Ϲݻ������ ��й�ȣ�� Ʋ�� ���
				msg=id+" ���� ��й�ȣ�� Ʋ�Ƚ��ϴ�.";
				url= "deleteForm.me?id="+id;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
