<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<jsp:useBean id="sysdate" class="java.util.Date" />
<fmt:formatDate value='${sysdate}' pattern='yyyy-MM-dd' var="sysdate"/>
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
				<h2>쇼핑 리스트</h2>		
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
									<td><a href="goPackageDetail?PNUMBER=${i.getPNUMBER()}" target="_blank">${i.getPNAME()}</a></td>
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
					      			<th>가격</th>
					      			<td>${i.getOAMOUNT()} 원</td>
					      		</tr>
					      		<tr>
					      			<th>인원</th>
					      			<td>${i.getOADULT() + i.getOCHILD() + i.getOINFANT()}명</td>
					      		</tr>
					      	</table>
						  </th>
					      <td class="text-end">
					      	<div class="btn-group-vertical">
					      		<c:choose>
						      		<c:when test="${i.getOSTATE() eq 2}">
										<c:choose>
											<c:when test="${i.getPSSTART() < sysdate}">
												<c:if test="${i.getREVIEWPOST() == 0}">
													<button class="btn btn-outline-primary btn-sm" onclick="goReviewPostInsertForm('${i.getPNUMBER()}', '${i.getMID()}', '${i.getODATE()}')">후기 글 쓰러가기</button>
												</c:if>
												<c:if test="${i.getREVIEW() == 0}">
													<a class="btn btn-outline-primary btn-sm" href="goPackageDetail?PNUMBER=${i.getPNUMBER()}&MID=${sessionScope.loginInfo.getMID()}">리뷰 쓰러가기</a>
												</c:if>
											</c:when>
											<c:when test="${i.getPSSTART() > sysdate}">
												<button class="btn btn-outline-primary btn-sm" onclick="refundRequest('${i.getPNUMBER()}', '${i.getMID()}', '${i.getODATE()}')">환불하기</button>
											</c:when>
										</c:choose>
						      		</c:when>
						      		<c:when test="${i.getOSTATE() eq -2}">
						      			환불 처리 중
						      		</c:when>
						      		<c:when test="${i.getOSTATE() eq -1}">
						      			환불 완료
						      		</c:when>
								</c:choose>
						      	<a href="goPackageDetail?PNUMBER=${i.getPNUMBER()}" target="_blank" class="btn btn-outline-primary btn-sm">상품 상세보기</a>
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
											<a class="page-link" href="goShoppingList?MID=${sessionScope.loginInfo.getMID()}&OSTATE=0&nowPage=${page.getStartPage()-1}" aria-label="Previous">
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
												<a class="page-link" href="goShoppingList?MID=${sessionScope.loginInfo.getMID()}&OSTATE=0&nowPage=${i}">${i}</a>							
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
											<a class="page-link" href="goShoppingList?MID=${sessionScope.loginInfo.getMID()}&OSTATE=0&nowPage=${page.getEndPage()+1}" aria-label="Next">
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
	<%@ include file="../Footer.jsp"%>
</footer>
<script type="text/javascript">
	function goReviewPostInsertForm(PNUMBER, MID, ODATE){
		location.href = "goReviewPostInsertForm?PNUMBER="+PNUMBER+"&MID="+MID+"&ODATE="+ODATE;
	}
	
	function refundRequest(PNUMBER, MID, ODATE){
		location.href = "refundUpdate?MID=" + MID + "&PNUMBER=" + PNUMBER + "&ODATE=" + ODATE + "&OSTATE=-2";
	}
</script>
</html>








