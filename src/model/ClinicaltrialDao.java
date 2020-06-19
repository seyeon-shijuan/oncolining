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
	
	
	//�Ѱ� ���� �Լ� : ���� �ȸ���
	/*
	public Member selectOne(String mem_id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("mem_id", mem_id);
			List<Member> list = session.getMapper(cls).select(map);
			return list.get(0);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	*/
	
	//�ӻ� ������ �ҷ����� �Լ�
	public List<Clinicaltrial> list() {
		SqlSession session = MyBatisConnection.getConnection();
		/*String sql = "select * from clinicaltrial where ct_datano=?"; no need*/
		try {
			List<Clinicaltrial> list = session.getMapper(cls).select(null);
			return list;	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	
	
}
