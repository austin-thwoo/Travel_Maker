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
				<div class="col-6 text-start">
					<h1>패키지 카테고리 추가</h1>
					<form action="packageCategoryInsert" name="packageCategoryForm" onsubmit="return packageCategoryInsert()">
						<div class="list-group">
							<c:forEach items="${categoryList}" var="i" varStatus="status">
								<label class="list-group-item">
									<input class="form-check-input me-1" type="checkbox" name="CNUMBER" value="${i.getCNUMBER()}">${i.getCNAME()}
								</label>
							</c:forEach>
						</div>
						<div class="mt-1 text-end">
							<input type="hidden" name="PNUMBER" value="${PNUMBER}">
							<input type="hidden" name="state" value="1">
							<button class="btn btn-primary btn-md" type="submit">다음</button>
						</div>
					</form>
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
	function packageCategoryInsert(){
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