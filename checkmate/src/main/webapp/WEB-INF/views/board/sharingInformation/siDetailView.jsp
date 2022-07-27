<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no" />
<meta name="description" content="" />
<meta name="author" content="" />
<title>Blog Post - Start Bootstrap Template</title>
<!-- Favicon-->
<link rel="icon" type="image/x-icon" href="resources/assets/favicon.ico" />
<!-- Core theme CSS (includes Bootstrap)-->
<link href="resources/css/styles.css" rel="stylesheet" />
<style>
ul{
   list-style:none;
   width: 100%;
   text-align: left;
 }

</style>
</head>
<body style="padding-top: 3rem;">
	<jsp:include page="../../common/header.jsp" />

	<!-- Page content-->
	<div class="container mt-5" align="center">
		<div class="row">
			<div class="col-lg-8">
				<!-- Post content-->
				<article>
					<!-- Post header-->
					<header class="mb-4">
						<!-- Post title-->
						<h1 class="fw-bolder mb-1">${b.informationTitle}</h1>
						<!-- Post meta content-->
						<div class="text-muted fst-italic mb-2"
							style="word-break: break-all;">Writer : ${b.userNick} | Views
							: ${b.informationView} | Date : ${b.informationDate}</div>
						<div class="text-muted fst-italic mb-2"
							style="word-break: break-all;">
							첨부파일 : <a href="${b.informationChangeName }"
								download="${b.informationOriginName }">${b.informationOriginName }</a>
						</div>
						<!-- Post categories-->
						<!--                             <a class="badge bg-secondary text-decoration-none link-light" href="#!">Web Design</a> -->
						<!--                             <a class="badge bg-secondary text-decoration-none link-light" href="#!">Freebies</a> -->
					</header>
					<!-- Post content-->
					<section class="mb-5" style="padding: 10px;">
						<p class="fs-5 mb-4">${b.informationContent}</p>
					</section>
					
					<c:if test="${loginUser.userId eq b.userId}">
					<div class="btn-group">
						<a class="btn btn-secondary" onclick="postFormSubmit(1)">글수정</a> <a
							class="btn btn-secondary" onclick="postFormSubmit(2)">글삭제</a>
					</div>
					</c:if>
				</article>
				<form id="postForm" method="post">
					<input type="hidden" name="informationNo"
						value="${b.informationNo}"> <input type="hidden"
						name="filePath" value="${b.informationChangeName }">
				</form>

				<script>
					function postFormSubmit(num) {
						if (num == 1) {
							$("#postForm").attr("action", "updateForm.si")
									.submit();
						} else {
							if (confirm("정말 삭제하시겠습니까??") == true) {
								$("#postForm").attr("action", "delete.si")
										.submit();
							} else {
								return false;
							}
						}

					}
				</script>


				<!-- Comments section-->
				<section class="mb-5">
					<div class="card bg-light">
						<div class="card-body">
							<!-- Comment form-->
							<form class="mb-4">
								<div class="input-group mb-3">
									<c:choose>
  						  				<c:when test="${ not empty loginUser }">
									<input type="text" class="form-control" id="insertContent"
										placeholder="댓글을 입력 해주세요." aria-label="Recipient's username"
										aria-describedby="button-addon2">
									<button class="btn btn-outline-secondary" type="button"
										id="button-addon2" onclick="addReply()">등록</button>
									</c:when>
  						  				<c:otherwise>	
									<input type="text" class="form-control" id="insertContent"
										placeholder="로그인이 필요합니다." aria-label="Recipient's username"
										aria-describedby="button-addon2">
									<button class="btn btn-outline-secondary disabled" type="button"
										id="button-addon2" onclick="addReply()">등록</button>
  						  				</c:otherwise>
									</c:choose>
								</div>
							</form>
							<div id="reply">
							
							</div>
						</div>
					</div>
				</section>
			</div>
			
			<script>
		    	$(function(){
		    		selectReplyList();
		    	})
		    	
		    	function addReply(){
    		
	    		if($("#insertContent").val().trim().length != 0){
	    			$.ajax({
	        			url : "rinsert.si",
	        			data : {
	        				refBno : ${b.informationNo},
	        				replyContent : $("#insertContent").val(),
	        				replyWriter : '${loginUser.userId}'
	        			},
	        			success : function(result){
	        				if(result=="Y"){
	        				selectReplyList();
							$("#insertContent").val("");        				
	        				}
	        			},
	        			error : function(){
	        				console.log("통신 실패")
	        			}
	        		})
		    		}else{
		    			$("#insertContent").val("");
		    			alertify.alert("댓글을 입력해주세요.")
		    		}
		    	}
		    	
		    	
		    	function selectReplyList(){ //댓글 전부를 불러오는 처리 
		    		$.ajax({
		    			url : "rlist.si",
		    			data : {
		    				informationNo : ${b.informationNo}
		    			},
		    			success : function(result){
		    				console.log(result);
							
							var resultStr="";
							
							for(var i=0; i<result.length;i++){
								
							resultStr+= "<div class=\"d-flex\">" +
											"<div class=\"flex-shrink-0\">" + 
												"<img class=\"rounded-circle\" src=\"https://dummyimage.com/50x50/ced4da/6c757d.jpg\" alt=\"...\" />" +
											"</div>" + 
											
											"<ul>" +
											"<li>" +
											
											"<div style=\"width:100%; height:30px;\">" +
												"<div class=\"fw-bold\" style=\"float:left\">" + result[i].replyWriter + "</div>" +
												"<div  style=\"font-size:2px; float:right; padding-right:20px;\">" +
												result[i].replyDate +
												"</div>" +
											"</div>" +
											
											"</li>" +
											"<li>" +
												"<span id=\"content\"> " + result[i].replyContent + "</span>" +
											
												"</li>" +
												"</ul>" +
												
										"</div>" +
										"<br>"
							}
						
		    				$("#reply").html(resultStr);
		    				$("#rcount").text(result.length);
		    			},
		    			error : function(){
		    				console.log("통신실패");
		    			}
		    		})
		    	}
		    </script>




			<!-- Side widgets-->
			<div class="col-lg-4">
				<!-- Search widget-->
				<div class="card mb-4">
					<div class="card-header">Search</div>
					<div class="card-body">
						<div class="input-group">
							<input class="form-control" type="text"
								placeholder="Enter search term..."
								aria-label="Enter search term..."
								aria-describedby="button-search" />
							<button class="btn btn-primary" id="button-search" type="button">Go!</button>
						</div>
					</div>
				</div>
				<!-- Categories widget-->
				<div class="card mb-4">
					<div class="card-header">Categories</div>
					<div class="card-body">
						<div class="row">
							<div class="col-sm-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#!">Web Design</a></li>
									<li><a href="#!">HTML</a></li>
									<li><a href="#!">Freebies</a></li>
								</ul>
							</div>
							<div class="col-sm-6">
								<ul class="list-unstyled mb-0">
									<li><a href="#!">JavaScript</a></li>
									<li><a href="#!">CSS</a></li>
									<li><a href="#!">Tutorials</a></li>
								</ul>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Bootstrap core JS-->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
	<!-- Core theme JS-->
	<script src="resources/js/scripts.js"></script>
</body>

<jsp:include page="../../common/footer.jsp" />
</body>
</html>