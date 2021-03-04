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
				<%@ include file="../AdminNav.jsp" %>
			</div>
			<div class="col justify-content-center">
				<h1>할 일 목록</h1>
				<table class="table table-striped">
					<thead>
						<tr>
							<th>작성일</th>
							<th>할 일</th>
						</tr>
					</thead>
					<tbody id="jobListInsertResult">
						<c:forEach items="${jobList}" var="i">
							<tr>
								<th>${fn:substring(i.getADATE(),0,16)}</th>
								<th>${i.getAJOB()}</th>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="input-group mb-1">
			<input type="text" id="AJOB" class="form-control" aria-describedby="button-addon2">
			<input type="hidden" id="MID" value="${sessionScope.loginInfo.getMID()}">
			<button type="button" id="button-addon2" class="btn btn-primary" onclick="jobListInsert()">작성</button>
		</div>
			</div>
		</div>
		
	</div>
	<%@ include file="../PageUp.jsp" %>
</body>
<footer style="clear: both;">
	<%@ include file="../Footer.jsp" %>
</footer>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	function jobListInsert(){
		$.ajax({
			url : "jobListInsert",
			data : {
				"AJOB" : $("#AJOB").val(),
				"MID" : $("#MID").val()
				},
			method : "get",
			dataType : "json",
			success : function(result){
				var htmlResult = "";
				for ( var i in result) {
					htmlResult += "<tr>" +
									"<th>" + result[i].ADATE.substring(0, 16) + "</th>" +
									"<th>" + result[i].AJOB + "</th>" +
								"</tr>";
				}
				$("#AJOB").val("");
				$("#jobListInsertResult").html(htmlResult);
			}
		});
	}
</script>
</html>
