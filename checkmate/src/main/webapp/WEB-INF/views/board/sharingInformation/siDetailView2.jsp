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
	
	<!-- Page content-->
<div class="container-fluid">
<section class="mb-5">
    <div class="card bg-light">
        <div class="card-body">
            <!-- Comment form-->
            <form class="mb-4"><textarea class="form-control" rows="3" placeholder="Join the discussion and leave a comment!"></textarea></form>
            <!-- Comment with nested comments-->
            <div class="d-flex mb-4">
                <!-- Parent comment-->
                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
                <div class="ms-3">
                    <div class="fw-bold">Commenter Name</div>
                    If you're going to lead a space frontier, it has to be government; it'll never be private enterprise. Because the space frontier is dangerous, and it's expensive, and it has unquantified risks.
                    <!-- Child comment 1-->
                    <div class="d-flex mt-4">
                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
                        <div class="ms-3">
                            <div class="fw-bold">Commenter Name</div>
                            And under those conditions, you cannot establish a capital-market evaluation of that enterprise. You can't get investors.
                        </div>
                    </div>
                    <!-- Child comment 2-->
                    <div class="d-flex mt-4">
                        <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
                        <div class="ms-3">
                            <div class="fw-bold">Commenter Name</div>
                            When you put money directly to a problem, it makes a good headline.
                        </div>
                    </div>
                </div>
            </div>
            <!-- Single comment-->
            <div class="d-flex">
                <div class="flex-shrink-0"><img class="rounded-circle" src="https://dummyimage.com/50x50/ced4da/6c757d.jpg" alt="..."></div>
                <div class="ms-3">
                    <div class="fw-bold">Commenter Name</div>
                    When I look at the universe and all the ways the universe wants to kill us, I find it hard to reconcile that with statements of beneficence.
                </div>
            </div>
        </div>
    </div>
</section>
</div>
	
	

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