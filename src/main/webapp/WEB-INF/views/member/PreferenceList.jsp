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
	<%@ include file="../Header.jsp" %>
	<div class="my-1">
		<%@ include file="../MainNav.jsp" %>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-3">
				<%@ include file="../MyPageNav.jsp" %>
			</div>
			<div class="col-6 justify-content-center text-start">
				<c:if test="${!empty otherCategoryList}">
					<h1>카테고리 목록</h1>
					<form action="preferenceInsert" method="GET">
						<div class="list-group">
							<c:forEach items="${otherCategoryList}" var="i" varStatus="status">
								<label class="list-group-item">
									<input class="form-check-input me-1" type="checkbox" name="CNUMBER" value="${i.getCNUMBER()}">${i.getCNAME()}
								</label>
							</c:forEach>
						</div>
						<div class="mt-1 text-end">
							<input type="hidden" name="MID" value="${sessionScope.loginInfo.getMID()}">
							<input type="hidden" name="state" value="2">
							<button class="btn btn-primary btn-md" type="submit">추가</button>
						</div>
					</form>
				</c:if>
				<c:if test="${!empty preferenceList}">
					<h1>선호 카테고리 목록</h1>
					<form action="preferenceDelete" method="GET">
						<div class="list-group">
							<c:forEach items="${preferenceList}" var="i" varStatus="status">
								<label class="list-group-item">
									<input class="form-check-input me-1" type="checkbox" name="CNUMBER" value="${i.getCNUMBER()}">${i.getCNAME()}
								</label>
							</c:forEach>
						</div>
						<div class="mt-1 text-end">
							<input type="hidden" name="MID" value="${sessionScope.loginInfo.getMID()}">
							<button class="btn btn-primary btn-md" type="submit">삭제</button>
						</div>
					</form>
				</c:if>
			</div>
		</div>
	</div>
	<%@ include file="../PageUp.jsp" %>
</body>
<footer>
	<%@ include file="../Footer.jsp" %>
</footer>
</html>