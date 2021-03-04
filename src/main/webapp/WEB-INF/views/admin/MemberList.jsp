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
				<%@ include file="../AdminNav.jsp"%>
			</div>
			<div class="col">
				<h1>MemberList</h1>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>아이디</th>
							<th>닉네임</th>
							<th>이름</th>
							<th>연락처</th>
							<th>성별</th>
							<th>상태</th>
							<th>포인트</th>
							<th>신고 게시글</th>
							<th>신고  댓글</th>
							<th>정지 횟수</th>
							<th>정지</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberList}" var="i">
							<tr>
								<td><a href="myPage?MID=${i.getMID()}&to=admin">${i.getMID()}</a></td>
								<td>${i.getMNICK()}</td>
								<td>${i.getMNAME()}</td>
								<td>${i.getMPHONE()}</td>
								<td>
									<c:choose>
										<c:when test="${i.getMGENDER() eq 'M'}">
											남
										</c:when>
										<c:when test="${i.getMGENDER() eq 'F'}">
											여
										</c:when>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${i.getMSTATE() == 1}">
											활동
										</c:when>
										<c:when test="${i.getMSTATE() == -1}">
											정지
										</c:when>
									</c:choose>
								</td>
								<td>${i.getPOAMOUNT()}P</td>
								<td>
									<c:choose>
										<c:when test="${i.getBOARDCOMPLAINT() > 0}">
											<a href="goComplaintBoardList?nowPage=1&MID=${i.getMID()}">${i.getBOARDCOMPLAINT()}</a>
										</c:when>
										<c:otherwise>
											${i.getBOARDCOMPLAINT()}
										</c:otherwise>
									</c:choose>
								</td>
								<td>
									<c:choose>
										<c:when test="${i.getCOMMENTSCOMPLAINT() > 0}">
											<a href="goComplaintCommentsList?nowPage=1&MID=${i.getMID()}">${i.getCOMMENTSCOMPLAINT()}</a>
										</c:when>
										<c:otherwise>
											${i.getCOMMENTSCOMPLAINT()}
										</c:otherwise>
									</c:choose>
								</td>
								<td>${i.getACCOUNTBAN()}</td>
								<td>
									<div class="btn-group-vertical">
										<button class="btn btn-outline-primary btn-sm" onclick="goPointInsertForm('${i.getMID()}')">포인트 지급</button>
										<c:choose>
											<c:when test="${i.getMSTATE() == 1}">
												<button class="btn btn-outline-primary btn-sm" onclick="memberStateUpdate('${i.getMID()}', '${i.getMSTATE()}')">정지</button>
											</c:when>
											<c:when test="${i.getMSTATE() == -1}">
												<button class="btn btn-outline-primary btn-sm" onclick="memberStateUpdate('${i.getMID()}', '${i.getMSTATE()}')">복구</button>
											</c:when>
										</c:choose>
									</div>
								</td>
							</tr>
						</c:forEach>
					</tbody>
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
											<a class="page-link" href="goMemberList?MLEVEL=${MLEVEL}&nowPage=${page.getStartPage() - 1}&MID=${sessionScope.loginInfo.getMID()}" aria-label="Previous">
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
												<a class="page-link" href="goMemberList?MLEVEL=${MLEVEL}&nowPage=${i}&MID=${sessionScope.loginInfo.getMID()}">${i}</a>
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
											<a class="page-link" href="goMemberList?MLEVEL=${MLEVEL}&nowPage=${page.getEndPage() + 1}&MID=${sessionScope.loginInfo.getMID()}" aria-label="Next">
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
	<%@ include file="../PageUp.jsp" %>
</body>
<footer>
	<%@ include file="../Footer.jsp" %>
</footer>
<script type="text/javascript">
	function memberStateUpdate(MID, MSTATE){
		location.href = "memberStateUpdate?MID="+MID+"&MSTATE="+(MSTATE*-1)+"&MLEVEL="+${MLEVEL};
	}
	function goPointInsertForm(MID){
		window.open("goPointInsertForm?MID="+MID+"&MLEVEL="+${MLEVEL}+"&nowPage="+${page.getNowPage()}, "_blank", "menubar=0, scrollbars=1, status=0, titlebar=0, toolbar=0, left=30, top=30, width=700, height=500");
	}
</script>
</html>