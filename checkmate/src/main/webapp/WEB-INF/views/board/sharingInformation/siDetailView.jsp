<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<link href="resources/css/sharingInformation.css" rel="stylesheet"
	type="text/css" />
<link rel="stylesheet" href="resource/alertify.core.css" />
<link rel="stylesheet" href="resource/alertify.default.css"
	id="toggleCSS" />
<script src="resource/alertify.min.js"></script>
</head>
<body style="padding-top: 7rem;">
	<jsp:include page="../../common/header.jsp" />
	<main role="main" class="container back-image">
		<form name="form" method="POST" action="/bulletin_wr01">
			<div class="input-group">
				<input type="text" aria-label="First name" class="form-control text-center" value="작성자 : ${b.userId}" >
				<input type="text" aria-label="First name" class="form-control text-center" value="조회수 : ${b.informationView}">
				<input type="text" aria-label="Last name" class="form-control text-center" value="등록일 : ${b.informationDate}">
			</div>
			<div class="pt-1"></div>
			<input type="text" name="title" placeholder="제목을 입력하세요."
				value="${b.informationTitle}"
				style="border-radius: 5px; width: 100%; padding: 5px;" readonly>
			<br>
			<div class="mb-3 form-control" style="height: 500px; width: 100%;">
				${b.informationContent}</div>

			<div class="mb-3">
				첨부파일 : <a href="${b.informationChangeName }"
					download="${b.informationOriginName }">${b.informationOriginName }</a>
			</div>

			<div class="btn-group">
				<a class="btn btn-secondary" onclick="postFormSubmit(1)">글수정</a> <a
					class="btn btn-secondary" onclick="postFormSubmit(2)">글삭제</a>
			</div>
		</form>
	</main>

	<form id="postForm" method="post">
		<input type="hidden" name="informationNo" value="${b.informationNo}">
		<input type="hidden" name="filePath"
			value="${b.informationChangeName }">
	</form>

	<script>
		function postFormSubmit(num) {
			if (num == 1) {
				$("#postForm").attr("action", "updateForm.si").submit();
			} else {
				if (confirm("정말 삭제하시겠습니까??") == true) {
					$("#postForm").attr("action", "delete.si").submit();
				} else {
					return false;
				}
			}

		}
	</script>

	<jsp:include page="../../common/footer.jsp" />
</body>
</html>