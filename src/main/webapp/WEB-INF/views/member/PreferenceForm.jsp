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
<header>
	
</header>
<body>
	<%@ include file="../Header.jsp" %>
	<div class="my-1">
		<%@ include file="../MainNav.jsp" %>
	</div>
	<div class="row contaniner justify-content-center">
		<div class="col-5 text-start">
			<h1>선호도 조사</h1>
			<h1>관심있는 분야에 체크해 주세요.</h1><br>
			<h3>선택을 기반으로 여행이 추천 됩니다.</h3>
			<form action="preferenceInsert" name="preferenceForm" onsubmit="return preferenceInsert()">
				<div class="list-group">
					<c:forEach items="${categoryList}" var="i" varStatus="status">
						<label class="list-group-item">
							<input class="form-check-input me-1" type="checkbox" name="CNUMBER" value="${i.getCNUMBER()}">${i.getCNAME()}
						</label>
					</c:forEach>
				</div>
				<div class="mt-1 text-end">
					<input type="hidden" name="MID" value="${sessionScope.loginInfo.getMID()}">
					<input type="hidden" name="state" value="1">
					<button class="btn btn-primary btn-md" type="submit">다음</button>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../PageUp.jsp" %>
</body>
<footer>
	<%@ include file="../Footer.jsp" %>
</footer>
<script type="text/javascript">
	function preferenceInsert(){
		var len = document.getElementsByName("CNUMBER").length;
		var flag = false;
		
		for (var i = 0; i < len; i++) {
			if(document.getElementsByName("CNUMBER")[i].checked == true){
				flag = true;
				break;
			}
		}
		
		if(flag){
			return true;
		}else{
			alert("한 개 이상 선택해 주세요");
			return false;
		}
	}
</script>
</html>