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
	
	
	//임상 데이터 한개 고르는 함수 (ct_datano로)
	public Clinicaltrial selectOne(int num) { //여기의 num은 db의 ct_datano
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectdata(num);
		} catch (Exception e) {
			e.printStackTrace();
		}finally {
			MyBatisConnection.close(session);
		}
		return null;
	}

	
	//임상 데이터 불러오는 함수
	public List<Clinicaltrial> list() {
		SqlSession session = MyBatisConnection.getConnection();
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
	
	//나의 임상 데이터 불러오는 함수
		public List<Clinicaltrial> mylist(String login) {
			SqlSession session = MyBatisConnection.getConnection();
			try {
				List<Clinicaltrial> mylist = session.getMapper(cls).selectmine(login);
				
				return mylist;	
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				MyBatisConnection.close(session);
			}
			return null;
		}
		
		//임상 수정 함수
		public int update(Clinicaltrial ct) { // Clinicaltrial가 data type, ct가 reference
			SqlSession session = MyBatisConnection.getConnection();
			try {
				return session.getMapper(cls).update(ct);
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				MyBatisConnection.close(session);
			}
			return 0;
		}
		

		//첫 번째 파이 그래프 차트 부르는 함수
		public List<Map<String, Integer>> graph1() {
			// TODO Auto-generated method stub
			SqlSession session = MyBatisConnection.getConnection();
			List<Map<String, Integer>> list = null;
			try {
				list = session.getMapper(cls).graph1();
			} catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			} finally {
				MyBatisConnection.close(session);
			}
			return list;
		}


		public boolean delete(int ct_datano) {
			SqlSession session = MyBatisConnection.getConnection();
			try { 
	 			session.getMapper(cls).delete(ct_datano);
	 			return true; 
	 		} catch (Exception e) { 
	 			e.printStackTrace(); 
	 		} finally { 
	 			MyBatisConnection.close(session);
	 		} 
			return false;
		}
	
	
}
