package controller;

import java.io.IOException;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

import javax.websocket.OnClose;
import javax.websocket.OnMessage;
import javax.websocket.OnOpen;
import javax.websocket.Session;
import javax.websocket.server.ServerEndpoint;

import model.ChatDao;

@ServerEndpoint("/chatting") //웹소켓의 서버클래스 지정
public class ChatController {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	private ChatDao dao = new ChatDao();
	
	@OnMessage //client에서 메세지 수신
	public void onMessage(String message, Session session) throws IOException {
		//session: 메세지를 전송한 session 객체가 여기의 session이 된다.
		//message: 클라이언트가 전송한 메세지, loginid:입력메세지
		
		// thread 동기화
		synchronized(clients) {
			dao.insert(message);
			for(Session client : clients) { //broadcast : 모든 클라이언트에게 메세지를 전송
				if(!client.equals(session)) { //클라이언트가 세션과 같지 않다면(내가 아니면)
					client.getBasicRemote().sendText(message); // 문자를 전송한다.
					//내 세션과 다른 모든 클라이언트에게 메세지를 전송하는 구문
				}
			}
		}
	}
	@OnOpen //client가 연결되었을 때
	public void onOpen(Session session) {
		clients.add(session);
	}
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}

}
