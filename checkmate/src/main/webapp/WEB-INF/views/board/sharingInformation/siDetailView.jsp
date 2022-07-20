<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css"
	integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js"
	integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"
	integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js"
	integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6"
	crossorigin="anonymous"></script>

<link
	href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<link href="resources/css/sharingInformation.css" rel="stylesheet"
	type="text/css" />
</head>
<body style="padding-top: 7rem;">
	<jsp:include page="../../common/header.jsp" />
	<main role="main" class="container back-image">
		디테일
		<form name="form" method="POST" action="/bulletin_wr01">
					<input class="form-control col-4 text-center float-left" type="text" value="작성자" aria-label="input example">
					<input class="form-control col-4 text-center float-left" type="text" value="등록일" aria-label="input example">
					<input class="form-control col-4 text-center" type="text" value="조회수" aria-label="input example">
					<input class="form-control col-4 text-center float-left" type="text" value="${b.userId}" aria-label="input example">
					<input class="form-control col-4 text-center float-left" type="text" value="${b.informationDate}" aria-label="input example">
					<input class="form-control col-4 text-center" type="text" value="${b.informationView}">
			<div class="pt-1"></div>
			<input type="text" name="title" placeholder="제목을 입력하세요." value="${b.informationTitle}"
				style="border-radius: 5px; width: 100%; padding: 5px;" readonly> <br>
			<div class="mb-3">
				<textarea class="form-control" id="exampleFormControlTextarea1"
					rows="3" readonly>${b.informationContent}</textarea>
			</div>


			<div class="mb-3">
				<input class="form-control" type="file" id="formFileMultiple"
					multiple>
			</div>
			
			<div class="btn-group">
				<a class="btn btn-secondary" onclick="postFormSubmit(1)">글수정</a>
				<a class="btn btn-secondary" onclick="postFormSubmit(2)">글삭제</a>
			</div>
		</form>
	</main>
	
	<form id="postForm" method="post">
		<input type="hidden" name="informationNo" value="${b.informationNo}">
<%-- 		<input type="hidden" name="informationNo" value="${b.informationNo}"> --%>
	</form>
	
	<script>
		function postFormSubmit(num) {
			if(num==1){
				$("#postForm").attr("action","updateForm.si").submit();
			}
			
		}
	</script>
	
	<jsp:include page="../../common/footer.jsp" />
</body>
</html>