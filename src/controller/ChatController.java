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

@ServerEndpoint("/chatting") //�������� ����Ŭ���� ����
public class ChatController {
	private static Set<Session> clients = Collections.synchronizedSet(new HashSet<Session>());
	private ChatDao dao = new ChatDao();
	
	@OnMessage //client���� �޼��� ����
	public void onMessage(String message, Session session) throws IOException {
		//session: �޼����� ������ session ��ü�� ������ session�� �ȴ�.
		//message: Ŭ���̾�Ʈ�� ������ �޼���, loginid:�Է¸޼���
		
		// thread ����ȭ
		synchronized(clients) {
			dao.insert(message);
			for(Session client : clients) { //broadcast : ��� Ŭ���̾�Ʈ���� �޼����� ����
				if(!client.equals(session)) { //Ŭ���̾�Ʈ�� ���ǰ� ���� �ʴٸ�(���� �ƴϸ�)
					client.getBasicRemote().sendText(message); // ���ڸ� �����Ѵ�.
					//�� ���ǰ� �ٸ� ��� Ŭ���̾�Ʈ���� �޼����� �����ϴ� ����
				}
			}
		}
	}
	@OnOpen //client�� ����Ǿ��� ��
	public void onOpen(Session session) {
		clients.add(session);
	}
	@OnClose
	public void onClose(Session session) {
		clients.remove(session);
	}

}
