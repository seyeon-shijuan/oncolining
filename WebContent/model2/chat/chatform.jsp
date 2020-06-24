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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<link rel="stylesheet" href="../../css/smallbutton.css">
<style type="text/css">
	.inner_frame {text-align: center; margin-top: 2%;}
</style>
</head>
<body>
	<div class="outer_frame">
		<button  class="small_button_off" onclick="location.href='../board/list.do'">&nbsp;&nbsp;임상 포럼&nbsp;&nbsp;</button>
		<button  class="small_button_on"  onclick="location.href='../chat/chatform.do'">&nbsp;&nbsp;실시간 채팅&nbsp;&nbsp;</button>
		<div class="inner_frame">
			<p>임상 채팅</p>
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
				// 컴퓨터 이동하면 ip주소바꿔야 한다.
				var webSocket = new WebSocket("ws://192.168.4.4:8080${path}/chatting");
				var inputMessage = document.getElementById("inputMessage");
				//webSocket 연결이 안 된 경우(onerror) -> onError(event)를 call한다.
				webSocket.onerror = function(event){
					onError(event)
				}
				//webSocket 연결이 된 경우(onopen)->onOpen(event)를 call하고, alert를 띄운다.
				webSocket.onopen = function(event){
					onOpen(event);
					//alert("즐거운 채팅되세요. 비속어 사용은 금지되어 있습니다.")
				}
				//메세지를 받으면(수신)
				webSocket.onmessage = function(event){
					onMessage(event)
				}
				function onMessage(event){
					textarea.value += event.data + "\n";
				}
				function onOpen(event){
					textarea.value += "OncoLining 임상 채팅방에 오신 것을 환영합니다.\n ** 동시 접속중인 임상 회원 간 자유로운 소통이 가능합니다. **\n ";
				}
				function onError(event){
					alert("연결 실패: "+event.data)
				}
				function send() {
					textarea.value += "${sessionScope.nickname} :" +inputMessage.value + "\n";
					//서버로 메세지를 전송해준다..
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