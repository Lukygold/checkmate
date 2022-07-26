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
	
	<%-- 스터디그룹 번호 [ ${roomNo}번 ] 아이디[${loginMember.memberId}]</h1> --%>
	<div id="chatBody" data-room-no="${roomNo}" data-member="${loginUser.userNick}">
		<div id="list-guestbook">
			<c:forEach items="${firstList}" var="chat">
				<!-- 내 채팅일 경우 -->
				<c:if test="${loginUser.userNick eq chat.userNick}">
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
				<c:if test="${loginUser.userNick ne chat.userNick}">
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
			<input type="text" id="msgi" name="msg" class="form-control" placeholder="메시지를 입력하세요" aria-label="메시지를 입력하세요" aria-describedby="button-addon2">
			<!-- <textarea name="msg" id="msgi" rows="2" class="form-control col-sm-8"></textarea> -->
			<button class="send btn btn-outline-secondary" type="button" id="button-addon2">전송</button>
		</div>
	</div>
</div>

<br><br>
<jsp:include page="../common/footer.jsp" />

<script>
var client;

function insertChat(){
	$.ajax({
		url : "${pageContext.request.contextPath}/chat/insertChat.do",
		type : "POST",
		data :
			{
				userNick : "${loginUser.userNick}",
				sgNo : "${roomNo}",
				chatContent : $("#msgi").val()
						
			} ,
		dataType : "json",
		success : function(result) {
			sendmsg();
		},
		error : function(xhr, status, err) {
			console.log("처리실패!");
			console.log(xhr);
			console.log(status);
			console.log(err);
		}
	});
}

function moveDown(){
	$("#chatBody").scrollTop($("#chatBody")[0].scrollHeight);
}

$(document).ready(function() {
	//시작할때 스크롤 내리기
	$("#chatBody").scrollTop($("#chatBody")[0].scrollHeight);

	var isEnd = false;
	var isScrolled = false;
	var fetchList = function() {
		if (isEnd == true) {
			return;
		}

		// 채팅 리스트를 가져올 때 시작 번호
		// renderList 함수에서 html 코드의 <li> 태그에 data-no 속성으로
		// data- 속성의 값을 가져오기 위해 data() 함수 사용
		var endNo = $("#list-guestbook li").first().data("no") || 0;
		console.log("endNo" + endNo);
		$.ajax({
			url : "${pageContext.request.contextPath}/chat/chatList.do?endNo="
					+ endNo + "&roomNo=${roomNo}",
			type : "GET",
			dataType : "json",
			success : function(result) {

				// 컨트롤러에서 가져온 방명록 리스트는 result.data에 담김
				var length = result.size;
				if (length < 10) {
					isEnd = true;
				}
				$.each(result, function(index, vo) {
					var html = renderList(vo,0);
					$("#list-guestbook").prepend(html);

				})
				var position = $('[data-no='+endNo+']').prev().offset();//위치값
				console.log(position);
				document.querySelector('#chatBody').scrollTo({top : position.top,behavior : 'auto'});
				isScrolled = false;
			},
			error : function(xhr, status, err) {
				console.log("처리실패!");
				console.log(xhr);
				console.log(status);
				console.log(err);
			}
		});
	}

	var renderList = function(vo,endNo) {
		// 리스트 html을 정의
		var date = moment(vo.sendDate).format('YY/MM/DD HH:mm');
		var html = "";
		if(endNo==0) endNo = vo.no;
		
		//내가 보낸 채팅일 경우
		if(vo.userNick=="${loginUser.userNick}"){
			var content ="";
			
			content = "<p class='myChat text-left p-2'>"+vo.chatContent+"</p>";
			
		
			html = 	"<li class='me pr-2' data-no='"+ endNo +"'>"
					+ "<strong>" + vo.userNick + "</strong>"
					+"<div class='me'>"
					+ "<strong style='display : inline;' class='align-self-end'>" + date + "</strong>"
					+ content
					+"</div>"
					+ "</li>";
		}
		//남이 보낸 채팅일 경우
		else{
			
			var content ="";
	
			content = "<p class='otherChat bg-light p-2'>"+vo.chatContent+"</p>";
		
			html = "<li class='pl-2' data-no='"+ vo.no +"'>"
				+ "<strong>" + vo.userNick + "</strong>"
				+"<div class='row ml-0'>"
				+ content
				+ "<strong class='align-self-center'>" + date + "</strong>"
				+"</div>"
				+ "</li>";
		
		}
		return html;
			
		

	}
	//무한 스크롤
	$("#chatBody").scroll(function() {
		var $window = $(this);
		var scrollTop = $window.scrollTop();
		var windowHeight = $window.height();
		var documentHeight = $(document).height();

		// scrollbar의 thumb가 위의1px까지 도달 하면 리스트를 가져옴
		if (scrollTop < 1 && isScrolled == false) {
			isScrolled = true;
			fetchList();

		}
	})

	////////////////////socket
	//새로운 메시지 알림
	/* function newAlerts(content,endNo) {
		$('#alertK').css('display','block');
		$('#alertK').html("<strong>"+content.memberId+"</strong>님이 메시지를 보냈습니다.");
	} */
	
	$(function() {
		var chatBox = $('.box');
		var messageInput = $('text[name="msg"]');
		var roomNo = "${roomNo}";
		var member = $('.content').data('member');
		var sock = new SockJS(
				"${pageContext.request.contextPath}/endpoint");
		client = Stomp.over(sock);

		
		
		function sendmsg() {
			var message = messageInput.val();
			//alert("메시지"+message);
			if (message == "") {
				return false;
			}
			//insertChat();
			client.send('/app/hello/' + roomNo, {}, JSON
					.stringify({
						chatContent : message,
						userNick : "${loginUser.userNick}",
						sgNo : "${roomNo}"

					}));

			messageInput.val('');
		}

		client.connect({},function() {
			// 여기는 입장시
			//	           일반메세지 들어오는곳         
			client.subscribe('/subscribe/chat/'+ roomNo,function(chat) {
				//받은 데이터
				var content = JSON.parse(chat.body);
				var endNo = content.no;
				/*var endNo = $("#list-guestbook li").last().data("no");
				if(isNaN(endNo))
					endNo = 1;
				else
					endNo = endNo+1;
				*/
				var html = renderList(content,endNo);
				$("#list-guestbook").append(html);
				newAlerts(content,endNo);
								
							});


		});
		
		//	         대화시
		 $('.send').click(function() {
			//alert("눌리나?");
			sendmsg();
		}); 

		//채팅창 떠날시에
		function disconnect() {
			if (client != null) {
				client.disconnect();
			}
		}
		window.onbeforeunload = function(e) {
			disconnect();
		}

		function closeConnection() {
			sock.close();
		}

		function viewList() {

			alert('viewList');
			var url = "/chat/chatList?page=" + page
					+ "&perPageNum=" + perPageNum;
			location.replace(url);
		}

	});

});



</script>

</body>
</html>