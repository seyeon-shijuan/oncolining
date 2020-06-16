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
</head>
<body>
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
	var webSocket = new WebSocket("ws://192.168.35.216:8080${path}/chatting");
	var inputMessage = document.getElementById("inputMessage");
	//webSocket ������ �� �� ���(onerror) -> onError(event)�� call�Ѵ�.
	webSocket.onerror = function(event){
		onError(event)
	}
	//webSocket ������ �� ���(onopen)->onOpen(event)�� call�ϰ�, alert�� ����.
	webSocket.onopen = function(event){
		onOpen(event);
		alert("��ſ� ä�õǼ���. ��Ӿ� ����� �����Ǿ� �ֽ��ϴ�.")
	}
	//�޼����� ������(����)
	webSocket.onmessage = function(event){
		onMessage(event)
	}
	function onMessage(event){
		textarea.value += event.data + "\n";
	}
	function onOpen(event){
		textarea.value += "���� ����\n";
	}
	function onError(event){
		alert("���� ����: "+event.data)
	}
	function send() {
		textarea.value += "${sessionScope.login} :" +inputMessage.value + "\n";
		//������ �޼����� �������ش�..
		webSocket.send('${sessionScope.login}:' +inputMessage.value);
		inputMessage.value="";
	}
	function keyin(){
		if(event.keyCode ==13){
			send()
		}
	}
</script>

</body>
</html>