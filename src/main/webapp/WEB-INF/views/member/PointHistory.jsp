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
			<div class="col">
				<h1>PointHistory</h1>
				<table class="table">
					<tr>
						<th>닉네임</th>
						<th>포인트 잔액</th>
					</tr>
					<tr>
						<td>${sessionScope.loginInfo.getMNICK()}</td>
						<td>
							<c:set var="sum" value="0"></c:set>
							<c:forEach  items="${pointHistory}" var="i">
								<c:set var="sum" value="${sum + i.getPOAMOUNT() * i.getPOSTATE()}"></c:set>
							</c:forEach>
							${sum}
						</td>
					</tr>
				</table>
				<h3>사용 내역</h3>
				<table class="table">
					<tr>
						<th>포인트 갱신</th>
						<th>내용</th>
						<th>금액</th>
					</tr>
					<c:forEach items="${pointHistory}" var="i">
						<c:choose>
							<c:when test="${i.getPOSTATE() eq 1}">
								<tr class="table-primary">
									<td>적립</td>
									<td>${i.getPOINFO()}</td>
									<td>${i.getPOAMOUNT() * i.getPOSTATE()}</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr class="table-danger">
									<td>사용</td>
									<td>${i.getPOINFO()}</td>
									<td>${i.getPOAMOUNT() * i.getPOSTATE()}</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</table>
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
											<a class="page-link" href="goPointHistory?MID=${sessionScope.loginInfo.getMID()}&nowPage=${page.getStartPage()-1}" aria-label="Previous">
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
												<a class="page-link" href="goPointHistory?MID=${sessionScope.loginInfo.getMID()}&nowPage=${i}">${i}</a>							
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
											<a class="page-link" href="goPointHistory?MID=${sessionScope.loginInfo.getMID()}&nowPage=${page.getEndPage()+1}" aria-label="Next">
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
