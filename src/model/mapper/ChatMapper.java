package model.mapper;
import java.util.Map;
import org.apache.ibatis.annotations.Insert;


public interface ChatMapper {
	@Insert("insert into chat (id, regdate, content) value(#{id}, now(), #{content})") 
	 int insert(Map map);
}

/*
dao.insert(message);

ChatDao.java�� insert()�� �ʿ�

1. Map<String, Object> map = new HashMap<>(); �Ķ���ͷ� ������
2. String[] mes = message.split(" : "); �޼����� �ݷ� �������� ����
3. ä���� �����ͺ��̽��� ����ϴ� ���
*/