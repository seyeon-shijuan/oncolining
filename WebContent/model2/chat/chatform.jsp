<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%--/WebContent/model2/chat/chatform.jsp --%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>채팅 화면</title>
</head>
<body>
<div style="width:100%;">
	<textarea rows="10" cols="50" readonly="readonly" id="messageWindow" style="width:80%;"></textarea><br>
	<input id="inputMessage" type="text" style="width: 80%;" onkeydown="keyin()">
	<input type="button" value="전송" onclick="send()">
	<!-- keyin은 키를 눌렀을 때,
	event keyCode가 13=>엔터키 엔터누르면 send method call -->
</div>
<script type="text/javascript">
	var textarea = document.getElementById("messageWindow");
	/*자바스크립트에서 채팅 객체는 웹소켓이다.
	ww: protocol..*/
	var webSocket = new WebSocket("ws://192.168.35.216:8080${path}/chatting");
	var inputMessage = document.getElementById("inputMessage");
	//webSocket 연결이 안 된 경우(onerror) -> onError(event)를 call한다.
	webSocket.onerror = function(event){
		onError(event)
	}
	//webSocket 연결이 된 경우(onopen)->onOpen(event)를 call하고, alert를 띄운다.
	webSocket.onopen = function(event){
		onOpen(event);
		alert("즐거운 채팅되세요. 비속어 사용은 금지되어 있습니다.")
	}
	//메세지를 받으면(수신)
	webSocket.onmessage = function(event){
		onMessage(event)
	}
	function onMessage(event){
		textarea.value += event.data + "\n";
	}
	function onOpen(event){
		textarea.value += "연결 성공\n";
	}
	function onError(event){
		alert("연결 실패: "+event.data)
	}
	function send() {
		textarea.value += "${sessionScope.login} :" +inputMessage.value + "\n";
		//서버로 메세지를 전송해준다..
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