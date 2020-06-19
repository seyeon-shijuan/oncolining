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
	
	
	//한개 고르는 함수 : 아직 안만듦
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
	
	//임상 데이터 불러오는 함수
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
