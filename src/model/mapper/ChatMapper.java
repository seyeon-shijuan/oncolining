package model.mapper;
import java.util.Map;
import org.apache.ibatis.annotations.Insert;


public interface ChatMapper {
	@Insert("insert into chat (id, regdate, content) value(#{id}, now(), #{content})") 
	 int insert(Map map);
}

/*
dao.insert(message);

ChatDao.java에 insert()가 필요

1. Map<String, Object> map = new HashMap<>(); 파라미터로 쓰려고
2. String[] mes = message.split(" : "); 메세지를 콜론 기준으로 나눔
3. 채팅을 데이터베이스에 등록하는 방법
*/