package action.member;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
      mem.setId(request.getParameter("id"));
      mem.setPass(request.getParameter("pass"));
      mem.setName(request.getParameter("name"));
      mem.setGender(Integer.parseInt(request.getParameter("gender")));
      mem.setTel(request.getParameter("tel"));
      mem.setEmail(request.getParameter("email"));
      mem.setPicture(request.getParameter("picture"));
      
      Member db = new MemberDao().selectOne(mem.getId());
      String msg = "��й�ȣ ����"; 
      String url = "updateForm.me?id="+mem.getId();
      if(mem.getPass().equals(db.getPass())){
         int result = new MemberDao().update(mem);
         if(result > 0) {   //���� ������ ���
            return new ActionForward(true, "info.me?id="+mem.getId());
         }else {
            msg = "���� ����";
            url = "updateForm.me?id="+mem.getId();
         }
      }
      request.setAttribute("msg", msg);
      request.setAttribute("url", url);
      return new ActionForward(false, "../alert.jsp");
   }

}