<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>

<style>
	#chatContainer {
		border: 1px solid black;
		width : 400px;
		height : 600px;
		/*일단 100px left*/
		margin-left: 100px;	
	}
	#chatHeader {
		border: 1px solid black;
		height: 10%;
	}
	#chatBody {
		border: 1px solid black;
		height: 80%;
	}
	#chatFooter {
		border: 1px solid black;
		height: 10%;
	}
</style>

</head>

<!-- sockJS -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>

<body>

	<jsp:include page="../common/header.jsp" />
	<br><br><br><br><br>
	
	<h1>채팅 테스트</h1>
	아이디 찍어보기 : ${loginUser.userNick} <br>
	스터디그룹 번호 : ${studyGroup.sgNo } <br>
	채팅방 이름 찍어보기 : ${studyGroup.sgName } <br>
	<br><br><br>
	
	<script type="text/javascript">
		var webSocket = {
			init: function(param) {
				this._url = param.url;
				this._initSocket();
			},
			sendChat: function() {
				this._sendMessage($('#message').val());
				$('#message').val('');
			},
			receiveMessage: function(str) {
				$('#chatBody').append('<div>' + str + '</div>');				
			},
			closeMessage: function(str) {
				$('#chatBody').append('<div>' + '연결 끊김 : ' + str + '</div>');
			},
			disconnect: function() {
				this._socket.close();
			},
			_initSocket: function() {
				this._socket = new SockJS(this._url);
				this._socket.onmessage = function(evt) {
					webSocket.receiveMessage(evt.data);
				};
				this._socket.onclose = function(evt) {
					webSocket.closeMessage(evt.data);
				}
			},
			_sendMessage: function(str) {
				this._socket.send(str);
			}
		};
	</script>	
	<script type="text/javascript">
		$(document).ready(function() {
			webSocket.init({ url: '<c:url value="/chat" />' });			
		});
	</script>
</head>

<body>

	<!-- <div style="width: 800px; height: 700px; padding: 10px; border: solid 1px #e1e3e9;">
		<div id="divChatData"></div>
	</div>
	<div style="width: 100%; height: 10%; padding: 10px;">
		<input type="text" id="message" size="110" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
		<input type="button" id="btnSend" value="채팅 전송" onclick="webSocket.sendChat()" />
	</div> -->
	
	<div id="chatContainer">
	<div id="chatHeader">
		${studyGroup.sgName }
	</div>
	
	<%-- 스터디그룹 번호 [ ${roomNo}번 ] 아이디[${loginMember.memberId}]</h1> --%>
	<div id="chatBody" data-room-no="${roomNo}" data-member="${loginMember.userNick}">
		<div id="list-guestbook">
			<c:forEach items="${firstList}" var="chat">
				<!-- 내 채팅일 경우 -->
				<c:if test="${loginMember.userNick eq chat.userNick}">
					<li data-no="${chat.chatNo}" class="me pr-2">
						<strong>${chat.userNick}</strong>
						<div class="me ">
							<strong style="display : inline;" class="align-self-end">
								<fmt:formatDate value="${chat.chatSendDate}" pattern="yy/MM/dd HH:mm" />
							</strong>
							<p class="myChat text-left p-2">${chat.chatContent}</p>
						</div>
					</li>
				</c:if>
				
				<!-- 다른 사람의 채팅일 경우 -->
				<c:if test="${loginMember.userNick ne chat.userNick}">
					<li data-no="${chat.chatNo}" class="pl-2">
						<strong>${chat.userNick}</strong>
						<div class="row ml-0">
							<p class="otherChat bg-light p-2">${chat.chatContent}</p>
							<strong class="align-self-center">
								<fmt:formatDate value="${chat.chatSendDate}" pattern="yy/MM/dd HH:mm" />
							</strong>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<div id="chatFooter">
		<!-- form div 확인  -->
		<div class="input-group mb-3" style="height: 100%;">
			<input type="text" id="message" class="form-control" placeholder="메시지를 입력하세요" aria-label="메시지를 입력하세요" aria-describedby="button-addon2" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
			<!-- <textarea name="msg" id="msgi" rows="2" class="form-control col-sm-8"></textarea> -->
			<button class="send btn btn-outline-secondary" type="button" id="btnSend"  onclick="webSocket.sendChat()">전송</button>
		</div>
	</div>
</div>

<!-- <div style="width: 800px; height: 700px; padding: 10px; border: solid 1px #e1e3e9;">
		<div id="divChatData"></div>
	</div>
	<div style="width: 100%; height: 10%; padding: 10px;">
		<input type="text" id="message" size="110" onkeypress="if(event.keyCode==13){webSocket.sendChat();}" />
		<input type="button" id="btnSend" value="채팅 전송" onclick="webSocket.sendChat()" />
	</div> -->
	
	



</body>
</html>