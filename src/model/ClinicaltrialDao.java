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
	
	
	//�ӻ� ������ �Ѱ� ���� �Լ� (ct_datano��)
	public Clinicaltrial selectOne(int num) { //������ num�� db�� ct_datano
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

	
	//�ӻ� ������ �ҷ����� �Լ�
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
	
	//���� �ӻ� ������ �ҷ����� �Լ�
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
		
		//�ӻ� ���� �Լ�
		public int update(Clinicaltrial ct) { // Clinicaltrial�� data type, ct�� reference
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
		

		//ù ��° ���� �׷��� ��Ʈ �θ��� �Լ�
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
