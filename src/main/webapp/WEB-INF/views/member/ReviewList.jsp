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
		<%@ include file="../MainNav.jsp"%>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-3">
				<%@ include file="../MyPageNav.jsp" %>
			</div>
			<div class="col">
				<h1>ReviewList</h1>
				<table class="table table-hover text-center">
					<thead>
						<tr class="table-secondary">
							<th>패키지 번호</th>
							<th>패키지 이름</th>	
							<th>작성자</th>
							<th>리뷰별점</th>
							<th>리뷰내용</th>
							<th>리뷰작성일</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${reviewList}" var="i">				
							<tr>
								<td>${i.getOPNUMBER()}</td>
								<td><a href="goPackageDetail?PNUMBER=${i.getOPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}">${i.getPNAME()}</a></td>
								<td>${i.getMNICK()}</td>
								<td>${i.getRVSCORE()}</td>
								<td>${i.getRVCONTENT()}</td>
								<td>${fn:substring(i.getRVDATE(),5,16)}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../PageUp.jsp" %>
</body>
<footer>
	<%@ include file="../Footer.jsp"%>
</footer>
</html>
