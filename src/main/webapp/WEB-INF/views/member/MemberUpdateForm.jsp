<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
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
		<%@ include file="../MainNav.jsp" %>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-3">
				<%@ include file="../MyPageNav.jsp" %>
			</div>
			<div class="row col container justify-content-start">
				<div class="col-6">
					<form action="memberUpdate" method="POST">
						<label for="MEMAIL" class="form-label">이메일</label>
						<div class="input-group">
							<input type="email" class="form-control" id="MID" name="MID" value="${memberInfo.getMID()}" readonly="readonly">
						</div>
									
						<label for="MNAME" class="form-label">이름</label>
						<div class="input-group">
							<input type="text" class="form-control" id="MNAME" value="${memberInfo.getMNAME()}" readonly="readonly">
						</div>
									
						<label for="MGENDER" class="form-label">성별</label>
						<div class="input-group">
							<input type="text" class="form-control" id="MGENDER" value="${memberInfo.getMGENDER()}" readonly="readonly">
						</div>
									
						<label for="MBIRTH" class="form-label">생년월일</label>
						<div class="input-group">
							<input type="date" class="form-control" id="MBIRTH" value="${fn:substring(memberInfo.getMBIRTH(),0,10)}" readonly="readonly">
						</div>
									
						<label for="MNICK" class="form-label">닉네임</label>
						<div class="input-group">
							<input type="text" class="form-control" id="MNICK" name="MNICK" value="${memberInfo.getMNICK()}" required="required">
						</div>
									
						<label for="MPHONE" class="form-label">전화번호</label>
						<div class="input-group">
							<input type="text" class="form-control" id="MPHONE" name="MPHONE" value="${memberInfo.getMPHONE()}" required="required">
						</div>
				
						<div class="mt-3 text-center">
							<input type="hidden" name="to" value="${to}">
							<button type="submit" class="btn btn-primary btn-md">수정</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../PageUp.jsp" %>
</body>
<footer>
	<%@ include file="../Footer.jsp"%>
</footer>
</html>
