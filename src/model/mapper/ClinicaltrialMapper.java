package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;
import model.Board;
import model.Clinicaltrial;

public interface ClinicaltrialMapper {
	//임상 데이터 입력하는 함수
	@Insert("insert into clinicaltrial"
			+ "(ct_datano,mem_id,ct_week,ct_age,ct_medicine,ct_frequency,ct_otherfqc,ct_dosage,ct_treatment,ct_suppliment,ct_pain,ct_fatigue,ct_side_effect,ct_tumor_size,ct_blood_test)"
			+ "values (((SELECT MAX(ct_datano) FROM clinicaltrial ALIAS_FOR_SUBQUERY)+1),#{mem_id},#{ct_week},#{ct_age},#{ct_medicine},#{ct_frequency},#{ct_otherfqc},#{ct_dosage},#{ct_treatment},#{ct_suppliment},#{ct_pain},#{ct_fatigue},#{ct_side_effect},#{ct_tumor_size},#{ct_blood_test})")
	int insert(Clinicaltrial ct);
	
	//임상 데이터 불러오는 함수
	@Select({//"<script>",
					//"select * from clinicaltrial ",
					//"<if test='ct_datano != null'> where binary ct_datano=#{ct_datano}</if>",
					"SELECT c.ct_datano, mem_nickname, c.ct_age, m.mem_gender, m.mem_diagnosis, m.mem_stage, c.ct_week, c.ct_medicine, c.ct_frequency, c.ct_otherfqc, c.ct_dosage, c.ct_treatment, c.ct_suppliment, c.ct_pain, c.ct_fatigue, c.ct_side_effect, c.ct_tumor_size, c.ct_blood_test from clinicaltrial c LEFT JOIN member m ON c.mem_id = m.mem_id WHERE c.mem_id <> 'admin' ORDER BY c.ct_datano DESC",
					//"</script>"
					})
	//binary : 대소문자 구별
	List<Clinicaltrial> select(Map<String, Object> map);
	
	//나의 임상 데이터 불러오는 함수
	@Select({//"<script>",
					//"select * from clinicaltrial ",
					//"<if test='ct_datano != null'> where binary ct_datano=#{ct_datano}</if>",
					"SELECT c.ct_datano, mem_nickname, c.ct_age, m.mem_gender, m.mem_diagnosis, m.mem_stage, c.ct_week, "
					+ "c.ct_medicine, c.ct_frequency, c.ct_otherfqc, c.ct_dosage, c.ct_treatment, c.ct_suppliment, c.ct_pain, c.ct_fatigue, "
					+ "c.ct_side_effect, c.ct_tumor_size, c.ct_blood_test from clinicaltrial c "
					+ "LEFT JOIN member m ON c.mem_id = m.mem_id WHERE c.mem_id=#{login} ORDER BY c.ct_datano DESC",
					//"</script>"
					})
	//binary : 대소문자 구별
	List<Clinicaltrial> selectmine(@Param("login") String login);
	
	//임상 데이터 1건 선택하는 함수
	@Select("SELECT * FROM clinicaltrial c LEFT JOIN member m ON c.mem_id = m.mem_id WHERE c.ct_datano = #{num}")
	Clinicaltrial selectdata(int num);
	
	//임상 데이터 수정하는 함수
	@Insert("update clinicaltrial set ct_week=#{ct_week}, ct_medicine=#{ct_medicine}, ct_frequency=#{ct_frequency}, ct_otherfqc=#{ct_otherfqc}, ct_dosage=#{ct_dosage}, ct_treatment=#{ct_treatment}, ct_suppliment=#{ct_suppliment}, ct_pain=#{ct_pain}, ct_fatigue=#{ct_fatigue}, ct_side_effect=#{ct_side_effect} , ct_tumor_size=#{ct_tumor_size}, ct_blood_test=#{ct_blood_test} where ct_datano=#{ct_datano}")
	int update(Clinicaltrial ct);
	
	//임상 데이터 삭제하는 함수
	@Delete("DELETE FROM clinicaltrial WHERE ct_datano=#{ct_datano}")
	int delete(@Param("ct_datano") int ct_datano);
	
	@Select("select mem_id from member where mem_name = #{mem_name} and mem_dateofbirth=#{mem_dateofbirth}")
	String idSearch(@Param("mem_name") String mem_name, @Param("mem_dateofbirth") String mem_dateofbirth);

	@Select("select pass from member where mem_id =#{mem_id}  and mem_name = #{mem_name} and mem_dateofbirth = #{mem_dateofbirth}")
	String pwSearch(@Param("mem_id") String id, @Param("mem_name") String mem_name, @Param("mem_dateofbirth") String mem_dateofbirth);

	//@Update("update member set mem_name=#{mem_name}, mem_nickname=#{mem_nickname}, mem_dateofbirth=#{mem_dateofbirth},mem_gender=#{mem_gender}, mem_diagnosis=#{mem_diagnosis}, mem_dgdate=#{mem_dgdate}, mem_stage=#{mem_stage} , mem_docs=#{mem_docs},mem_hospital=#{mem_hospital} where mem_id=#{mem_id}")
	//int update(Member m);

	@Update("update member set mem_pass=#{mem_pass} where mem_id=#{mem_id}")
	int updatePass(@Param("mem_id") String mem_id, @Param("mem_pass") String mem_pass);
	
	@Delete("DELETE FROM member WHERE mem_id=#{mem_id} AND mem_pass=#{mem_pass}")
	int delete2(Member mem);
	
	@Select("select ct_medicine, count(*) cnt from clinicaltrial WHERE mem_id NOT IN('admin','doc1') group by ct_medicine having COUNT(*)>0 order by cnt DESC")
	//list : [{ct_medicine:'albendazole',cnt:9},{ct_medicine:'fenbendazole',cnt:3}] map collection을 list collection이 가지고 있는 형태
	List<Map<String, Integer>> graph1();

	//@Delete("DELETE FROM member WHERE mem_id=#{mem_id}")
	//int delete(@Param("mem_id") String mem_id);
	
	
	
}
