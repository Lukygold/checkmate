<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<fmt:requestEncoding value="utf-8" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>채팅</title>

<!-- moment() -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>

<!-- sockjs -->
<script src="${pageContext.request.contextPath }/resources/dist/sockjs.min.js"></script>

<!-- stomp CDN -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js" integrity="sha512-iKDtgDyTHjAitUDdLljGhenhPwrbBfqTKWO1mkhSFH3A7blITC9MhYon6SjnMhp4o0rADGw9yAC6EW4t5a4K3g==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>

<style>
	#chatContainer {
		border: 1px solid black;
		width : 400px;
		height : 600px;
		/*일단 100px left*/
		margin-left: 100px;	
	}
	#chatHeader {
		border: 1px solid red;
		height: 10%;
	}
	#chatBody {
		border: 1px solid blue;
		height: 80%;
	}
	#chatFooter {
		border: 1px solid green;
		height: 10%;
	}
</style>

</head>
<body>

<jsp:include page="../common/header.jsp" />
<br><br><br><br><br>

<h1>채팅페이지다</h1>
<br><br>

<div id="chatContainer">
	<div id="chatHeader">
		스터디그룹 이름 불러오기
	</div>
	<div id="chatBody" data-room-no="${roomNo}" data-member="${loginMember}">
		<div id="list-guestbook">
			<c:forEach items="${firstList}" var="chat">
				<!-- 내 채팅일 경우 -->
				<c:if test="${loginMember.memberId eq chat.memberId}">
					<li data-no="${chat.no}" class="me pr-2">
						<strong>${chat.memberId}</strong>
						<div class="me ">
							<strong style="display : inline;" class="align-self-end">
								<fmt:formatDate value="${chat.sendDate}" pattern="yy/MM/dd HH:mm" />
							</strong>
							<p class="myChat text-left p-2">${chat.chatContent }</p>
						</div>
					</li>
				</c:if>
				
				<!-- 다른 사람의 채팅일 경우 -->
				<c:if test="${loginMember.memberId ne chat.memberId}">
					<li data-no="${chat.no}" class="pl-2">
						<strong>${chat.memberId}</strong>
						<div class="row ml-0">
							<p class="otherChat bg-light p-2">${chat.chatContent }</p>
							<strong class="align-self-center">
								<fmt:formatDate value="${chat.sendDate}" pattern="yy/MM/dd HH:mm" />
							</strong>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<div id="chatFooter">
		<div class="input-group mb-3" style="height: 100%;">
			<input type="text" class="form-control" placeholder="메시지를 입력하세요" aria-label="메시지를 입력하세요" aria-describedby="button-addon2">
			<button class="btn btn-outline-secondary" type="submit" id="button-addon2">전송</button>
		</div>
	</div>
</div>

<br><br>
<jsp:include page="../common/footer.jsp" />

</body>
</html>