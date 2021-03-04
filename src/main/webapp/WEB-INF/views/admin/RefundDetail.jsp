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
				<h1>주문 상세내용</h1>
				<table class="table table-hover text-center">
					<thead>
						<tr class="table-secondary">
							<th>신청인</th>
							<th>상품 번호</th>
							<th>성인</th>
							<th>아동</th>
							<th>유아</th>
							<th>결제 금액</th>
							<th>결제 일자</th>
							<th>여행 기간</th>
							<c:if test="${refundDetail.getOSTATE() eq -2}">
								<th>환불</th>
							</c:if>
						</tr>
					</thead>
					<tr>
						<td>${refundDetail.getMNICK()}</td>
						<td>${refundDetail.getPNUMBER()}</td>
						<td>${refundDetail.getOADULT()} 인</td>
						<td>${refundDetail.getOCHILD()} 인</td>
						<td>${refundDetail.getOINFANT()} 인</td>
						<td>${refundDetail.getOAMOUNT()} 원</td>
						<td>${fn:substring(refundDetail.getODATE(),0,10)}</td>
						<td>${fn:substring(refundDetail.getPSSTART(),0,10)} ~ ${fn:substring(refundDetail.getPSEND(),0,10)}</td>
						<c:if test="${refundDetail.getOSTATE() eq -2}">
							<td>
								<button class="btn btn-primary btn-sm" onClick="cancelPay()">환불페이지</button>
							</td>
						</c:if>
					</tr>
				</table>
				<div class="text-end">
					<c:if test="${refundDetail.getOSTATE() eq -2}">
						<button class="btn btn-primary btn-sm" onClick="refundUpdate('${refundDetail.getMID()}','${refundDetail.getPNUMBER()}','${refundDetail.getODATE()}')">환불완료</button>
					</c:if>
					<button class="btn btn-primary btn-sm" type="button" onClick="WinClose()">확인</button>
				</div>
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
	
	function cancelPay() {
		window.open("https://admin.iamport.kr/payments");
	}
	
	function refundUpdate(MID, PNUMBER, ODATE) {
		console.log(MID);
		opener.location.href = "refundUpdate?MID=" + MID + "&PNUMBER=" + PNUMBER + "&ODATE=" + ODATE + "&OSTATE=-1";
		window.close();
	}
</script>
</html>