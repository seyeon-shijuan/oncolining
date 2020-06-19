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


		String pass = request.getParameter("mem_pass"); 
		String msg = null;
		String url = null;

		if(mem_id.equals("admin")){ //Ż�� ����� �Ǵ� ȸ���� ������ �ȵ�
		 	msg="�����ڴ� Ż���� �� �����ϴ�.";
			url="list.me";
		}else{
			MemberDao dao = new MemberDao();
			Member dbmem = dao.selectOne(mem_id); //dB ���� ��ȸ
			if(login.equals("admin") || pass.equals(dbmem.getMem_pass())){
				if(dao.delete(mem_id) >0) { //���� ����
					if(login.equals("admin")){//�������� ���
						msg=mem_id+" ����ڸ� ���� Ż����׽��ϴ�.";
						url="list.me";
					} else {//�Ϲ� ������� ���
						msg=mem_id+ "�� ȸ��Ż�� �Ǿ����ϴ�.";
						url="loginForm.me";
						request.getSession().invalidate();//�α׾ƿ�
						//session.invalidate(); //�α׾ƿ�
					}
				} else{ // ��������
					msg=mem_id+" ���� Ż�� �� ������ �߻��߾��";
					if(login.equals("admin")){//�������� ���
						url="list.me";
					} else { //�Ϲݻ������ ���
						url = "info.me?mem_id="+mem_id;
					}
				}
			}else{//�Ϲݻ������ ��й�ȣ�� Ʋ�� ���
				msg=mem_id+" ���� ��й�ȣ�� Ʋ�Ƚ��ϴ�.";
				url= "deleteForm.me?mem_id="+mem_id;
			}
		}
		request.setAttribute("msg", msg);
		request.setAttribute("url", url);
		return new ActionForward(false,"../alert.jsp");
	}

}
