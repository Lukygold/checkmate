<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>

<title>CHECKMATE</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<%-- <link href="resources/img/favicon.png" rel="icon"> --%>
<%-- <link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon"> --%>

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">
<head>
<meta charset="UTF-8">
<title>스터디그룹 상세보기</title>
<style>
.detail {
	text-align: center;
}

.detail>table {
	text-align: center;
}
</style>
<body>

	<jsp:include page="../common/header.jsp" />
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>

	<jsp:include page="../chat/chat.jsp" />

	<div style="margin-top: 200px; margin-bottom: 200px;"
		class="container mt-3 detail">
		<input type="hidden" id="sgNo" value="${studyGroup.sgNo}">

		<table id="detailMain" class="table table-dark">
			<thead>
				<tr>
					<th colspan="2">${studyGroup.sgName}</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>팀장</td>
					<td>${studyGroup.sgOwnerNick}</td>
				</tr>
				<tr>
					<td>모집인원</td>
					<td>${studyGroup.sgMax}명</td>
				</tr>
				<tr>
					<c:choose>
						<c:when test="${ empty loginUser }">
							<td>현재인원</td>
							<td>${memberCount}명</td>
						</c:when>
						<c:otherwise>
							<td>현재인원</td>
							<td><w>${memberCount}명</w></td>
						</c:otherwise>
					</c:choose>
				</tr>
				<tr>
					<td>현재지원자</td>
					<td>${applyCount}명</td>
				</tr>
				<tr>
					<td>카테고리</td>
					<td>${studyGroup.sgCategory}</td>
				</tr>
				<tr>
					<td>지역</td>
					<td>${studyGroup.sgLocation}</td>
				</tr>
				<tr>
					<th colspan="2">스터디그룹 목표</th>
				</tr>
				<tr>
					<td colspan="2">${studyGroup.sgGoal}</td>
				</tr>
				<tr>
					<th colspan="2">스터디그룹 설명</th>
				</tr>
				<tr>
					<td colspan="2">${studyGroup.sgContent}</td>
				</tr>
			</tbody>
		</table>

		<c:choose>
			<c:when test="${ empty loginUser }">
				<button type="button" class="btn btn-secondary"
					onclick="studyGroupList();">목록</button>
			</c:when>
			<c:when test="${ studyGroup.sgOwnerNick == loginUser.userNick }">
				<button type="button" class="btn btn-secondary"
					data-bs-toggle="modal" data-bs-target="#sgApplyList">신청자
					목록보기</button>
				<button type="button" class="btn btn-secondary"
					data-bs-toggle="modal" data-bs-target="#sgUpdate">수정</button>
				<button type="button" class="btn btn-secondary"
					onclick="studyGroupList();">목록</button>
			</c:when>
			<c:when test="${memberCount == studyGroup.sgMax}">
				<button type="button" class="btn btn-secondary" onclick="finish();">신청마감</button>
				<button type="button" class="btn btn-secondary"
					onclick="studyGroupList();">목록</button>
			</c:when>
			<c:otherwise>
				<button type="button" class="btn btn-secondary"
					data-bs-toggle="modal" data-bs-target="#sgApply">신청하기</button>
				<button type="button" class="btn btn-secondary"
					onclick="studyGroupList();">목록</button>
			</c:otherwise>
		</c:choose>

		<!-- 스터디그룹 신청 -->
		<div class="modal" id="sgApply">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">${studyGroup.sgName}에지원하기</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form id="postForm" action="" method="post">
							<input type="hidden" name="sgApplyNick"
								value="${loginUser.userNick}"> <input type="hidden"
								name="sgApplySgNo" value="${studyGroup.sgNo}"> <label
								for="sgApplyContent"></label>
							<textarea class="form-control" rows="5" name="sgApplyContent"
								placeholder="지원동기를 입력해주세요"></textarea>
						</form>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal" onclick="apply();">신청하기</button>
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">닫기</button>
					</div>

				</div>
			</div>
		</div>

		<!-- 스터디그룹 지원자 리스트 -->
		<div class="modal" id="sgApplyList">
			<div class="modal-dialog modal-xl">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">지원자 확인하기</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<table id="applyList" class="table table-dark table-hover">
							<thead>
								<tr>
									<th width="120">지원자</th>
									<th width="500">지원동기</th>
									<th colspan="2">수락/거절</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${studyGroupApplyList}" var="StudyGroupApply">
									<tr>
										<td id="" name=""><input type="hidden" id="sgaApplyNo"
											value="${StudyGroupApply.sgApplyNo}">${StudyGroupApply.sgApplyNick}</td>
										<c:choose>
											<c:when
												test="${fn:length(StudyGroupApply.sgApplyContent) gt 15}">
												<td><c:out
														value="${fn:substring(StudyGroupApply.sgApplyContent, 0, 30)}"></c:out>...</td>
											</c:when>
											<c:otherwise>
												<td>${StudyGroupApply.sgApplyContent}</td>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${memberCount == studyGroup.sgMax}">
												<td width="70"><button type="button"
														class="btn btn-secondary" name="reject">거절</button></td>
											</c:when>
											<c:otherwise>
												<td width="70"><button type="button"
														class="btn btn-secondary" name="accept">수락</button></td>
												<td width="70"><button type="button"
														class="btn btn-secondary" name="reject">거절</button></td>
											</c:otherwise>
										</c:choose>
									</tr>
								</c:forEach>

							</tbody>
						</table>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">닫기</button>
					</div>

				</div>
			</div>
		</div>


		<!-- 스터디그룹 수정  -->
		<div class="modal" id="sgUpdate">
			<form action="update.sg" method="post">
			<input type="hidden" name="sgOwnerNick" value="${loginUser.userNick}">
				<div class="modal-dialog modal-xl">
					<div class="modal-content">

						<!-- Modal Header -->
						<div class="modal-header">
							<h4 class="modal-title">스터디그룹 수정</h4>
							<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
						</div>

						<!-- Modal body -->
						<div class="modal-body">
							<table id="updateList" class="table table-dark table-hover">
								<div class="input-group mb-3">
									<div class="form-floating">
										<input type="text" class="form-control" id="sgName"
											name="sgName" value="${studyGroup.sgName }" placeholder="스터디그룹 이름" readonly> <label
											for="floatingInputGroup1">스터디그룹 이름</label>
									</div>
								</div>
								<br>
								<div class="form-floating mb-3">
									<input type="text" class="form-control" name="sgGoal"
										value="${studyGroup.sgGoal }"placeholder="스터디그룹 목표"> <label for="floatingInput">스터디그룹
										목표</label>
									<div class="form-text">ex) 정보처리기사 실기 / 토익 800점</div>
								</div>
								<br>
								<div class="form-floating">
									<textarea class="form-control" placeholder="스터디그룹 설명"
										name="sgContent" style="height: 200px">${studyGroup.sgContent }</textarea>
									<label for="floatingTextarea2">스터디그룹 설명</label>
									<div class="form-text">ex) 주3회 출석 필수입니다 / 오프라인 만남은 OO에서</div>
								</div>
								<br>
								<div class="form-floating">
									<select class="form-select" name="sgMax" 
										aria-label="Floating label select example">
										<option selected>${studyGroup.sgMax }</option>
										<option value="1">1</option>
										<option value="2">2</option>
										<option value="3">3</option>
										<option value="4">4</option>
										<option value="5">5</option>
										<option value="6">6</option>
										<option value="7">7</option>
										<option value="8">8</option>
										<option value="9">9</option>
										<option value="10">10</option>
									</select> <label for="floatingSelect">스터디그룹 인원수</label>
								</div>
								<br>
								<div class="form-floating">
									<select class="form-select" name="sgCategory" 
										aria-label="Floating label select example">
										<option selected>${studyGroup.sgCategory }</option>
										<option value="자격증">자격증</option>
										<option value="시험">시험</option>
										<option value="취업">취업</option>
									</select> <label for="floatingSelect">스터디그룹 카테고리</label>
								</div>
								<br>
								<div class="form-floating">
									<select class="form-select" name="sgLocation" 
										aria-label="Floating label select example">
										<option selected>${studyGroup.sgLocation }</option>
										<option value="서울 서북권(마포/서대문/은평)">서울 서북권(마포/서대문/은평)</option>
										<option value="서울 서남권(강서/관악/구로/금천/동작/양천/영등포)">서울
											서남권(강서/관악/구로/금천/동작/양천/영등포)</option>
										<option value="서울 도심권(용산/종로/중구)">서울 도심권(용산/종로/중구)</option>
										<option value="서울 동북권(강북/광진/노원/도봉/동대문/성동/성북)">서울
											동북권(강북/광진/노원/도봉/동대문/성동/성북)</option>
										<option value="서울 동남권(강남/강동/서초/송파)">서울
											동남권(강남/강동/서초/송파)</option>
									</select> <label for="floatingSelect">스터디그룹 지역</label>
								</div>
							</table>
						</div>

						<!-- Modal footer -->
						<div class="modal-footer">
							<button type="submit" class="btn btn-secondary"
								data-bs-dismiss="modal">수정</button>
							<button type="button" class="btn btn-danger"
								data-bs-dismiss="modal">닫기</button>
						</div>

					</div>
				</div>
			</form>
		</div>



		<!-- 스터디그룹 멤버 리스트 -->
		<div class="modal" id="sgMemberList">
			<div class="modal-dialog">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">스터디그룹 멤버</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<table id="memberList" class="table table-dark table-hover">
							<thead>
								<tr>
									<th>닉네임</th>
									<th>메세지보내기</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${studyGroupMember}" var="StudyGroupMemeber">
									<tr>
										<td id="test"><input type="hidden" id="recvNick"
											value="${StudyGroupMemeber.sgmNick}">${StudyGroupMemeber.sgmNick}</td>
										<td width=""><button type="button"
												class="btn btn-secondary" data-bs-toggle="modal"
												data-bs-target="#sendMessage" name="messageToMember">메세지전송</button></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>

					<!-- Modal footer -->
					<div class="modal-footer">
						<button type="button" class="btn btn-danger"
							data-bs-dismiss="modal">닫기</button>
					</div>

				</div>
			</div>
		</div>


		<!-- 메세지 전송 기능 -->
		<div class="modal" id="sendMessage">
			<div class="modal-dialog  modal-xl">
				<div class="modal-content">

					<!-- Modal Header -->
					<div class="modal-header">
						<h4 class="modal-title">메세지 전송</h4>
						<button type="button" class="btn-close" data-bs-dismiss="modal"></button>
					</div>

					<!-- Modal body -->
					<div class="modal-body">
						<form id="enrollForm" method="post"
							action="sgDetailMessageInsert.msg" enctype="multipart/form-data">

							<input type="hidden" value="${studyGroup.sgNo}" name="sgNo">
							<input type="hidden" id="send" name="msgSend"
								value="${loginUser.userNick }">
							<table class="table table-dark" style="text-align: center;">
								<thead>
									<tr>
										<th colspan="2">메세지 전송</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<th style="width: 250px"><label for="recv">받는사람</label></th>
										<td style="width: 500px"><input type="text"
											style="width: 700px" id="recvPush" name="msgRecv" value=""
											readonly style="align:center;"></td>
									</tr>
									<tr>
										<th><label for="content">내용</label></th>
										<td align="center"><textarea id="content"
												style="width: 700px" class="form-control" rows="10"
												cols="55" name="msgContent" required></textarea></td>
									</tr>
									<tr>
										<th><label for="upfile">첨부파일</label></th>
										<td><input type="file" style="width: 700px" id="upfile"
											class="form-control-file border" name="upfile"></td>
									</tr>
								</tbody>
							</table>
							<br>
							<div align="center">
								<button type="submit" class="btn btn-secondary">보내기</button>
								<button type="button" class="btn btn-danger"
									data-bs-dismiss="modal">취소</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>


	</div>

	<script>
		function studyGroupList() {
			location.href = "studyGroupList.sg";
		}
		
		function finish() {
			alert("신청이 마감되었습니다. 다른 스터디에 지원해주세요.")
		}
		
		function already() {
			alert("이미 신청한 스터디입니다.")
		}


		function apply() {
			$("#postForm").attr("action", "studyGroupApply.sga").submit();
		}
		
		$(function(){
			$('#detailMain>tbody>tr>td>w').click(
					function(){						
					        $('#sgMemberList').modal('show');
					        });
					})
					
					
					
		$(function() {
			$("#memberList>tbody>tr>td>button[name=messageToMember]").click(
					function() {
						var recv = $(this).parent().parent().children().children("#recvNick").val();
						
						$("#recvPush").attr("value", recv);
					})
		})
		
		

		
		$(function() {
			$("#applyList>tbody>tr>td>button[name=accept]").click(
					function() {
						var sgNo = ${studyGroup.sgNo}
						var sgaApplyNo = $(this).parent().parent().children().children("#sgaApplyNo").val();
						
							if (confirm("선택하실 멤버를 수락하시겠습니까?")) {
								$.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/acceptStudyGroup.sga",
									data : {
										sgaApplyNo, sgNo
									},
									dataType : "json",
									success : function(data) {
										if (data > 0) {
											alert("수락완료");
											window.location = "";
										}
									},
									error : function() {
										alert("서버통신 오류");
									}
								});
							}
					})
		})
		
				$(function() {
			$("#applyList>tbody>tr>td>button[name=reject]").click(
					function() {
						var sgNo = ${studyGroup.sgNo}
						var sgaApplyNo = $(this).parent().parent().children().children("#sgaApplyNo").val();
						
							if (confirm("선택하실 멤버를 거절하시겠습니까?")) {
								$.ajax({
									type : "POST",
									url : "${pageContext.request.contextPath}/rejectStudyGroup.sga",
									data : {
										sgaApplyNo, sgNo
									},
									dataType : "json",
									success : function(data) {
										if (data > 0) {
											alert("거절완료");
											window.location = "${pageContext.request.contextPath}/studyGroupDetail.sg?sgNo=${studyGroup.sgNo}";
										}
									},
									error : function() {
										alert("서버통신 오류");
									}
								});
							}
					})
		})
	</script>

	<div class="">
		<jsp:include page="../common/footer.jsp" />
	</div>
</body>
</html>