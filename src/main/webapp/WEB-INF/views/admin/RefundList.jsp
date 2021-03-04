<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
				<%@ include file="../AdminNav.jsp" %>
			</div>
			<div class="col justify-content-center">
				<h1>환불 신청 목록</h1>
				<table class="table table-hover text-center">		
					<tr>
						<th>처리상태</th>
					 	<th>신청인</th>
					 	<th>결제 금액</th>
					 	<th></th>
					</tr>
					<c:forEach items="${refundList}" var="i">
						<c:if test="${i.getOSTATE() eq -2}">
							<tr>
								<th>처리대기</th>			 	
							 	<th>${i.getMNICK()}</th>
							 	<th>${i.getOAMOUNT()}</th>				 	
							 	<th>
							 		<button class="btn btn-primary btn-sm" 	onclick="refundDetail('${i.getMID()}','${i.getPNUMBER()}','${i.getODATE()}')">상세보기</button>
							 	</th>
							</tr>
						</c:if>
					</c:forEach>		 
				</table>
			</div>
			<div class="col justify-content-center">
				<h1>환불 완료 목록</h1>
				<table class="table table-hover text-center">		
					<tr>
						<th>처리상태</th>
					 	<th>신청인</th>
					 	<th>결제 금액</th>
					 	<th></th>
					</tr>
					<c:forEach items="${refundList}" var="i">
						<c:if test="${i.getOSTATE() eq -1}">
							<tr>
								<td>환불완료</td>		 	
							 	<th>${i.getMNICK()}</th>
							 	<th>${i.getOAMOUNT()}</th>				 	
							 	<th>
							 		<button class="btn btn-primary btn-sm" 	onclick="refundDetail('${i.getMID()}','${i.getPNUMBER()}','${i.getODATE()}')">상세보기</button>
							 	</th>
							</tr>
						</c:if>
					</c:forEach>		 
				</table>
			</div>
		</div>
	</div>
	<%@ include file="../PageUp.jsp" %>
</body>
<footer>
	<%@ include file="../Footer.jsp" %>
</footer>
<script>
	function refundDetail(MID, PNUMBER, ODATE){
		window.open("refundDetail?MID="+MID+"&PNUMBER="+PNUMBER+"&ODATE="+ODATE, "_blank", "menubar=0, scrollbars=1, status=0, titlebar=0, toolbar=0, left=30, top=30, width=1000, height=300");
	}
</script>
</html>
