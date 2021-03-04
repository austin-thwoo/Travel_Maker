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
				<h2>장바구니 목록</h2>
				<table class="table table-striped">
					<tr>
						<td>이미지</td>
						<td>상품명</td>
						<td>여행기간</td>
						<td>결제</td>
						<td>삭제</td>
					</tr>
					<c:forEach items="${cartList}" var="i">
						<tr>
							<td>
								<img src="resources/upload/${i.getPIMG()}" id="cartimage" width="230"alt="패키지이미지" />
							</td>
							<td><a href="goPackageDetail?PNUMBER=${i.getPNUMBER()}">${i.getPNAME()}</a></td>
							<td>${fn:substring(i.getPSSTART(),0,10)} - ${fn:substring(i.getPSEND(),0,10)}</td>
							<td>
								<button class="btn btn-primary btn-sm" onclick="goSaleForm('${sessionScope.loginInfo.getMID()}', '${i.getPNUMBER()}', '${i.getPSSTART()}')">결제하러가기</button>
							</td>
							<td>
								<button class="btn btn-primary btn-sm" onclick="cartDelete('${sessionScope.loginInfo.getMID()}', '${i.getPNUMBER()}', '${i.getPSSTART()}')">삭제</button>
							</td>
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
											<a class="page-link" href="goCartList?MID=${sessionScope.loginInfo.getMID()}&nowPage=${page.getStartPage()-1}" aria-label="Previous">
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
												<a class="page-link" href="goCartList?MID=${sessionScope.loginInfo.getMID()}&nowPage=${i}">${i}</a>							
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
											<a class="page-link" href="goCartList?MID=${sessionScope.loginInfo.getMID()}&nowPage=${page.getEndPage()+1}" aria-label="Next">
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
	function goSaleForm(MID, PNUMBER, PSSTART){
		location.href = "goSaleForm?MID="+MID+"&PNUMBER="+PNUMBER+"&PSSTART="+PSSTART;
	}

	function cartDelete(MID, PNUMBER, PSSTART){
		$.ajax({
			url : "cartDelete",
			type : "post",
			data : {
				"MID" : MID,
				"PNUMBER" : PNUMBER,
				"PSSTART" : PSSTART
			},
			dataType : "Text",
			success : function(result){
				if (result == 1) {
					location.href = "goCartList?MID="+MID+"&nowPage=${page.getNowPage()}";
				}
			}
		});
	}
</script>
</html>