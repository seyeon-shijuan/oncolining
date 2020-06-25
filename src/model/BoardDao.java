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

import model.mapper.BoardMapper;

public class BoardDao {
	private Class<BoardMapper> cls = BoardMapper.class;
	private Map<String,Object> map = new HashMap<>();

	//게시물의 수를 읽는 method
	public int boardCount(String column, String find) {
		SqlSession session  = MyBatisConnection.getConnection();
		try {
			map.clear();
			//subject, mem_id이 들어온다.
			if(column != null) {
				String[] cols =  column.split(",");
				//cols[0]에는 subject가 들어간다.
				map.put("col1", cols[0]);
				if(cols.length>1) 
					//배열이 2개면 cols[1]에 name이 들어간다.
					map.put("col2", cols[1]);
				if(cols.length>2) 
					map.put("col3", cols[2]);
			}
			map.put("find", find);
			return session.getMapper(cls).boardCount(map);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	// 게시물중 최대 번호 찾는 method
	public int maxnum() {
		SqlSession session = MyBatisConnection.getConnection();
		try {
				return session.getMapper(cls).maxnum();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return 0;
	}
	
	//게시물을 등록하는 method
	public boolean insert(Board board) {
		  SqlSession session = MyBatisConnection.getConnection();
		  try {
			  session.getMapper(cls).insert(board);
			  return true;
		  } catch (Exception e) {
		   e.printStackTrace();
		  }finally {
			  MyBatisConnection.close(session);
		  }
		  return false;
		 }
	
	//★ list랑 selectone은 동적쿼리로 쓴다. =<script>써서 있을때만 작동되는것
	
	// 목록을 조회해주는 것
	public List<Board> list(int pageNum, int limit, String column, String find){
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("start", (pageNum-1)*limit);
			map.put("limit", limit);
			if(column != null) {
				//제목+작성자 였으면 subject, name으로 분리하고
				String[] cols =  column.split(",");
				//map에서 (col1, subject) (col2, name) 이렇게 2개의 pair가 생긴다.
				map.put("col1", cols[0]);
				if(cols.length>1) {
					map.put("col2", cols[1]);
				}
			}
			map.put("find", find);
			
			
			return session.getMapper(cls).select(map);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	// 한개 고르기 (num=31)
	public Board selectOne(int board_no) { //여기의 board_no은 db의 board_no
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("board_no", board_no);
			return session.getMapper(cls).select(map).get(0);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
		// if(rs.next())가 있으면 밑에거를 실행하고 없으면 null을 return하라는 의미
	}
	
	
	//조회수 올리는 함수
	public void readcntAdd(int board_no) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).readcntAdd(board_no);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}
	
	//grpStep 숫자 올리는 함수
	public void grpStepAdd(int board_grp, int board_grpstep) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			session.getMapper(cls).grpStepAdd(board_grp, board_grpstep);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally  {
			MyBatisConnection.close(session);
		}
	}
	
	public boolean update(Board board) { 
		SqlSession session = MyBatisConnection.getConnection();
 		try { 
 			session.getMapper(cls).update(board);
 			return true;  //boolean이라서
 		} catch (Exception e) { 
 			e.printStackTrace(); 
 		} finally { 
 			MyBatisConnection.close(session);
 		} return false; 
 	} 
	 
 	public boolean delete(int board_no) { 
 		SqlSession session = MyBatisConnection.getConnection();
 		try { 
 			session.getMapper(cls).delete(board_no);
 			return true; 
 		} catch (Exception e) { 
 			e.printStackTrace(); 
 		} finally { 
 			MyBatisConnection.close(session);
 		} 
 		return false; 
 	}
 	
 	// 코멘트 조회하는 메서드
	public List<Boardcomment> selectComment(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			return session.getMapper(cls).selectcm(num);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
		return null;
	}
	
	// 게시물의 코멘트중 최대 번호 찾는 method
		public int maxnumofCmt() {
			SqlSession session = MyBatisConnection.getConnection();
			try {
					return session.getMapper(cls).maxnumofCmt();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				MyBatisConnection.close(session);
			}
			return 0;
		}
		
		//코멘트를 등록하는 method
		public boolean insertComment(Boardcomment c) {
			  SqlSession session = MyBatisConnection.getConnection();
			  try {
				  session.getMapper(cls).insertComment(c);
				  return true;
			  } catch (Exception e) {
			   e.printStackTrace();
			  }finally {
				  MyBatisConnection.close(session);
			  }
			  return false;
			 }
		
		//코멘트 지우는 함수
		public boolean deleteComment(int num) {
			SqlSession session = MyBatisConnection.getConnection();
	 		try { 
	 			session.getMapper(cls).deletecomment(num);
	 			return true; 
	 		} catch (Exception e) { 
	 			e.printStackTrace(); 
	 		} finally { 
	 			MyBatisConnection.close(session);
	 		} 
			return false;
		}

}