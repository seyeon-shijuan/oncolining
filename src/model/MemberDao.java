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

import model.mapper.MemberMapper;

public class MemberDao {
	//int result= dao.insert(mem); join.jsp와 MemberDado.java를 연동할 지문
	private Class<MemberMapper> cls = MemberMapper.class;
	private Map<String, Object> map = new HashMap<>();
	public int insert(Member mem) { // member가 data type, mem가 reference
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).insert(mem);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	public Member selectOne(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		String sql = "select * from member where id=?";
		try {
			map.clear();
			map.put("id", id);
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
	//회원 목록 보기
	public List<Member> list() {
		SqlSession session = MyBatisConnection.getConnection();
		String sql = "select * from member where id=?";
		try {
			List<Member> list = session.getMapper(cls).select(null);
			return list;	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	//아디 찾는 method
	public String idSearch(String email, String tel) { 
 		SqlSession session = MyBatisConnection.getConnection();
 		try { 
 			return session.getMapper(cls).idSearch(email, tel);
 		} catch (Exception e) { 
 			e.printStackTrace(); 
 		} finally { 
 			MyBatisConnection.close(session);
 		} 
 		return null; 
 	} 
 
	//비번 찾는 method
 	public String pwSearch(String id, String email, String tel) { 
 		SqlSession session = MyBatisConnection.getConnection();
 		try { 
 			return session.getMapper(cls).pwSearch(id, email, tel) ;
 		} catch (Exception e) { 
 			e.printStackTrace(); 
 		} finally { 
 			MyBatisConnection.close(session);
 		} 
 		return null; 
 	} 

 	// 정보 바꾸는 method
	public int update(Member m) {
		SqlSession session = MyBatisConnection.getConnection();
		String sql = "update member set name=?,"
				+ " gender=?, email=?, tel=?, picture=? where id=?";
		// just FYI, sql is not used in this script
		try {
			return session.getMapper(cls).update(m);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	// updatepass 비번오류시 나올것
	public int updatePass(String id, String pass) {
		SqlSession session = MyBatisConnection.getConnection();
		String sql="update member set pass=? where id=?"; //FYI
		try{
			return session.getMapper(cls).updatePass(id, pass);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	//delete 정보삭제
	public int delete2(Member mem) {
		SqlSession session = MyBatisConnection.getConnection();
		  String sql = "DELETE FROM member WHERE id=? AND pass=?";//FYI
		  try {
		   return session.getMapper(cls).delete2(mem);
		  } catch (Exception e) {
		   e.printStackTrace();
		  }finally {
			  MyBatisConnection.close(session);
		  }
		  return 0;
		 }
	
	public int delete(String id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(id);
		} catch (Exception e ) {
			e.printStackTrace();
		} finally {
			 MyBatisConnection.close(session);
		}
		return 0;
	}
}
