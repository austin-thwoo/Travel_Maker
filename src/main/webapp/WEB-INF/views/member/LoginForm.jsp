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
	<div class="row container-fluid justify-content-center">
		<div class="col-md-4 text-center">
			<form action="login" method="POST">
				<h1>LogIn</h1>
				<div class="container-fluid text-start">
					<label class="form-label" for="MID">Email</label>
					<div class="input-group">
						<input class="form-control" type="text" id="MID" name="MID" required="required">
					</div>
					
					<label class="form-label" for="MPW">비밀번호</label>
					<div class="input-group mb-1">
						<input class="form-control" type="password" id="MPW" name="MPW" required="required">
					</div>
					
					<div class="text-center mb-1 mt-3">
						<button class="btn btn-primary btn-md" type="submit">LogIn</button>
					</div>
					
					<div class="text-center mb-2">
						<a href="goIdSearchForm">아이디 찾기</a>
						<a href="goPasswordSearch">비밀번호 찾기</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../PageUp.jsp" %>
</body>
<footer>
	<%@ include file="../Footer.jsp" %>
</footer>
</html>
