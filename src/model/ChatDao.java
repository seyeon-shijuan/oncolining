package model;

import java.util.HashMap;
import java.util.Map;
import org.apache.ibatis.session.SqlSession;
import model.mapper.ChatMapper;

public class ChatDao {
 private Class<ChatMapper> cls = ChatMapper.class;
 Map<String, Object> map = new HashMap<>();
 public int insert(String message) {
  SqlSession session = MyBatisConnection.getConnection();
  try {
   map.clear();
    String[] mes = message.split(" : ");
    map.put("id", mes[0].trim());
    map.put("content", mes[1].trim());
   return session.getMapper(cls).insert(map);
  }catch(Exception e) {
   e.printStackTrace();
  }finally {
   MyBatisConnection.close(session);
  }
  return 0;
 }
}
