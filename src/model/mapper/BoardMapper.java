package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Board;
import model.Boardcomment;

public interface BoardMapper {
	@Select("select ifnull(max(board_no),0) from board")
	int maxnum();

	@Insert("insert into board (board_no, mem_id, board_subject, board_content, board_file, board_regdate, board_readcnt, board_grp, board_grplevel, board_grpstep) values(#{board_no},#{mem_id},#{board_subject},#{board_content},#{board_file},now(),0,#{board_grp},#{board_grplevel},#{board_grpstep})")
	void insert(Board board);
	
	@Select({"<script>",
	"select count(*) from board ",
	"<if test='col1 != null'> where ${col1} like '%${find}%'</if>",
	"<if test='col2 !=null'> or ${col2} like '%${find}%'</if>",
	"<if test='col3 !=null'> or ${col3} like '%${find}%'</if>",
	//or인 이유는 배열의 length가 2라서 어차피 위에 if test에도 걸리기때문이다.
	"</script>"})
	int boardCount(Map<String,Object> map);

	@Select({"<script>",
		"select * from board ",
		"<if test='col1 !=null'> where ${col1} like '%${find}%'</if>",
		"<if test='col2 !=null'> or ${col2} like '%${find}%'</if>",
		"<if test='col3 !=null'> or ${col3} like '%${find}%'</if>",
		"<choose>",
		"<when test = 'board_no!=null'>where board_no = #{board_no}</when>",
		"<otherwise> order by board_grp desc, board_grpstep asc limit #{start},#{limit}</otherwise>",
		"</choose>",
		"</script>"})
	List<Board> select(Map<String,Object> map);
	
	@Select("select * from board_comment where board_no=#{board_no}")
	List <Boardcomment> selectcm(int board_no);
	
	@Update("update board set board_readcnt = board_readcnt + 1 where board_no = #{board_no}")
	void readcntAdd(@Param("board_no") int board_no);

	@Update("update board set board_grpstep=board_grpstep+1 where board_grp=#{board_grp} and board_grpstep>#{board_grpstep}")
	void grpStepAdd(@Param("board_grp") int board_grp, @Param("board_grpstep") int board_grpstep);

	@Update("update  board set mem_id=#{mem_id},board_subject=#{board_subject},board_content=#{board_content},board_file=#{board_file} where board_no=#{board_no}")
	void update(Board board);

	@Delete("delete from board where board_no=#{board_no}")
	void delete(@Param("board_no") int board_no);

	@Select("select ifnull(max(cm_no),0) from board_comment")
	int maxnumofCmt();

	
	@Insert("insert into board_comment (cm_no, board_no, cm_title, cm_content, cm_file, cm_regdate, mem_id) values(#{cm_no},#{board_no},#{cm_title},#{cm_content},#{cm_file},now(),#{mem_id})")
	void insertComment(Boardcomment c);


	
}
