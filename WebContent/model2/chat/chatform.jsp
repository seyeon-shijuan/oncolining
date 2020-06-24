<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%--/WebContent/model2/chat/chatform.jsp --%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>ä�� ȭ��</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../css/smallbutton.css">
<style type="text/css">
	.inner_frame {text-align: center; margin-top: 2%;}
</style>
</head>
<body>
	<div class="outer_frame">
		<button  class="small_button_off" onclick="location.href='../board/list.do'">&nbsp;&nbsp;�ӻ� ����&nbsp;&nbsp;</button>
		<button  class="small_button_on"  onclick="location.href='../chat/chatform.do'">&nbsp;&nbsp;�ǽð� ä��&nbsp;&nbsp;</button>
		<div class="inner_frame">
			<p>�ӻ� ä��</p>
				<div style="width:100%;">
				<textarea rows="10" cols="50" readonly="readonly" id="messageWindow" style="width:80%;"></textarea><br>
				<input id="inputMessage" type="text" style="width: 80%;" onkeydown="keyin()">
				<input type="button" value="����" onclick="send()">
				<!-- keyin�� Ű�� ������ ��,
				event keyCode�� 13=>����Ű ���ʹ����� send method call -->
			</div>
			<script type="text/javascript">
				var textarea = document.getElementById("messageWindow");
				/*�ڹٽ�ũ��Ʈ���� ä�� ��ü�� �������̴�.
				ww: protocol..*/
				// ��ǻ�� �̵��ϸ� ip�ּҹٲ�� �Ѵ�.
				var webSocket = new WebSocket("ws://192.168.4.4:8080${path}/chatting");
				var inputMessage = document.getElementById("inputMessage");
				//webSocket ������ �� �� ���(onerror) -> onError(event)�� call�Ѵ�.
				webSocket.onerror = function(event){
					onError(event)
				}
				//webSocket ������ �� ���(onopen)->onOpen(event)�� call�ϰ�, alert�� ����.
				webSocket.onopen = function(event){
					onOpen(event);
					//alert("��ſ� ä�õǼ���. ��Ӿ� ����� �����Ǿ� �ֽ��ϴ�.")
				}
				//�޼����� ������(����)
				webSocket.onmessage = function(event){
					onMessage(event)
				}
				function onMessage(event){
					textarea.value += event.data + "\n";
				}
				function onOpen(event){
					textarea.value += "OncoLining �ӻ� ä�ù濡 ���� ���� ȯ���մϴ�.\n ** ���� �������� �ӻ� ȸ�� �� �����ο� ������ �����մϴ�. **\n ";
				}
				function onError(event){
					alert("���� ����: "+event.data)
				}
				function send() {
					textarea.value += "${sessionScope.nickname} :" +inputMessage.value + "\n";
					//������ �޼����� �������ش�..
					webSocket.send('${sessionScope.nickname}:' +inputMessage.value);
					inputMessage.value="";
				}
				function keyin(){
					if(event.keyCode ==13){
						send()
					}
				}
			</script>
						
		</div>
	</div>
</body>
</html>