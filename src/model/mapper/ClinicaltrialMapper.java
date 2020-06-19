package model.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import model.Member;
import model.Clinicaltrial;

public interface ClinicaltrialMapper {
	@Insert("insert into clinicaltrial"
			+ "(ct_datano,mem_id,ct_week,ct_age,ct_medicine,ct_frequency,ct_otherfqc,ct_dosage,ct_treatment,ct_suppliment,ct_pain,ct_fatigue,ct_side_effect,ct_tumor_size,ct_blood_test)"
			+ "values (((SELECT MAX(ct_datano) FROM clinicaltrial ALIAS_FOR_SUBQUERY)+1),#{mem_id},#{ct_week},#{ct_age},#{ct_medicine},#{ct_frequency},#{ct_otherfqc},#{ct_dosage},#{ct_treatment},#{ct_suppliment},#{ct_pain},#{ct_fatigue},#{ct_side_effect},#{ct_tumor_size},#{ct_blood_test})")
	int insert(Clinicaltrial ct);
	
	@Select({//"<script>",
					//"select * from clinicaltrial ",
					//"<if test='ct_datano != null'> where binary ct_datano=#{ct_datano}</if>",
					"SELECT c.ct_datano, mem_nickname, c.ct_age, m.mem_gender, m.mem_diagnosis, m.mem_stage, c.ct_week, c.ct_medicine, c.ct_frequency, c.ct_otherfqc, c.ct_dosage, c.ct_treatment, c.ct_suppliment, c.ct_pain, c.ct_fatigue, c.ct_side_effect, c.ct_tumor_size, c.ct_blood_test from clinicaltrial c LEFT JOIN member m ON c.mem_id = m.mem_id WHERE c.mem_id <> 'admin'",
					//"</script>"
					})
	//binary : ��ҹ��� ����
	List<Clinicaltrial> select(Map<String, Object> map);
	
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
