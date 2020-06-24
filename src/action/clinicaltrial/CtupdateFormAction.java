package action.clinicaltrial;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import action.Action;
import action.ActionForward;
import action.member.UserLoginAction;
import model.Member;
import model.MemberDao;
import model.Board;
import model.BoardDao;
import model.Clinicaltrial;
import model.ClinicaltrialDao;

public class CtupdateFormAction  extends UserLoginAction{



	@Override
	protected ActionForward doExecute(HttpServletRequest request, HttpServletResponse response) {
		//�α����� ���� �ҷ����� ->�̷��� ����ȵ� �� ���� ClinicaltrialDao�� left join�� ������ �ҷ��;ߵ� �� ����..
		//�ٵ� �ҷ��͵� �̰Ÿ� db�� update�ҰǾƴѵ�.. CtupdateForm������ ���̱⸸ �ϸ� �Ǵµ�;;
		Member mem = new MemberDao().selectOne(login);
		request.setAttribute("mem", mem);
		
		//http://localhost:8080/oncolining/model2/clinicaltrial/ctupdateForm.me?num=3
		//�̰� �Ѿ�� -> �������� num�̶� getParameter�ȿ� "num" String�̴ϱ� �̷��� ����Ѵ�.
		//�ӻ� ���ڵ� 1�� ��ȸ�� ���� ���� DAO �޸� �Ҵ�
		ClinicaltrialDao dao = new ClinicaltrialDao();	
		int num = Integer.parseInt(request.getParameter("num"));
		Clinicaltrial ct = dao.selectOne(num);
		request.setAttribute("ct", ct);
		
		//int count = sqlSession.selectOne("������ ���̵�", �Ķ����);
		//<select id="������ ���̵�" parameterType="�ڹ� ������ Ÿ��" resultType="�ڹ� ������ Ÿ��">
		 //SELECT NVL(count(*), 0) FROM TB_USER WHERE ID=#{id}
		//</select>
		
		return new ActionForward();
	}
	
	
	

}

