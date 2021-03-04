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
				<%@ include file="../MyPageNav.jsp"%>
			</div>
			<div class="col">
				<h1>MyInfo</h1>
				<div class="row text-center">
					<div class="col">
						<svg class="bd-placeholder-img rounded-circle" width="100" height="100" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false">
		        			<rect width="100%" height="100%" style="fill: gray;"></rect>
		        			<a href="boardList?nowPage=1&BCNUMBER=0&to=member&MID=${sessionScope.loginInfo.getMID()}&order=BNUMBER" class="text-decoration-none"><text text-anchor="middle" alignment-baseline="middle" x="50%" y="50%" style="fill: white;">${myInfo.getBCOUNT()}</text></a>
		        		</svg>
						<h2>내 게시글</h2>
					</div>
					<div class="col">
						<svg class="bd-placeholder-img rounded-circle" width="100" height="100" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false">
		        			<rect width="100%" height="100%" style="fill: gray;"></rect>
		        			<a href="goMyCommentsList?MID=${sessionScope.loginInfo.getMID()}&nowPage=1" class="text-decoration-none"><text text-anchor="middle" alignment-baseline="middle" x="50%" y="50%" style="fill: white;">${myInfo.getCMCOUNT()}</text></a>
		        		</svg>
						<h2>내 댓글</h2>
					</div>
					<div class="col">
						<svg class="bd-placeholder-img rounded-circle" width="100" height="100" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false">
		        			<rect width="100%" height="100%" style="fill: gray;"></rect>
		        			<a href="goMyReviewList?MID=${sessionScope.loginInfo.getMID()}" class="text-decoration-none"><text text-anchor="middle" alignment-baseline="middle" x="50%" y="50%" style="fill: white;">${myInfo.getRVCOUNT()}</text></a>
		        		</svg>
						<h2>내 리뷰</h2>
					</div>
					<div class="col">
						<svg class="bd-placeholder-img rounded-circle" width="100" height="100" xmlns="http://www.w3.org/2000/svg" role="img" aria-label="Placeholder: 140x140" preserveAspectRatio="xMidYMid slice" focusable="false">
		        			<rect width="100%" height="100%" style="fill: gray;"></rect>
		        			<a href="goReviewPostList?to=member&NowPage=1&MID=${sessionScope.loginInfo.getMID()}" class="text-decoration-none"><text text-anchor="middle" alignment-baseline="middle" x="50%" y="50%" style="fill: white;">${myInfo.getRPCOUNT()}</text></a>
		        		</svg>
						<h2>내 여행후기</h2>
					</div>
				</div>
				<table class="table table-striped text-center">
					<tr>
						<th>이메일</th>
						<th>${myInfo.getMID()}</th>
					</tr>
					<tr>
						<th>이름</th>
						<th>${myInfo.getMNAME()}</th>
					</tr>
					<tr>
						<th>닉네임</th>
						<th>${myInfo.getMNICK()}</th>
					</tr>
					<tr>
						<th>전화번호</th>
						<th>${myInfo.getMPHONE()}</th>
					</tr>
					<tr>
						<th>성별</th>
						<th>${myInfo.getMGENDER()}</th>
					</tr>
					<tr>
						<th>생일</th>
						<th>${fn:substring(myInfo.getMBIRTH(),0,10)}</th>
					</tr>
					<tr>
						<th>잔여 포인트</th>
						<th><a href="goPointHistory?MID=${sessionScope.loginInfo.getMID()}&nowPage=1">${myInfo.getPOAMOUNT()}</a></th>
					</tr>
					<tr>
						<th>정지 횟수</th>
						<th>${myInfo.getABCOUNT()}</th>
					</tr>
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../PageUp.jsp" %>
</body>
<footer style="clear: both;">
	<%@ include file="../Footer.jsp" %>
</footer>
</html>
