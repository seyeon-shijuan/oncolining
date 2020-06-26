package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;

public interface MemberMapper {
	@Insert("insert into member "
			+ "(mem_no,mem_id,mem_pass,mem_name,mem_nickname,mem_dateofbirth,mem_gender,mem_diagnosis,mem_dgdate,mem_stage,mem_docs,mem_hospital)"
			+ "values (((SELECT MAX(mem_no) FROM member ALIAS_FOR_SUBQUERY)+1),#{mem_id},#{mem_pass},#{mem_name},#{mem_nickname},#{mem_dateofbirth},#{mem_gender},#{mem_diagnosis},#{mem_dgdate},#{mem_stage},#{mem_docs},#{mem_hospital})")
	int insert(Member mem);
	
	@Select({"<script>",
					"select * from member ",
					"<if test='mem_id != null'> where binary mem_id=#{mem_id}</if>",
					"</script>"})
	//binary : 대소문자 구별
	List<Member> select(Map<String, Object> map);
	
	@Select("select mem_id from member where mem_name = #{mem_name} and mem_dateofbirth=#{mem_dateofbirth}")
	String idSearch(@Param("mem_name") String mem_name, @Param("mem_dateofbirth") String mem_dateofbirth);
	
	@Select("select pass from member where mem_id =#{mem_id}  and mem_name = #{mem_name} and mem_dateofbirth = #{mem_dateofbirth}")
	String pwSearch(@Param("mem_id") String id, @Param("mem_name") String mem_name, @Param("mem_dateofbirth") String mem_dateofbirth);

	@Update("update member set mem_name=#{mem_name}, mem_nickname=#{mem_nickname}, mem_dateofbirth=#{mem_dateofbirth},mem_gender=#{mem_gender}, mem_diagnosis=#{mem_diagnosis}, mem_dgdate=#{mem_dgdate}, mem_stage=#{mem_stage} , mem_docs=#{mem_docs},mem_hospital=#{mem_hospital} where mem_id=#{mem_id}")
	int update(Member m);

	@Update("update member set mem_pass=#{mem_pass} where mem_id=#{mem_id}")
	int updatePass(@Param("mem_id") String mem_id, @Param("mem_pass") String mem_pass);
	
	@Delete("DELETE FROM member WHERE mem_id=#{mem_id} AND mem_pass=#{mem_pass}")
	int delete2(Member mem);

	@Delete("DELETE FROM member WHERE mem_id=#{mem_id}")
	int delete(@Param("mem_id") String mem_id);
	
	
	
}
