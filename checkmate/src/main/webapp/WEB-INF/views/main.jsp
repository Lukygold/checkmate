<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

<head>
<meta charset="utf-8">
<meta content="width=device-width, initial-scale=1.0" name="viewport">

<title>CHECKMATE</title>
<meta content="" name="description">
<meta content="" name="keywords">

<!-- Favicons -->
<link href="resources/img/favicon.png" rel="icon">
<link href="resources/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i"
	rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="resources/vendor/animate.css/animate.min.css"
	rel="stylesheet">
<link href="resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">
<link href="resources/vendor/bootstrap-icons/bootstrap-icons.css"
	rel="stylesheet">
<link href="resources/vendor/boxicons/css/boxicons.min.css"
	rel="stylesheet">
<link href="resources/vendor/glightbox/css/glightbox.min.css"
	rel="stylesheet">
<link href="resources/vendor/remixicon/remixicon.css" rel="stylesheet">
<link href="resources/vendor/swiper/swiper-bundle.min.css"
	rel="stylesheet">


<!-- Template Main CSS File -->
<link href="resources/css/style.css" rel="stylesheet">

<!-- =======================================================
  * Template Name: Hidayah - v4.7.0
  * Template URL: https://bootstrapmade.com/hidayah-free-simple-html-template-for-corporate/
  * Author: BootstrapMade.com
  * License: https://bootstrapmade.com/license/
  ======================================================== -->
</head>

<body>

	<jsp:include page="common/header.jsp" />

	<!-- ======= Hero Section ======= -->
	<section id="hero">
		<div id="heroCarousel" data-bs-interval="5000"
			class="carousel slide carousel-fade" data-bs-ride="carousel">

			<!-- <ol class="carousel-indicators" id="hero-carousel-indicators"></ol> -->

			<div class="carousel-inner" role="listbox">

				<!-- Slide 1 -->
				<div class="carousel-item active"
					style="background-image: url(resources/img/slide/slide-1.jpg)">
					<div class="carousel-container">
						<div class="container">
							<h2 class="animated fadeInDown">
								Welcome to <span>CHECKMATE</span>
							</h2>
							<form action="mainSearch.co" method="get">
								<div class="input-group mb-3 input-group-lg">
									<!-- <span class="input-group-text">Large</span> -->
									<input type="text" class="form-control" id="searchContent" name="searchContent" placeholder="검색할 내용을 입력해주세요">
									<button type="submit" class="btn-get-started animated fadeInUp scrollto"
										style="border: none;">Search</button>
								</div>
							</form>
						</div>
					</div>
				</div>

				<!-- Slide 2 -->
				<!-- <div class="carousel-item" style="background-image: url(resources/img/slide/slide-2.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animated fadeInDown">Lorem Ipsum Dolor</h2>
              <p class="animated fadeInUp">Ut velit est quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut. Similique ea voluptatem. Esse doloremque accusamus repellendus deleniti vel. Minus et tempore modi architecto.</p>
              <a href="#about" class="btn-get-started animated fadeInUp scrollto">Read More</a>
            </div>
          </div>
        </div> -->

				<!-- Slide 3 -->
				<!-- <div class="carousel-item" style="background-image: url(resources/img/slide/slide-3.jpg)">
          <div class="carousel-container">
            <div class="container">
              <h2 class="animated fadeInDown">Sequi ea ut et est quaerat</h2>
              <p class="animated fadeInUp">Ut velit est quam dolor ad a aliquid qui aliquid. Sequi ea ut et est quaerat sequi nihil ut aliquam. Occaecati alias dolorem mollitia ut. Similique ea voluptatem. Esse doloremque accusamus repellendus deleniti vel. Minus et tempore modi architecto.</p>
              <a href="#about" class="btn-get-started animated fadeInUp scrollto">Read More</a>
            </div>
          </div>
        </div> -->

			</div>

			<!-- <a class="carousel-control-prev" href="#heroCarousel" role="button" data-bs-slide="prev">
        <span class="carousel-control-prev-icon bi bi-chevron-left" aria-hidden="true"></span>
      </a>
      <a class="carousel-control-next" href="#heroCarousel" role="button" data-bs-slide="next">
        <span class="carousel-control-next-icon bi bi-chevron-right" aria-hidden="true"></span>
      </a> -->

		</div>
	</section>
	<!-- End Hero -->

	<main id="main">

		<!-- ======= About Section ======= -->
		<section id="about" class="about">
			<div class="container-fluid">

				<div class="row justify-content-center">
					<div
						class="col-xl-5 col-lg-6 video-box d-flex justify-content-center align-items-stretch position-relative">
					</div>

					<div
						class="col-xl-5 col-lg-6 icon-boxes d-flex flex-column align-items-stretch justify-content-center py-5 px-lg-5">
						<h3>새로운 스터디그룹 웹사이트</h3>
						<p>CHECK + MATE = CHECKMATE!</p>

						<div class="icon-box">
							<div class="icon">
								<i class="bx bx-laptop"></i>
							</div>
							<h4 class="title">
								<a href="">스터디그룹 전용 웹사이트</a>
							</h4>
							<p class="description">오직 스터디그룹을 위한 공간</p>
						</div>

						<div class="icon-box">
							<div class="icon">
								<i class="bx bx-info-circle"></i>
							</div>
							<h4 class="title">
								<a href="">정보제공</a>
							</h4>
							<p class="description">지도, 시험정보, 취업정보</p>
						</div>

						<div class="icon-box">
							<div class="icon">
								<i class="bx bx-atom"></i>
							</div>
							<h4 class="title">
								<a href="">실시간 스터디 웹사이트</a>
							</h4>
							<p class="description">시간과 공간에 제약이 없는 실시간 스터디 웹사이트</p>
						</div>

					</div>
				</div>

			</div>
		</section>
		<!-- End About Section -->

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container-fluid">

				<div class="section-title">
					<h2>Services</h2>
					<h3>
						Check our <span>Services</span>
					</h3>
					<p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis
						est adipisci expedita at voluptas atque vitae autem.</p>
				</div>

				<div class="row justify-content-center">
					<div class="col-xl-10">
						<div class="row">
							<div class="col-lg-4 col-md-6 icon-box">
								<div class="icon">
									<i class="ri-pie-chart-line"></i>
								</div>
								<h4 class="title">
									<a href="">Lorem Ipsum</a>
								</h4>
								<p class="description">Voluptatum deleniti atque corrupti
									quos dolores et quas molestias excepturi sint occaecati
									cupiditate non provident</p>
							</div>
							<div class="col-lg-4 col-md-6 icon-box">
								<div class="icon">
									<i class="ri-stack-line"></i>
								</div>
								<h4 class="title">
									<a href="">Dolor Sitema</a>
								</h4>
								<p class="description">Minim veniam, quis nostrud
									exercitation ullamco laboris nisi ut aliquip ex ea commodo
									consequat tarad limino ata</p>
							</div>
							<div class="col-lg-4 col-md-6 icon-box">
								<div class="icon">
									<i class="ri-markup-line"></i>
								</div>
								<h4 class="title">
									<a href="">Sed ut perspiciatis</a>
								</h4>
								<p class="description">Duis aute irure dolor in
									reprehenderit in voluptate velit esse cillum dolore eu fugiat
									nulla pariatur</p>
							</div>
							<div class="col-lg-4 col-md-6 icon-box">
								<div class="icon">
									<i class="ri-shape-line"></i>
								</div>
								<h4 class="title">
									<a href="">Magni Dolores</a>
								</h4>
								<p class="description">Excepteur sint occaecat cupidatat non
									proident, sunt in culpa qui officia deserunt mollit anim id est
									laborum</p>
							</div>
							<div class="col-lg-4 col-md-6 icon-box">
								<div class="icon">
									<i class="ri-fingerprint-line"></i>
								</div>
								<h4 class="title">
									<a href="">Nemo Enim</a>
								</h4>
								<p class="description">At vero eos et accusamus et iusto
									odio dignissimos ducimus qui blanditiis praesentium voluptatum
									deleniti atque</p>
							</div>
							<div class="col-lg-4 col-md-6 icon-box">
								<div class="icon">
									<i class="ri-body-scan-line"></i>
								</div>
								<h4 class="title">
									<a href="">Eiusmod Tempor</a>
								</h4>
								<p class="description">Et harum quidem rerum facilis est et
									expedita distinctio. Nam libero tempore, cum soluta nobis est
									eligendi</p>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End Services Section -->

		<!-- ======= Cta Section ======= -->
		<section id="cta" class="cta">
			<div class="container">

				<div class="text-center">
					<h3>Call To Action</h3>
					<p>Duis aute irure dolor in reprehenderit in voluptate velit
						esse cillum dolore eu fugiat nulla pariatur. Excepteur sint
						occaecat cupidatat non proident, sunt in culpa qui officia
						deserunt mollit anim id est laborum.</p>
					<a class="cta-btn" href="#">Call To Action</a>
				</div>

			</div>
		</section>
		<!-- End Cta Section -->

		<!-- ======= Portfolio Section ======= -->
		<section id="portfolio" class="portfolio">
			<div class="container-fluid">

				<div class="section-title">
					<h2>Portfolio</h2>
					<h3>
						Check our <span>Portfolio</span>
					</h3>
					<p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis
						est adipisci expedita at voluptas atque vitae autem.</p>
				</div>

				<div class="row">
					<div class="col-lg-12 d-flex justify-content-center">
						<ul id="portfolio-flters">
							<li data-filter="*" class="filter-active">All</li>
							<li data-filter=".filter-app">App</li>
							<li data-filter=".filter-card">Card</li>
							<li data-filter=".filter-web">Web</li>
						</ul>
					</div>
				</div>

				<div class="row portfolio-container justify-content-center">

					<div class="col-xl-10">
						<div class="row">

							<div class="col-xl-3 col-lg-4 col-md-6 portfolio-item filter-app">
								<div class="portfolio-wrap">
									<img src="resources/img/portfolio/portfolio-1.jpg"
										class="img-fluid" alt="">
									<div class="portfolio-info">
										<h4>App 1</h4>
										<p>App</p>
										<div class="portfolio-links">
											<a href="resources/img/portfolio/portfolio-1.jpg"
												data-gallery="portfolioGallery" class="portfolio-lightbox"
												title="App 1"><i class="bx bx-plus"></i></a> <a
												href="portfolio-details.html" title="More Details"><i
												class="bx bx-link"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- End portfolio item -->

							<div class="col-xl-3 col-lg-4 col-md-6 portfolio-item filter-web">
								<div class="portfolio-wrap">
									<img src="resources/img/portfolio/portfolio-2.jpg"
										class="img-fluid" alt="">
									<div class="portfolio-info">
										<h4>Web 3</h4>
										<p>Web</p>
										<div class="portfolio-links">
											<a href="resources/img/portfolio/portfolio-2.jpg"
												data-gallery="portfolioGallery" class="portfolio-lightbox"
												title="Web 3"><i class="bx bx-plus"></i></a> <a
												href="portfolio-details.html" title="More Details"><i
												class="bx bx-link"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- End portfolio item -->

							<div class="col-xl-3 col-lg-4 col-md-6 portfolio-item filter-app">
								<div class="portfolio-wrap">
									<img src="resources/img/portfolio/portfolio-3.jpg"
										class="img-fluid" alt="">
									<div class="portfolio-info">
										<h4>App 2</h4>
										<p>App</p>
										<div class="portfolio-links">
											<a href="resources/img/portfolio/portfolio-3.jpg"
												data-gallery="portfolioGallery" class="portfolio-lightbox"
												title="App 2"><i class="bx bx-plus"></i></a> <a
												href="portfolio-details.html" title="More Details"><i
												class="bx bx-link"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- End portfolio item -->

							<div
								class="col-xl-3 col-lg-4 col-md-6 portfolio-item filter-card">
								<div class="portfolio-wrap">
									<img src="resources/img/portfolio/portfolio-4.jpg"
										class="img-fluid" alt="">
									<div class="portfolio-info">
										<h4>Card 2</h4>
										<p>Card</p>
										<div class="portfolio-links">
											<a href="resources/img/portfolio/portfolio-4.jpg"
												data-gallery="portfolioGallery" class="portfolio-lightbox"
												title="Card 2"><i class="bx bx-plus"></i></a> <a
												href="portfolio-details.html" title="More Details"><i
												class="bx bx-link"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- End portfolio item -->

							<div class="col-xl-3 col-lg-4 col-md-6 portfolio-item filter-web">
								<div class="portfolio-wrap">
									<img src="resources/img/portfolio/portfolio-5.jpg"
										class="img-fluid" alt="">
									<div class="portfolio-info">
										<h4>Web 2</h4>
										<p>Web</p>
										<div class="portfolio-links">
											<a href="resources/img/portfolio/portfolio-5.jpg"
												data-gallery="portfolioGallery" class="portfolio-lightbox"
												title="Web 2"><i class="bx bx-plus"></i></a> <a
												href="portfolio-details.html" title="More Details"><i
												class="bx bx-link"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- End portfolio item -->

							<div class="col-xl-3 col-lg-4 col-md-6 portfolio-item filter-app">
								<div class="portfolio-wrap">
									<img src="resources/img/portfolio/portfolio-6.jpg"
										class="img-fluid" alt="">
									<div class="portfolio-info">
										<h4>App 3</h4>
										<p>App</p>
										<div class="portfolio-links">
											<a href="resources/img/portfolio/portfolio-6.jpg"
												data-gallery="portfolioGallery" class="portfolio-lightbox"
												title="App 3"><i class="bx bx-plus"></i></a> <a
												href="portfolio-details.html" title="More Details"><i
												class="bx bx-link"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- End portfolio item -->

							<div
								class="col-xl-3 col-lg-4 col-md-6 portfolio-item filter-card">
								<div class="portfolio-wrap">
									<img src="resources/img/portfolio/portfolio-7.jpg"
										class="img-fluid" alt="">
									<div class="portfolio-info">
										<h4>Card 1</h4>
										<p>Card</p>
										<div class="portfolio-links">
											<a href="resources/img/portfolio/portfolio-7.jpg"
												data-gallery="portfolioGallery" class="portfolio-lightbox"
												title="Card 1"><i class="bx bx-plus"></i></a> <a
												href="portfolio-details.html" title="More Details"><i
												class="bx bx-link"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- End portfolio item -->

							<div
								class="col-xl-3 col-lg-4 col-md-6 portfolio-item filter-card">
								<div class="portfolio-wrap">
									<img src="resources/img/portfolio/portfolio-8.jpg"
										class="img-fluid" alt="">
									<div class="portfolio-info">
										<h4>Card 3</h4>
										<p>Card</p>
										<div class="portfolio-links">
											<a href="resources/img/portfolio/portfolio-8.jpg"
												data-gallery="portfolioGallery" class="portfolio-lightbox"
												title="Card 3"><i class="bx bx-plus"></i></a> <a
												href="portfolio-details.html" title="More Details"><i
												class="bx bx-link"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- End portfolio item -->

							<div class="col-xl-3 col-lg-4 col-md-6 portfolio-item filter-web">
								<div class="portfolio-wrap">
									<img src="resources/img/portfolio/portfolio-9.jpg"
										class="img-fluid" alt="">
									<div class="portfolio-info">
										<h4>Web 3</h4>
										<p>Web</p>
										<div class="portfolio-links">
											<a href="resources/img/portfolio/portfolio-9.jpg"
												data-gallery="portfolioGallery" class="portfolio-lightbox"
												title="Web 3"><i class="bx bx-plus"></i></a> <a
												href="portfolio-details.html" title="More Details"><i
												class="bx bx-link"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- End portfolio item -->

						</div>
					</div>

				</div>

			</div>
		</section>
		<!-- End Portfolio Section -->

		<!-- ======= Testimonials Section ======= -->
		<section id="testimonials" class="testimonials section-bg">
			<div class="container-fluid">

				<div class="section-title">
					<h2>Testimonials</h2>
					<h3>
						What They <span>Are Saying</span> About Us
					</h3>
					<p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis
						est adipisci expedita at voluptas atque vitae autem.</p>
				</div>

				<div class="row justify-content-center">
					<div class="col-xl-10">

						<div class="row">

							<div class="col-lg-6">
								<div class="testimonial-item">
									<img src="resources/img/testimonials/testimonials-1.jpg"
										class="testimonial-img" alt="">
									<h3>Saul Goodman</h3>
									<h4>Ceo &amp; Founder</h4>
									<p>
										<i class="bx bxs-quote-alt-left quote-icon-left"></i> Proin
										iaculis purus consequat sem cure digni ssim donec porttitora
										entum suscipit rhoncus. Accusantium quam, ultricies eget id,
										aliquam eget nibh et. Maecen aliquam, risus at semper. <i
											class="bx bxs-quote-alt-right quote-icon-right"></i>
									</p>
								</div>
							</div>
							<!-- End testimonial-item -->

							<div class="col-lg-6">
								<div class="testimonial-item mt-4 mt-lg-0">
									<img src="resources/img/testimonials/testimonials-2.jpg"
										class="testimonial-img" alt="">
									<h3>Sara Wilsson</h3>
									<h4>Designer</h4>
									<p>
										<i class="bx bxs-quote-alt-left quote-icon-left"></i> Export
										tempor illum tamen malis malis eram quae irure esse labore
										quem cillum quid cillum eram malis quorum velit fore eram
										velit sunt aliqua noster fugiat irure amet legam anim culpa. <i
											class="bx bxs-quote-alt-right quote-icon-right"></i>
									</p>
								</div>
							</div>
							<!-- End testimonial-item -->

							<div class="col-lg-6">
								<div class="testimonial-item mt-4">
									<img src="resources/img/testimonials/testimonials-3.jpg"
										class="testimonial-img" alt="">
									<h3>Jena Karlis</h3>
									<h4>Store Owner</h4>
									<p>
										<i class="bx bxs-quote-alt-left quote-icon-left"></i> Enim
										nisi quem export duis labore cillum quae magna enim sint
										quorum nulla quem veniam duis minim tempor labore quem eram
										duis noster aute amet eram fore quis sint minim. <i
											class="bx bxs-quote-alt-right quote-icon-right"></i>
									</p>
								</div>
							</div>
							<!-- End testimonial-item -->

							<div class="col-lg-6">
								<div class="testimonial-item mt-4">
									<img src="resources/img/testimonials/testimonials-4.jpg"
										class="testimonial-img" alt="">
									<h3>Matt Brandon</h3>
									<h4>Freelancer</h4>
									<p>
										<i class="bx bxs-quote-alt-left quote-icon-left"></i> Fugiat
										enim eram quae cillum dolore dolor amet nulla culpa multos
										export minim fugiat minim velit minim dolor enim duis veniam
										ipsum anim magna sunt elit fore quem dolore labore illum
										veniam. <i class="bx bxs-quote-alt-right quote-icon-right"></i>
									</p>
								</div>
							</div>
							<!-- End testimonial-item -->

							<div class="col-lg-6">
								<div class="testimonial-item mt-4">
									<img src="resources/img/testimonials/testimonials-5.jpg"
										class="testimonial-img" alt="">
									<h3>John Larson</h3>
									<h4>Entrepreneur</h4>
									<p>
										<i class="bx bxs-quote-alt-left quote-icon-left"></i> Quis
										quorum aliqua sint quem legam fore sunt eram irure aliqua
										veniam tempor noster veniam enim culpa labore duis sunt culpa
										nulla illum cillum fugiat legam esse veniam culpa fore nisi
										cillum quid. <i
											class="bx bxs-quote-alt-right quote-icon-right"></i>
									</p>
								</div>
							</div>
							<!-- End testimonial-item -->

							<div class="col-lg-6">
								<div class="testimonial-item mt-4">
									<img src="resources/img/testimonials/testimonials-6.jpg"
										class="testimonial-img" alt="">
									<h3>Emily Harison</h3>
									<h4>Store Owner</h4>
									<p>
										<i class="bx bxs-quote-alt-left quote-icon-left"></i> Eius
										ipsam praesentium dolor quaerat inventore rerum odio. Quos
										laudantium adipisci eius. Accusamus qui iste cupiditate sed
										temporibus est aspernatur. Sequi officiis ea et quia quidem. <i
											class="bx bxs-quote-alt-right quote-icon-right"></i>
									</p>
								</div>
							</div>
							<!-- End testimonial-item -->

						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End Testimonials Section -->

		<!-- ======= Team Section ======= -->
		<section id="team" class="team">
			<div class="container-fluid">

				<div class="section-title">
					<h2>Team</h2>
					<h3>
						Our Hard Working <span>Team</span>
					</h3>
					<p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis
						est adipisci expedita at voluptas atque vitae autem.</p>
				</div>

				<div class="row justify-content-center">
					<div class="col-xl-10">
						<div class="row">

							<div class="col-xl-3 col-lg-4 col-md-6">
								<div class="member">
									<img src="resources/img/team/team-1.jpg" class="img-fluid"
										alt="">
									<div class="member-info">
										<div class="member-info-content">
											<h4>Walter White</h4>
											<span>Chief Executive Officer</span>
										</div>
										<div class="social">
											<a href=""><i class="bi bi-twitter"></i></a> <a href=""><i
												class="bi bi-facebook"></i></a> <a href=""><i
												class="bi bi-instagram"></i></a> <a href=""><i
												class="bi bi-linkedin"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- End Member Item -->

							<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.1s">
								<div class="member">
									<img src="resources/img/team/team-2.jpg" class="img-fluid"
										alt="">
									<div class="member-info">
										<div class="member-info-content">
											<h4>Sarah Jhonson</h4>
											<span>Product Manager</span>
										</div>
										<div class="social">
											<a href=""><i class="bi bi-twitter"></i></a> <a href=""><i
												class="bi bi-facebook"></i></a> <a href=""><i
												class="bi bi-instagram"></i></a> <a href=""><i
												class="bi bi-linkedin"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- End Member Item -->

							<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.2s">
								<div class="member">
									<img src="resources/img/team/team-3.jpg" class="img-fluid"
										alt="">
									<div class="member-info">
										<div class="member-info-content">
											<h4>William Anderson</h4>
											<span>CTO</span>
										</div>
										<div class="social">
											<a href=""><i class="bi bi-twitter"></i></a> <a href=""><i
												class="bi bi-facebook"></i></a> <a href=""><i
												class="bi bi-instagram"></i></a> <a href=""><i
												class="bi bi-linkedin"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- End Member Item -->

							<div class="col-xl-3 col-lg-4 col-md-6" data-wow-delay="0.3s">
								<div class="member">
									<img src="resources/img/team/team-4.jpg" class="img-fluid"
										alt="">
									<div class="member-info">
										<div class="member-info-content">
											<h4>Amanda Jepson</h4>
											<span>Accountant</span>
										</div>
										<div class="social">
											<a href=""><i class="bi bi-twitter"></i></a> <a href=""><i
												class="bi bi-facebook"></i></a> <a href=""><i
												class="bi bi-instagram"></i></a> <a href=""><i
												class="bi bi-linkedin"></i></a>
										</div>
									</div>
								</div>
							</div>
							<!-- End Member Item -->

						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End Team Section -->

		<!-- ======= Contact Section ======= -->
		<section id="contact" class="contact section-bg">
			<div class="container-fluid">

				<div class="section-title">
					<h2>Contact</h2>
					<h3>
						Get In Touch With <span>Us</span>
					</h3>
					<p>Ut possimus qui ut temporibus culpa velit eveniet modi omnis
						est adipisci expedita at voluptas atque vitae autem.</p>
				</div>

				<div class="row justify-content-center">
					<div class="col-xl-10">
						<div class="row">

							<div class="col-lg-6">

								<div class="row justify-content-center">

									<div
										class="col-md-6 info d-flex flex-column align-items-stretch">
										<i class="bx bx-map"></i>
										<h4>Address</h4>
										<p>
											A108 Adam Street,<br>New York, NY 535022
										</p>
									</div>
									<div
										class="col-md-6 info d-flex flex-column align-items-stretch">
										<i class="bx bx-phone"></i>
										<h4>Call Us</h4>
										<p>
											+1 5589 55488 55<br>+1 5589 22548 64
										</p>
									</div>
									<div
										class="col-md-6 info d-flex flex-column align-items-stretch">
										<i class="bx bx-envelope"></i>
										<h4>Email Us</h4>
										<p>
											contact@example.com<br>info@example.com
										</p>
									</div>
									<div
										class="col-md-6 info d-flex flex-column align-items-stretch">
										<i class="bx bx-time-five"></i>
										<h4>Working Hours</h4>
										<p>
											Mon - Fri: 9AM to 5PM<br>Sunday: 9AM to 1PM
										</p>
									</div>

								</div>

							</div>

							<div class="col-lg-6">
								<form action="forms/contact.php" method="post" role="form"
									class="php-email-form">
									<div class="row">
										<div class="col-md-6 form-group">
											<label for="name">Your Name</label> <input type="text"
												name="name" class="form-control" id="name" required>
										</div>
										<div class="col-md-6 form-group mt-3 mt-md-0">
											<label for="email">Your Email</label> <input type="email"
												class="form-control" name="email" id="email" required>
										</div>
									</div>
									<div class="form-group mt-3">
										<label for="subject">Subject</label> <input type="text"
											class="form-control" name="subject" id="subject" required>
									</div>
									<div class="form-group mt-3">
										<label for="message">Message</label>
										<textarea class="form-control" name="message" rows="8"
											required></textarea>
									</div>
									<div class="my-3">
										<div class="loading">Loading</div>
										<div class="error-message"></div>
										<div class="sent-message">Your message has been sent.
											Thank you!</div>
									</div>
									<div class="text-center">
										<button type="submit">Send Message</button>
									</div>
								</form>
							</div>

						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End Contact Section -->

	</main>
	<!-- End #main -->

	<jsp:include page="common/footer.jsp" />




	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="resources/vendor/purecounter/purecounter.js"></script>
	<script src="resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="resources/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="resources/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="resources/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="resources/vendor/waypoints/noframework.waypoints.js"></script>
	<script src="resources/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="resources/js/main.js"></script>

	<c:choose>
		<c:when test="${not empty loginUser }">
			<script>
		  (function location(){
		  	navigator.geolocation.getCurrentPosition(
		  	function(position) {
		  		var positionLat = position.coords.latitude;
		  		var positionLon = position.coords.longitude;
				    
		  		$.ajax({
		  			url : "location.lo",
		  			data : {
		  				locationLatitude : positionLat,
		  				locationLongitude : positionLon,
		  				userNo : ${loginUser.userNo}
		  			},
		  			success : function(result){
						
		  			},
		  			error : function(){
		  				console.log("통신실패");
		  			}
		  		})
		  	},
		  	);
		  })();
		  </script>
		</c:when>
	</c:choose>
</body>



</html>