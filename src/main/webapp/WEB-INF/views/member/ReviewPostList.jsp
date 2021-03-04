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
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../Header.jsp"%>
	<div class="my-1">
		<%@ include file="../MainNav.jsp"%>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-3">
				<%@ include file="../MyPageNav.jsp" %>
			</div>
			<div class="col container">
				<h1>Review Post LIst</h1>
				<div class="row row-cols-1 row-cols-md-3 g-4 mb-3">
					<c:choose>
						<c:when test="${sessionScope.loginInfo.getMLEVEL() == 0}">
							<c:forEach items="${reviewPostList}" var="i">
								<div class="col">
									<div class="card">
										<img src="resources/upload/${i.getRPIMG()}" class="card-img-top" height="300" alt="패키지이미지">
										<div class="card-body">
											<h5 class="card-title">${i.getRPTITLE()}</h5>
											<a href="goReviewPostDetail?OPNUMBER=${i.getOPNUMBER()}&OMID=${i.getOMID()}&ODATE=${i.getODATE()}&nowPage=${page.getNowPage()}&to=${to}&searchType=${searchReviewPost.getSearchType()}&keyWord=${searchReviewPost.getKeyWord()}" class="btn btn-primary">상세보기</a>
										</div>
									</div>
								</div>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<c:forEach items="${reviewPostList}" var="i">
								<c:choose>
									<c:when test="${i.getRPSTATE() == 1}">
										<div class="col">
											<div class="card">
												<img src="resources/upload/${i.getRPIMG()}" class="card-img-top" height="300" alt="패키지이미지">
												<div class="card-body">
													<h5 class="card-title">${i.getRPTITLE()}</h5>
													<a href="goReviewPostDetail?OPNUMBER=${i.getOPNUMBER()}&OMID=${i.getOMID()}&ODATE=${i.getODATE()}&nowPage=${page.getNowPage()}&to=${to}&searchType=${searchReviewPost.getSearchType()}&keyWord=${searchReviewPost.getKeyWord()}" class="btn btn-primary">상세보기</a>
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
						</c:otherwise>
					</c:choose>
				</div>
				
				<form action="goReviewPostList">
					<div class="row container-fluid mb-1">
						<div class="input-group">
							<c:choose>
								<c:when test="${!empty searchReviewPost}">
									<select class="form-select-sm rounded-start" name="searchType" id="button-addon2">
										<c:choose>
											<c:when test="${searchReviewPost.getSearchType() eq 'all'}">
												<option value="all" selected>전체</option>
											</c:when>
											<c:otherwise>
												<option value="all">전체</option>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${searchReviewPost.getSearchType() eq 'RPTITLE'}">
												<option value="RPTITLE" selected>제목</option>
											</c:when>
											<c:otherwise>
												<option value="RPTITLE">제목</option>
											</c:otherwise>
										</c:choose>
										<c:choose>
											<c:when test="${searchReviewPost.getSearchType() eq 'RPCONTENT'}">
												<option value="RPCONTENT" selected>내용</option>
											</c:when>
											<c:otherwise>
												<option value="RPCONTENT">내용</option>
											</c:otherwise>
										</c:choose>
									</select>
									<input type="text" name="keyWord" class="form-control" aria-describedby="button-addon2" value="${searchReviewPost.getKeyWord()}">
								</c:when>
								<c:otherwise>
									<select class="form-select-sm rounded-start" name="searchType" id="button-addon2">
										<option value="all" selected>전체</option>
										<option value="RPTITLE">제목</option>
										<option value="RPCONTENT">내용</option>
									</select>
									<input type="text" name="keyWord" class="form-control" aria-describedby="button-addon2">
								</c:otherwise>
							</c:choose>
							<input type="hidden" name="nowPage" value="1">
							<input type="hidden" name="to" value="searchM">
							<input type="hidden" name="MID" value="${sessionScope.loginInfo.getMID()}">
							<button id="button-addon2" type="submit" class="btn btn-outline-primary">검색</button>
						</div>
					</div>
				</form>
				
				<div class="row container-fluid">
					<div class="d-flex justify-content-center">
						<nav aria-label="Page navigation example">
						  <ul class="pagination">
								<c:choose>
									<c:when test="${page.getStartPage() eq 1}">
										<li class="page-item disabled">
											<a class="page-link" href="#" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a class="page-link" href="goReviewPostList?NowPage=${page.getStartPage() - 1}&MID=${sessionScope.loginInfo.getMID()}&to=${to}&searchType=${searchReviewPost.getSearchType()}&keyWord=${searchReviewPost.getKeyWord()}" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
								<c:forEach var="i" begin="${page.getStartPage()}" end="${page.getEndPage()}" step="1">
									<c:choose>
										<c:when test="${i eq page.getNowPage()}">
											<li class="page-item disabled">
												<a class="page-link" href="#">${i}</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item">
												<a class="page-link" href="goReviewPostList?NowPage=${i}&MID=${sessionScope.loginInfo.getMID()}&to=${to}&searchType=${searchReviewPost.getSearchType()}&keyWord=${searchReviewPost.getKeyWord()}">${i}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${page.getEndPage() eq page.getLastPage()}">
										<li class="page-item disabled">
											<a class="page-link disabled" href="#" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a class="page-link" href="goReviewPostList?NowPage=${page.getEndPage() + 1}&MID=${sessionScope.loginInfo.getMID()}&to=${to}&searchType=${searchReviewPost.getSearchType()}&keyWord=${searchReviewPost.getKeyWord()}" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../PageUp.jsp"%>
</body>
<footer>
	<%@ include file="../Footer.jsp"%>
</footer>
</html>
