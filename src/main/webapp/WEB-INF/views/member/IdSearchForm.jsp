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
		<div class="row justify-content-center">
				<div class="col-6">
				<h1>아이디 찾기</h1>
					<form action="idSearch" method="POST" onsubmit="return idSearch()">
						<label class="form-label" for="MNAME">이름</label>
						<div class="input-group">
							<input class="form-control" type="text" id="MNAME" name="MNAME" required="required">
						</div>	
						
						<label class="form-label" for="MPHONE">핸드폰 번호</label>
						<div class="input-group">
							<input class="form-control" type="text" id="MPHONE" name="MPHONE" placeholder="'-'제외" onkeyup="phoneRegex()" required="required">
						</div>
						
						<div class="mt-4 text-center mb-1">
							<button type="submit" class="btn btn-primary btn-md">아이디 찾기</button>
						</div>		
					</form>
				</div>
		</div>
	</div>
	<%@ include file="../PageUp.jsp" %>
</body>
<footer>
	<%@ include file="../Footer.jsp"%>
</footer>
<script type="text/javascript">
	var phoneRegexResult = false;
	
	function idSearch(){
		if(phoneRegexResult){
			return true;
		}else{
			alert("연락처를 형식에 맞게 입력해 주세요");
			return false;
		}
	}

	function phoneRegex(){
		var num = /\d{11}/g;
		if(num.test($("#MPHONE").val())){
			phoneRegexResult = true;
		}else{
			phoneRegexResult = false;
		}
	}
</script>
</html>