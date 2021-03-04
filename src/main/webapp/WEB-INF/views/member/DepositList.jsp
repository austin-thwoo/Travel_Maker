<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
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
			<div class="col container-fluid">
				<h2>계약금 완료 목록</h2>
				<form method="post">
					<table class="table">
						<thead>
							<tr>
						    	<th>상품사진</th>
						     	<th>상품정보</th>
						     	<th class="text-end">상품 메뉴</th>
						   	</tr>
						</thead>
						<tbody>
							<c:forEach items="${shoppingList}" var="i">
								<tr>
									<th><img alt="상품 이미지" src="resources/upload/${i.getPIMG()}" width="230"></th>
								    <th> 	
								      	<table class="table table-borderless">
											<tr>
												<th>상품명</th>
												<td><a href="goPackageDetail?PNUMBER=${i.getPNUMBER()}">${i.getPNAME()}</a></td>
											</tr>
								      		<tr>
								      			<th>기간</th>
								      			<td>${fn:substring(i.getPSSTART(),0,10)} ~ ${fn:substring(i.getPSEND(),0,10)}</td>
								      		</tr>
								      		<tr>
								      			<th>지역</th>
								      			<td>${i.getPLONAME()}</td>
								      		</tr>
								      		<tr>
								      			<th>잔금</th>
								      			<td>${i.getBALANCE()} 원</td>
								      		</tr>
								      		<tr>
								      			<th>인원</th>
								      			<td>${i.getOADULT() + i.getOCHILD() + i.getOINFANT()}명</td>
								      		</tr>
								      	</table>
									</th>
									<td>
										<button class="btn btn-primary btn-sm" onclick="balanceUpdate('${sessionScope.loginInfo.getMID()}', '${i.getPNAME()}', '${i.getBALANCE()}', '${memberInfo.getMNAME()}', '${i.getODATE()}', '${i.getPNUMBER()}')">잔금결제하기</button>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</form>
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
											<a class="page-link" href="goShoppingList?MID=${sessionScope.loginInfo.getMID()}&OSTATE=1&nowPage=${page.getStartPage()-1}" aria-label="Previous">
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
												<a class="page-link" href="goShoppingList?MID=${sessionScope.loginInfo.getMID()}&OSTATE=1&nowPage=${i}">${i}</a>							
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
											<a class="page-link" href="goShoppingList?MID=${sessionScope.loginInfo.getMID()}&OSTATE=1&nowPage=${page.getEndPage()+1}" aria-label="Next">
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
	function balanceUpdate(MID, PNAME, OAMOUNT, MNAME, ODATE, PNUMBER){
		var to = "goPayApi?MID="+MID+"&OAMOUNT="+OAMOUNT+"&PNAME="+PNAME+"&MNAME="+MNAME+"&ODATE="+ODATE+"&PNUMBER="+PNUMBER+"&pay=2";
		window.open(to, "_blank", "menubar=0, scrollbars=1, status=0, titlebar=0, toolbar=0, left=30, top=30, width=900, height=600");
	}
</script>
</html>