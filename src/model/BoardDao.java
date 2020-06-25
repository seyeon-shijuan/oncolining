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

	//�Խù��� ���� �д� method
	public int boardCount(String column, String find) {
		SqlSession session  = MyBatisConnection.getConnection();
		try {
			map.clear();
			//subject, mem_id�� ���´�.
			if(column != null) {
				String[] cols =  column.split(",");
				//cols[0]���� subject�� ����.
				map.put("col1", cols[0]);
				if(cols.length>1) 
					//�迭�� 2���� cols[1]�� name�� ����.
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
	
	// �Խù��� �ִ� ��ȣ ã�� method
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
	
	//�Խù��� ����ϴ� method
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
	
	//�� list�� selectone�� ���������� ����. =<script>�Ἥ �������� �۵��Ǵ°�
	
	// ����� ��ȸ���ִ� ��
	public List<Board> list(int pageNum, int limit, String column, String find){
		SqlSession session = MyBatisConnection.getConnection();
		try {
			map.clear();
			map.put("start", (pageNum-1)*limit);
			map.put("limit", limit);
			if(column != null) {
				//����+�ۼ��� ������ subject, name���� �и��ϰ�
				String[] cols =  column.split(",");
				//map���� (col1, subject) (col2, name) �̷��� 2���� pair�� �����.
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
	
	// �Ѱ� ���� (num=31)
	public Board selectOne(int board_no) { //������ board_no�� db�� board_no
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
		// if(rs.next())�� ������ �ؿ��Ÿ� �����ϰ� ������ null�� return�϶�� �ǹ�
	}
	
	
	//��ȸ�� �ø��� �Լ�
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
	
	//grpStep ���� �ø��� �Լ�
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
 			return true;  //boolean�̶�
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
 	
 	// �ڸ�Ʈ ��ȸ�ϴ� �޼���
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
	
	// �Խù��� �ڸ�Ʈ�� �ִ� ��ȣ ã�� method
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
		
		//�ڸ�Ʈ�� ����ϴ� method
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
		
		//�ڸ�Ʈ ����� �Լ�
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