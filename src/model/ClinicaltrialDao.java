package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.mapper.ClinicaltrialMapper;


public class ClinicaltrialDao {
	//int result= dao.insert(mem); join.jsp와 MemberDao.java를 연동할 지문
	private Class<ClinicaltrialMapper> cls = ClinicaltrialMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	//임상 입력 함수
	public int insert(Clinicaltrial ct) { // Clinicaltrial가 data type, ct가 reference
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(ct);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
}
