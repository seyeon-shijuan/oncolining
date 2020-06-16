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
			//subject, name이 들어온다.
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
		  String sql = "insert into board (num, name, pass, subject, content, file1, regdate, readcnt, grp, grplevel, grpstep) values(?,?,?,?,?,?,now(),?,?,?,?)";
		  //FYI
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
	public Board selectOne(int num) { //여기의 num은 db의 num
		SqlSession session = MyBatisConnection.getConnection();
		//String sql="select * from board where num=?";
		try {
			map.clear();
			map.put("num", num);
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
	public void readcntAdd(int num) {
		SqlSession session = MyBatisConnection.getConnection();
		try {
			//pstmt = conn.prepareStatement("update board set readcnt = readcnt + 1 where num = ?");
			session.getMapper(cls).readcntAdd(num);
		} catch(Exception e) {
			e.printStackTrace();
		} finally {
			MyBatisConnection.close(session);
		}
	}
	
	//grpStep 숫자 올리는 함수
	public void grpStepAdd(int grp, int grpstep) {
		SqlSession session = MyBatisConnection.getConnection();
		//String sql ="update board set grpstep=grpstep+1 where grp=? and grpstep>?";
		// 지금 만드는 reply의 grpstep 보다 높은 것들은 전부다 +1씩 시킨다.
		try {
			session.getMapper(cls).grpStepAdd(grp, grpstep);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally  {
			MyBatisConnection.close(session);
		}
	}
	
	public boolean update(Board board) { 
		SqlSession session = MyBatisConnection.getConnection();
 		//String sql ="update  board set name=?,subject=?,content=?,file1=? where num=?"; 
 		try { 
 			session.getMapper(cls).update(board);
 			return true;  //boolean이라서
 		} catch (Exception e) { 
 			e.printStackTrace(); 
 		} finally { 
 			MyBatisConnection.close(session);
 		} return false; 
 	} 
	 
 	public boolean delete(int num) { 
 		SqlSession session = MyBatisConnection.getConnection();
 		//String sql ="delete from board where num=?"; 
 		try { 
 			session.getMapper(cls).delete(num);
 			return true; 
 		} catch (Exception e) { 
 			e.printStackTrace(); 
 		} finally { 
 			MyBatisConnection.close(session);
 		} 
 		return false; 
 	} 

	
}