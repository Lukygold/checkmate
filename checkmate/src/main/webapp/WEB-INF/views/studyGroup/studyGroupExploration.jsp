<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>스터디그룹 둘러보기</title>
<style>
#explorationContainer {
	width: 50%;
	margin: 0 auto;
}
</style>
</head>
<body>

	<jsp:include page="../common/header.jsp" />
	<br><br><br><br><br>

	<div id="explorationContainer">
		<h1><mark>한 자리 남았어요!!</mark></h1>
		<br>
		<div class="row row-cols-1 row-cols-md-3">
			<div class="col">
				<div class="card border-primary mb-3 h-100" style="max-width: 18rem;">
					<div class="card-header bg-transparent border-primary">정보처리기사 실기</div>
					<div class="card-body">
						<h5 class="card-title">주3회 출석필수</h5>
						<p class="card-text">서울 도심권</p>
					</div>
					<div class="card-footer bg-transparent border-primary" style="text-align: center;">
						<a href="#" class="btn btn-primary">상세보기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card border-primary mb-3 h-100" style="max-width: 18rem;">
					<div class="card-header bg-transparent border-primary">토익 800점 목표</div>
					<div class="card-body">
						<h5 class="card-title">온라인 스터디</h5>
						<p class="card-text">서울 서북권</p>
					</div>
					<div class="card-footer bg-transparent border-primary" style="text-align: center;">
						<a href="#" class="btn btn-primary">상세보기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card border-primary mb-3 h-100" style="max-width: 18rem;">
					<div class="card-header bg-transparent border-primary">공기업 취업스터디</div>
					<div class="card-body">
						<h5 class="card-title">2023년 공기업 취업대비</h5>
						<p class="card-text">서울 서남권</p>
					</div>
					<div class="card-footer bg-transparent border-primary" style="text-align: center;">
						<a href="#" class="btn btn-primary">상세보기</a>
					</div>
				</div>
			</div>
		</div>
		<br><br>
		<h1><mark>일간 조회수 최다 스터디그룹</mark></h1>
		<br>
		<div class="row row-cols-1 row-cols-md-3">
			<div class="col">
				<div class="card border-primary mb-3 h-100" style="max-width: 18rem;">
					<div class="card-header bg-transparent border-primary">정보처리기사 실기</div>
					<div class="card-body">
						<h5 class="card-title">주3회 출석필수</h5>
						<p class="card-text">서울 도심권</p>
					</div>
					<div class="card-footer bg-transparent border-primary" style="text-align: center;">
						<a href="#" class="btn btn-primary">상세보기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card border-primary mb-3 h-100" style="max-width: 18rem;">
					<div class="card-header bg-transparent border-primary">토익 800점 목표</div>
					<div class="card-body">
						<h5 class="card-title">온라인 스터디</h5>
						<p class="card-text">서울 서북권</p>
					</div>
					<div class="card-footer bg-transparent border-primary" style="text-align: center;">
						<a href="#" class="btn btn-primary">상세보기</a>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="card border-primary mb-3 h-100" style="max-width: 18rem;">
					<div class="card-header bg-transparent border-primary">공기업 취업스터디</div>
					<div class="card-body">
						<h5 class="card-title">2023년 공기업 취업대비</h5>
						<p class="card-text">서울 서남권</p>
					</div>
					<div class="card-footer bg-transparent border-primary" style="text-align: center;">
						<a href="#" class="btn btn-primary">상세보기</a>
					</div>
				</div>
			</div>
		</div>
		<br><br>
		<h1><mark>전체 스터디그룹 목록</mark></h1>
		<br>
		<table class="table table-bordered border-primary">
			<thead>
			    <tr>
			      <th scope="col"></th>
			      <th scope="col">이름</th>
			      <th scope="col">목표</th>
			      <th scope="col">설명</th>
			    </tr>
			</thead>
		  	<tbody>
			    <tr>
			      <th scope="row">1</th>
			      <td>화이팅</td>
			      <td>정처기</td>
			      <td>열심히함</td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td>으악</td>
			      <td>토익</td>
			      <td>대충함</td>
			    </tr>
			    <tr>
			      <th scope="row">2</th>
			      <td>열심열심</td>
			      <td>카카오취업</td>
			      <td>코딩테스트함</td>
			    </tr>
			</tbody>
		</table>
	</div>

	<br><br>
	<jsp:include page="../common/footer.jsp" />

</body>
</html>