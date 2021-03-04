<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<html>
<head>
<meta charset="UTF-8">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-giJF6kkoqNQ00vy+HMDP7azOuL0xtbfIcaT9wjKHr8RbDVddVHyTfAAsrekwKmP1"
	crossorigin="anonymous">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-beta1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-ygbV9kiqUc6oa4msXn9868pTtWMgiQaeYH7/t7LECLbyPA2x65Kgf80OJFdroafW"
	crossorigin="anonymous"></script>
<style type="text/css">
.PNAME{
	text-shadow: -2px 0 white, 0 2px white, 2px 0 white, 0 -2px white;
}
</style>
<title>Main</title>
</head>
<body>
	<%@ include file="Header.jsp"%>
	<div class="my-1">
		<%@ include file="MainNav.jsp" %>
	</div>
	<div id="bestOrderList" class="carousel carousel-dark slide h-50 mb-5" data-bs-ride="carousel">
		<h6>베스트 상품 목록</h6>
		<ol class="carousel-indicators">
			<c:forEach items="${bestOrderList}" var="i" varStatus="status">
				<c:choose>
					<c:when test="${status.index == 0}">
						<li data-bs-target="#bestOrderList" data-bs-slide-to="${status.index}" class="active"></li>
					</c:when>
					<c:otherwise>
						<li data-bs-target="#bestOrderList" data-bs-slide-to="${status.index}"></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ol>
		<div class="carousel-inner">
			<c:forEach items="${bestOrderList}" var="i" varStatus="status">
				<c:choose>
					<c:when test="${status.index == 0}">
						<div class="carousel-item active">
      						<img src="resources/upload/${i.getPIMG()}" height="100%" class="d-block w-100" alt="패키지 이미지">
							<div class="container">
								<div class="carousel-caption text-end">
									<h1 class="PNAME">${i.getPNAME()}</h1>
									<p>
										<a class="btn btn-lg btn-primary" href="goPackageDetail?PNUMBER=${i.getPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}" target="_blank" role="button">보러가기</a>
									</p>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="carousel-item">
      						<img src="resources/upload/${i.getPIMG()}" height="100%" class="d-block w-100" alt="패키지 이미지">
							<div class="container">
								<div class="carousel-caption text-end">
									<h1 class="PNAME">${i.getPNAME()}</h1>
									<p>
										<a class="btn btn-lg btn-primary" href="goPackageDetail?PNUMBER=${i.getPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}" target="_blank" role="button">보러가기</a>
									</p>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<a class="carousel-control-prev" href="#bestOrderList" role="button" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</a>
		<a class="carousel-control-next" href="#bestOrderList" role="button" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</a>
	</div>

	<c:if test="${!empty sessionScope.loginInfo}">
		<c:if test="${!empty preferOrderList}">
			<div id="preferOrderList" class="carousel carousel-dark slide h-25 mb-5" data-bs-ride="carousel">
				<h6>선호 카테고리 중 판매량이 많은 상품 목록</h6>
				<ol class="carousel-indicators">
					<c:forEach items="${preferOrderList}" var="i" varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0}">
								<li data-bs-target="#preferOrderList" data-bs-slide-to="${status.index}" class="active"></li>
							</c:when>
							<c:otherwise>
								<li data-bs-target="#preferOrderList" data-bs-slide-to="${status.index}"></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ol>
				<div class="carousel-inner">
					<c:forEach items="${preferOrderList}" var="i" varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0}">
								<div class="carousel-item active">
		      						<img src="resources/upload/${i.getPIMG()}" height="100%" class="d-block w-100" alt="패키지 이미지">
									<div class="container">
										<div class="carousel-caption text-end">
											<h1 class="PNAME">${i.getPNAME()}</h1>
											<p>
												<a class="btn btn-lg btn-primary" href="goPackageDetail?PNUMBER=${i.getPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}" target="_blank" role="button">보러가기</a>
											</p>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="carousel-item">
		      						<img src="resources/upload/${i.getPIMG()}" height="100%" class="d-block w-100" alt="패키지 이미지">
									<div class="container">
										<div class="carousel-caption text-end">
											<h1 class="PNAME">${i.getPNAME()}</h1>
											<p>
												<a class="btn btn-lg btn-primary" href="goPackageDetail?PNUMBER=${i.getPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}" target="_blank" role="button">보러가기</a>
											</p>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<a class="carousel-control-prev" href="#preferOrderList" role="button" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</a>
				<a class="carousel-control-next" href="#preferOrderList" role="button" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</a>
			</div>
		</c:if>
		
		<c:if test="${!empty likeOrderList}">
			<div id="likeOrderList" class="carousel carousel-dark slide h-25 mb-5" data-bs-ride="carousel">
				<h6>좋아요 한 상품 중 판매량이 많은 상품</h6>
				<ol class="carousel-indicators">
					<c:forEach items="${likeOrderList}" var="i" varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0}">
								<li data-bs-target="#likeOrderList" data-bs-slide-to="${status.index}" class="active"></li>
							</c:when>
							<c:otherwise>
								<li data-bs-target="#likeOrderList" data-bs-slide-to="${status.index}"></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ol>
				<div class="carousel-inner">
					<c:forEach items="${likeOrderList}" var="i" varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0}">
								<div class="carousel-item active">
		      						<img src="resources/upload/${i.getPIMG()}" height="100%" class="d-block w-100" alt="패키지 이미지">
									<div class="container">
										<div class="carousel-caption text-end">
											<h1 class="PNAME">${i.getPNAME()}</h1>
											<p>
												<a class="btn btn-lg btn-primary" href="goPackageDetail?PNUMBER=${i.getPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}" target="_blank" role="button">보러가기</a>
											</p>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="carousel-item">
		      						<img src="resources/upload/${i.getPIMG()}" height="100%" class="d-block w-100" alt="패키지 이미지">
									<div class="container">
										<div class="carousel-caption text-end">
											<h1 class="PNAME">${i.getPNAME()}</h1>
											<p>
												<a class="btn btn-lg btn-primary" href="goPackageDetail?PNUMBER=${i.getPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}" target="_blank" role="button">보러가기</a>
											</p>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<a class="carousel-control-prev" href="#likeOrderList" role="button" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</a>
				<a class="carousel-control-next" href="#likeOrderList" role="button" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</a>
			</div>
		</c:if>
		
		<c:if test="${!empty sameLikeOrderList}">
			<div id="sameLikeOrderList" class="carousel carousel-dark slide h-25 mb-5" data-bs-ride="carousel">
				<h6>같은 상품을 좋아요 한 사람들이 가장 많이 구매한 상품</h6>
				<ol class="carousel-indicators">
					<c:forEach items="${sameLikeOrderList}" var="i" varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0}">
								<li data-bs-target="#sameLikeOrderList data-bs-slide-to="${status.index}" class="active"></li>
							</c:when>
							<c:otherwise>
								<li data-bs-target="#sameLikeOrderList" data-bs-slide-to="${status.index}"></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ol>
				<div class="carousel-inner">
					<c:forEach items="${sameLikeList}" var="i" varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0}">
								<div class="carousel-item active">
		      						<img src="resources/upload/${i.getPIMG()}" height="100%" class="d-block w-100" alt="패키지 이미지">
									<div class="container">
										<div class="carousel-caption text-end">
											<h1 class="PNAME">${i.getPNAME()}</h1>
											<p>
												<a class="btn btn-lg btn-primary" href="goPackageDetail?PNUMBER=${i.getPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}" target="_blank" role="button">보러가기</a>
											</p>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="carousel-item">
		      						<img src="resources/upload/${i.getPIMG()}" height="100%" class="d-block w-100" alt="패키지 이미지">
									<div class="container">
										<div class="carousel-caption text-end">
											<h1 class="PNAME">${i.getPNAME()}</h1>
											<p>
												<a class="btn btn-lg btn-primary" href="goPackageDetail?PNUMBER=${i.getPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}" target="_blank" role="button">보러가기</a>
											</p>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<a class="carousel-control-prev" href="#sameLikeOrderList" role="button" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</a>
				<a class="carousel-control-next" href="#sameLikeOrderList" role="button" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</a>
			</div>
		</c:if>
		
		<c:if test="${!empty sameOrderList}">
			<div id="sameOrderList" class="carousel carousel-dark slide h-25 mb-5" data-bs-ride="carousel">
				<h6>같은 상품을 구매 한 사람들이 가장 많이 구매한 상품</h6>
				<ol class="carousel-indicators">
					<c:forEach items="${sameOrderList}" var="i" varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0}">
								<li data-bs-target="#sameOrderList" data-bs-slide-to="${status.index}" class="active"></li>
							</c:when>
							<c:otherwise>
								<li data-bs-target="#sameOrderList" data-bs-slide-to="${status.index}"></li>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</ol>
				<div class="carousel-inner">
					<c:forEach items="${sameOrderList}" var="i" varStatus="status">
						<c:choose>
							<c:when test="${status.index == 0}">
								<div class="carousel-item active">
		      						<img src="resources/upload/${i.getPIMG()}" height="100%" class="d-block w-100" alt="패키지 이미지">
									<div class="container">
										<div class="carousel-caption text-end">
											<h1 class="PNAME">${i.getPNAME()}</h1>
											<p>
												<a class="btn btn-lg btn-primary" href="goPackageDetail?PNUMBER=${i.getPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}" target="_blank" role="button">보러가기</a>
											</p>
										</div>
									</div>
								</div>
							</c:when>
							<c:otherwise>
								<div class="carousel-item">
		      						<img src="resources/upload/${i.getPIMG()}" height="100%" class="d-block w-100" alt="패키지 이미지">
									<div class="container">
										<div class="carousel-caption text-end">
											<h1 class="PNAME">${i.getPNAME()}</h1>
											<p>
												<a class="btn btn-lg btn-primary" href="goPackageDetail?PNUMBER=${i.getPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}" target="_blank" role="button">보러가기</a>
											</p>
										</div>
									</div>
								</div>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</div>
				<a class="carousel-control-prev" href="#sameOrderList" role="button" data-bs-slide="prev">
					<span class="carousel-control-prev-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Previous</span>
				</a>
				<a class="carousel-control-next" href="#sameOrderList" role="button" data-bs-slide="next">
					<span class="carousel-control-next-icon" aria-hidden="true"></span>
					<span class="visually-hidden">Next</span>
				</a>
			</div>
		</c:if>
	</c:if>
	
	<div id="bestLikeList" class="carousel carousel-dark slide h-25 mb-5" data-bs-ride="carousel">
		<h6>좋아요가 많은 상품 목록</h6>
		<ol class="carousel-indicators">
			<c:forEach items="${bestLikeList}" var="i" varStatus="status">
				<c:choose>
					<c:when test="${status.index == 0}">
						<li data-bs-target="#bestLikeList" data-bs-slide-to="${status.index}" class="active"></li>
					</c:when>
					<c:otherwise>
						<li data-bs-target="#bestLikeList" data-bs-slide-to="${status.index}"></li>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</ol>
		<div class="carousel-inner">
			<c:forEach items="${bestLikeList}" var="i" varStatus="status">
				<c:choose>
					<c:when test="${status.index == 0}">
						<div class="carousel-item active">
	      					<img src="resources/upload/${i.getPIMG()}" height="100%" class="d-block w-100" alt="패키지 이미지">
							<div class="container">
								<div class="carousel-caption text-end">
									<h1 class="PNAME">${i.getPNAME()}</h1>
									<p>
										<a class="btn btn-lg btn-primary" href="goPackageDetail?PNUMBER=${i.getPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}" target="_blank" role="button">보러가기</a>
									</p>
								</div>
							</div>
						</div>
					</c:when>
					<c:otherwise>
						<div class="carousel-item">
	      					<img src="resources/upload/${i.getPIMG()}" height="100%" class="d-block w-100" alt="패키지 이미지">
							<div class="container">
								<div class="carousel-caption text-end">
									<h1 class="PNAME">${i.getPNAME()}</h1>
									<p>
										<a class="btn btn-lg btn-primary" href="goPackageDetail?PNUMBER=${i.getPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}" target="_blank" role="button">보러가기</a>
									</p>
								</div>
							</div>
						</div>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</div>
		<a class="carousel-control-prev" href="#bestLikeList" role="button" data-bs-slide="prev">
			<span class="carousel-control-prev-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Previous</span>
		</a>
		<a class="carousel-control-next" href="#bestLikeList" role="button" data-bs-slide="next">
			<span class="carousel-control-next-icon" aria-hidden="true"></span>
			<span class="visually-hidden">Next</span>
		</a>
	</div>
	
	<c:if test="${!empty ReviewPost}">
		<h6>후기 목록</h6>
		<div class="container-fluid justify-content-center">
			<div class="row row-cols-1 row-cols-md-5 g-4">
				<c:forEach items="${ReviewPost}" var="i">
					<c:choose>
						<c:when test="${i.getRPSTATE() == 1}">
							<div class="col">
								<div class="card">
									<img src="resources/upload/${i.getRPIMG()}" class="card-img-top" height="300" alt="패키지이미지">
									<div class="card-body">
										<h5 class="card-title">${i.getRPTITLE()}</h5>
										<a href="goReviewPostDetail?OPNUMBER=${i.getOPNUMBER()}&OMID=${i.getOMID()}&ODATE=${i.getODATE()}&nowPage=1&to=board&searchType=${search.getSearchType()}&keyWord=${search.getKeyWord()}" class="btn btn-primary">상세보기</a>
									</div>
								</div>
							</div>
						</c:when>
						<c:otherwise>
							<div class="col">
								<div class="card">
									<img src="resources/upload/0064359b-fd96-49e3-a57a-1ce0dcfe0a56.jpg" class="card-img-top" height="300" alt="패키지이미지">
									<div class="card-body">
										<h5 class="card-title">삭제된 게시글 입니다.</h5>
									</div>
								</div>
							</div>
						</c:otherwise>
					</c:choose>
				</c:forEach>
			</div>
		</div>
	</c:if>
	<%@ include file="PageUp.jsp" %>
</body>
<footer>
	<%@ include file="Footer.jsp"%>
</footer>
</html>
