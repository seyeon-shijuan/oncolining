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
	//int result= dao.insert(mem); join.jsp�� MemberDao.java�� ������ ����
	private Class<ClinicaltrialMapper> cls = ClinicaltrialMapper.class;
	private Map<String, Object> map = new HashMap<>();
	
	//�ӻ� �Է� �Լ�
	public int insert(Clinicaltrial ct) { // Clinicaltrial�� data type, ct�� reference
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
