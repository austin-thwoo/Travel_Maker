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
				<h1>LikeLIst</h1>
				<div class="row row-cols-1 row-cols-md-3 g-4 mb-3" id="packages">
					<c:forEach items="${likeList}" var="i" varStatus="status">
						<div class="col" id="package${status.index}">
							<div class="card">
								<img src="resources/upload/${i.getPIMG()}" class="card-img-top" alt="패키지이미지">
								<div class="card-body">
									<h5 class="card-title">${i.getPNAME() }</h5>
									<a href="#" class="btn btn-primary">상세보기</a>
									<button class="btn btn-primary" onclick="likeDelete('${sessionScope.loginInfo.getMID()}','${i.getPNUMBER()}', document.getElementById('packages'), document.getElementById('package${status.index}'))">좋아요 취소</button>
								</div>
							</div>
						</div>
					</c:forEach>
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
											<a class="page-link" href="likeList?MID=${sessionScope.loginInfo.getMID()}&nowPage=${page.getStartPage()-1}" aria-label="Previous">
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
												<a class="page-link" href="likeList?MID=${sessionScope.loginInfo.getMID()}&nowPage=${i}">${i}</a>							
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
											<a class="page-link" href="likeList?MID=${sessionScope.loginInfo.getMID()}&nowPage=${page.getEndPage()+1}" aria-label="Next">
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
<script type="text/javascript">
	function likeDelete(MID, PNUMBER, packages, packageIdx){
		$.ajax({
			url : "likeDelete",
			type : "post",
			data : {
				"PNUMBER" : PNUMBER,
				"MID" : MID
			},
			dataType : "Text",
			success : function(result){
				if(result == 1){
					packages.removeChild(packageIdx);
				}
			}
		});
	}
</script>
</html>
