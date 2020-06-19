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
	
	//회원가입시키는 함수
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
	//회원 목록 보기
	public List<Member> list() {
		SqlSession session = MyBatisConnection.getConnection();
		String sql = "select * from member where mem_id=?";
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
	public String idSearch(String mem_name, String mem_dateofbirth) { 
 		SqlSession session = MyBatisConnection.getConnection();
 		try { 
 			return session.getMapper(cls).idSearch(mem_name, mem_dateofbirth);
 		} catch (Exception e) { 
 			e.printStackTrace(); 
 		} finally { 
 			MyBatisConnection.close(session);
 		} 
 		return null; 
 	} 
 
	//비번 찾는 method
 	public String pwSearch(String mem_id, String mem_name, String mem_dateofbirth) { 
 		SqlSession session = MyBatisConnection.getConnection();
 		try { 
 			return session.getMapper(cls).pwSearch(mem_id, mem_name, mem_dateofbirth) ;
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
		String sql = "update member set mem_name=?,"
				+ " mem_nickname=?, mem_dateofbirth=?, mem_gender=?, mem_diagnosis=?, mem_dgdate=?, mem_stage=?, mem_docs=?, mem_hospital=? where mem_id=?";
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
	public int updatePass(String mem_id, String mem_pass) {
		SqlSession session = MyBatisConnection.getConnection();
		String sql="update member set mem_pass=? where mem_id=?"; //FYI
		try{
			return session.getMapper(cls).updatePass(mem_id, mem_pass);
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
		  String sql = "DELETE FROM member WHERE mem_id=? AND mem_pass=?";//FYI
		  try {
		   return session.getMapper(cls).delete2(mem);
		  } catch (Exception e) {
		   e.printStackTrace();
		  }finally {
			  MyBatisConnection.close(session);
		  }
		  return 0;
		 }
	
	//탈퇴
	public int delete(String mem_id) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).delete(mem_id);
		} catch (Exception e ) {
			e.printStackTrace();
		} finally {
			 MyBatisConnection.close(session);
		}
		return 0;
	}
}
