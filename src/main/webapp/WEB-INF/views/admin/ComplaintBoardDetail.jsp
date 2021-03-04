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
	<div class="container">
		<div class="row">
			<div class="col justify-content-center text-start">
				<h1>게시글 신고 상세내용</h1>
				<table class="table table-hover text-center">
					<thead>
						<tr class="table-secondary">
							<th>게시글 작성자</th>
							<th>신고자</th>
							<th>신고이유</th>
							<th>신고날짜</th>
						</tr>
					</thead>
					<c:forEach items="${complaintBoardDetail}" var="i">
						<tr>
							<td>${i.getMNICK()}</td>
							<td>${i.getBCMNICK()}</td>
							<td>${i.getBCREASON()}</td>
							<td>${fn:substring(i.getBCDATE(),0,10)}</td>
						</tr>
					</c:forEach>
				</table>
				<button class="btn btn-primary btn-sm" type="button" onClick="WinClose()">확인</button>
			</div>
		</div>
	</div>
</body>
<footer>
	<%@ include file="../Footer.jsp"%>
</footer>
<script>
	function WinClose() {
		window.open('', '_self').close();
	}
</script>
</html>