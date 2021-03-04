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
	<%@ include file="../Header.jsp" %>
	<div class="my-1">
		<%@ include file="../MainNav.jsp" %>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-3">
				<%@ include file="../AdminNav.jsp" %>
			</div>
			<div class="col justify-content-center">
				<form action="" name="travelerListForm" method="POST">
					<div class="row">
						<div class="col text-start">
							<h1>여행객 목록</h1>
						</div>
						<div class="col text-end">
							<div class="row">
						 		<div class="col text-end">
						 			<a href="#" onclick="exportExcel()" class="text-decoration-none">
										<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="black" class="bi bi-file-earmark-excel-fill" viewBox="0 0 16 16">
											<path d="M9.293 0H4a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h8a2 2 0 0 0 2-2V4.707A1 1 0 0 0 13.707 4L10 .293A1 1 0 0 0 9.293 0zM9.5 3.5v-2l3 3h-2a1 1 0 0 1-1-1zM5.884 6.68L8 9.219l2.116-2.54a.5.5 0 1 1 .768.641L8.651 10l2.233 2.68a.5.5 0 0 1-.768.64L8 10.781l-2.116 2.54a.5.5 0 0 1-.768-.641L7.349 10 5.116 7.32a.5.5 0 1 1 .768-.64z" />
										</svg>
									</a>
						 			<a href="#" id="print" class="text-decoration-none">
										<svg xmlns="http://www.w3.org/2000/svg" width="40" height="40" fill="black" class="bi bi-printer" viewBox="0 0 16 16">
											<path d="M2.5 8a.5.5 0 1 0 0-1 .5.5 0 0 0 0 1z" /> 
											<path d="M5 1a2 2 0 0 0-2 2v2H2a2 2 0 0 0-2 2v3a2 2 0 0 0 2 2h1v1a2 2 0 0 0 2 2h6a2 2 0 0 0 2-2v-1h1a2 2 0 0 0 2-2V7a2 2 0 0 0-2-2h-1V3a2 2 0 0 0-2-2H5zM4 3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1v2H4V3zm1 5a2 2 0 0 0-2 2v1H2a1 1 0 0 1-1-1V7a1 1 0 0 1 1-1h12a1 1 0 0 1 1 1v3a1 1 0 0 1-1 1h-1v-1a2 2 0 0 0-2-2H5zm7 2v3a1 1 0 0 1-1 1H5a1 1 0 0 1-1-1v-3a1 1 0 0 1 1-1h6a1 1 0 0 1 1 1z" />
										</svg>
									</a>
						 		</div>
						 	</div>
						</div>
					</div>
					<c:forEach items="${travelerList}" var="i" varStatus="status">
						<input type="hidden" name="travelerList[${status.index}].PNAME" value="${i.getPNAME()}">
						<input type="hidden" name="travelerList[${status.index}].OPNUMBER" value="${i.getOPNUMBER()}">
						<input type="hidden" name="travelerList[${status.index}].ODATE" value="${i.getODATE()}">
						<input type="hidden" name="travelerList[${status.index}].TNAME" value="${i.getTNAME()}">
						<input type="hidden" name="travelerList[${status.index}].TBIRTH" value="${i.getTBIRTH()}">
						<input type="hidden" name="travelerList[${status.index}].TEMAIL" value="${i.getTEMAIL()}">
						<input type="hidden" name="travelerList[${status.index}].TPHONE" value="${i.getTPHONE()}">
						<input type="hidden" name="travelerList[${status.index}].TENNAME" value="${i.getTENNAME()}">
						<input type="hidden" name="travelerList[${status.index}].PSSTART" value="${i.getPSSTART()}">
						<input type="hidden" name="travelerList[${status.index}].PSEND" value="${i.getPSEND()}">
					</c:forEach>
					<input type="hidden" name="nowPage" value="${page.getNowPage()}">
				</form>
				<div id="printArea">
					<table class="table table-striped text-center">
						<tr>
							<th>패키지 넘버</th>
							<th>상품명</th>
							<th>여행기간</th>
							<th>이름</th>
							<th>영문이름</th>
							<th>생년월일</th>
							<th>이메일</th>
							<th>연락처</th>
						</tr>
						<c:forEach items="${travelerList}" var="i">
							<tr>
								<td>${i.getOPNUMBER()}</td>
								<td><a href="goPackageDetail?PNUMBER=${i.getPNUMBER()}">${i.getPNAME()}</a></td>
								<td>${fn:substring(i.getPSSTART(),0,10)} ~ ${fn:substring(i.getPSEND(),0,10)}</td>
								<td>${i.getTNAME()}</td>
								<td>${i.getTENNAME()}</td>
								<td>${fn:substring(i.getTBIRTH(),0,10)}</td>
								<td>${i.getTEMAIL()}</td>
								<td>${i.getTPHONE()}</td>
							</tr>
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
												<a class="page-link" href="goTravelerList?nowPage=${page.getStartPage()-1}" aria-label="Previous">
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
													<a class="page-link" href="goTravelerList?nowPage=${i}">${i}</a>							
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
												<a class="page-link" href="goTravelerList?nowPage=${page.getEndPage()+1}" aria-label="Next">
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
	</div>
	<%@ include file="../PageUp.jsp" %>
</body>
<footer>
	<%@ include file="../Footer.jsp" %>
</footer>
<script type="text/javascript">
	function exportExcel(){
		travelerListForm.action = "exportExcel";
		travelerListForm.submit();
	}
	
	$("#print").on("click", function(){
		var _body = document.body.innerHTML;
		
		window.onbeforeprint = function () {
			document.body.innerHTML = document.getElementById("printArea").innerHTML;
		}
		
		window.onafterprint = function () {
			document.body.innerHTML = _body;
		}
		
		window.print();  // 버튼클릭시 인쇄화면
	 });
</script>
</html>