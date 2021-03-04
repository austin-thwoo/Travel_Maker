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
	<div class="justify-content-center text-center mb-3">
		<div class="container">
			<div class="row row-cols-1 row-cols-md-3 g-4">
				<c:forEach items="${packageList}" var="i">
					<div class="col">
						<div class="card">
							<img src="resources/upload/${i.getPIMG()}" class="card-img-top" height="300" alt="패키지이미지">
							<div class="card-body">
								<h5 class="card-title">${i.getPNAME()}</h5>
								<p class="card-text">${i.getPINFO()}</p>
								<a href="goPackageDetail?PNUMBER=${i.getPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}" target="_blank" class="btn btn-primary">상세보기</a>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	
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
									<a class="page-link" href="goPackageList?to=${to}&nowPage=${page.getStartPage() - 1}&searchType=${search.getSearchType()}&keyWord=${search.getKeyWord()}" aria-label="Previous">
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
										<a class="page-link" href="goPackageList?to=${to}&nowPage=${i}&searchType=${search.getSearchType()}&keyWord=${search.getKeyWord()}">${i}</a>
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
									<a class="page-link" href="goPackageList?to=${to}&nowPage=${page.getEndPage() + 1}&searchType=${search.getSearchType()}&keyWord=${search.getKeyWord()}" aria-label="Next">
										<span aria-hidden="true">&raquo;</span>
									</a>
								</li>
							</c:otherwise>
						</c:choose>
					</ul>
				</nav>
			</div>
		</div>
	<%@ include file="../PageUp.jsp"%>
</body>
<footer>
	<%@ include file="../Footer.jsp"%>
</footer>
</html>