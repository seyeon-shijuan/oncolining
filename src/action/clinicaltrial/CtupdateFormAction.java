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
		//로그인한 정보 불러오기 ->이렇게 쓰면안될 것 같고 ClinicaltrialDao에 left join된 정보로 불러와야될 것 같다..
		//근데 불러와도 이거를 db에 update할건아닌데.. CtupdateForm에서만 보이기만 하면 되는데;;
		Member mem = new MemberDao().selectOne(login);
		request.setAttribute("mem", mem);
		
		//http://localhost:8080/oncolining/model2/clinicaltrial/ctupdateForm.me?num=3
		//이거 넘어옴 -> 변수명이 num이라서 getParameter안에 "num" String이니까 이렇게 써야한다.
		//임상 레코드 1건 조회를 위한 별도 DAO 메모리 할당
		ClinicaltrialDao dao = new ClinicaltrialDao();	
		int num = Integer.parseInt(request.getParameter("num"));
		Clinicaltrial ct = dao.selectOne(num);
		request.setAttribute("ct", ct);
		
		//int count = sqlSession.selectOne("쿼리문 아이디", 파라미터);
		//<select id="쿼리문 아이디" parameterType="자바 데이터 타입" resultType="자바 데이터 타입">
		 //SELECT NVL(count(*), 0) FROM TB_USER WHERE ID=#{id}
		//</select>
		
		return new ActionForward();
	}
	
	
	

}

