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
			<div class="col row">
				<form action="goSalesManagement" name="salesManagementForm">
					<div class="input-group mt-3">
						<select class="form-select-sm rounded-start" id="ODATE" name="ODATE">
							<c:forEach items="${yearList}" var="i">
								<c:choose>
									<c:when test="${i.getODATE() eq ODATE}">
										<option value="${i.getODATE()}" selected="selected">${i.getODATE()}년</option>
									</c:when>
									<c:otherwise>
										<option value="${i.getODATE()}">${i.getODATE()}년</option>
									</c:otherwise>
								</c:choose>
							</c:forEach>
						</select>
						<input type="hidden" name="to" value="${to}">
						<button class="btn btn-outline-secondary" id="ODATE" onclick="salesManagementForm('${to}')">검색</button>
					</div>
				</form>
				
				<div id="chart" style="height: 600px"></div>
				<div class="row container">
		  			<div class="col text-center" role="group">
		  				<c:choose>
		  					<c:when test="${to == 0}">
		  						<button type="button" class="btn btn-dark btn-md disabled">월별 매출</button>
		  					</c:when>
		  					<c:otherwise>
			  					<button type="button" class="btn btn-dark btn-md" onclick="monthlySales()">월별 매출</button>
		  					</c:otherwise>
		  				</c:choose>
		  				<c:choose>
		  					<c:when test="${to == 1}">
		  						<button type="button" class="btn btn-dark btn-md disabled">년도별 매출</button>
		  					</c:when>
		  					<c:otherwise>
			  					<button type="button" class="btn btn-dark btn-md" onclick="yearlySales()">년도별 매출</button>
		  					</c:otherwise>
		  				</c:choose>
		    			<c:choose>
		  					<c:when test="${to == 2}">
		  						<button type="button" class="btn btn-dark btn-md disabled">패키지별 매출</button>
		  					</c:when>
		  					<c:otherwise>
			  					<button type="button" class="btn btn-dark btn-md" onclick="packageSales()">패키지별 매출</button>
		  					</c:otherwise>
		  				</c:choose>
		    			<c:choose>
		  					<c:when test="${to == 3}">
		  						<button type="button" class="btn btn-dark btn-md disabled">카테고리별 매출</button>
		  					</c:when>
		  					<c:otherwise>
			  					<button type="button" class="btn btn-dark btn-md" onclick="categorySales()">카테고리별 매출</button>
		  					</c:otherwise>
		  				</c:choose>
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
<script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
<script type="text/javascript">
	google.charts.load('current', {'packages':['corechart']});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = google.visualization.arrayToDataTable([
			${result}
		]);
		var chart;
		switch (${to}) {
			case 0:
				var options = {
					title: '${title}',
					curveType: 'none',
					legend: { position: 'bottom' }
				};
				break;
			case 1:
		        var options = {
					title: '${title}',
					legend: { position: 'bottom' }
		        };
				break;
			case 2:
				var options = {
					title: '${title}',
					curveType: 'none',
					legend: { position: 'bottom' }
				};
			    break;
			case 3:
				var options = {
					title: '${title}',
					curveType: 'none',
					legend: { position: 'bottom' }
				};
			    break;
		}
		chart = new google.visualization.ColumnChart(document.getElementById('chart'));
		chart.draw(data, options);
	}
	
	function monthlySales(){
		location.href="goSalesManagement?to=0"	
	}
	
	function yearlySales(){
		location.href="goSalesManagement?to=1"	
	}
	
	function packageSales(){
		location.href="goSalesManagement?to=2"
	}
	
	function categorySales(){
		location.href="goSalesManagement?to=3"
	}
</script>
</html>
