<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
				<%@ include file="../MyPageNav.jsp" %>
			</div>
			<div class="row col justify-content-start container-fluid">
				<div class="col-6">
				<h1>updatePass</h1>
				<form action="passwordUpdate" method="POST" onsubmit="return passwordUpdate()">
					<label class="form-label" for="MPW">현재 비밀번호</label>
					<div class="input-group mb-1">
						<input class="form-control" type="password" id="MPW" name="MPW" required>
					</div>
					<label class="form-label" for="UPMPW">변경할 비밀번호</label>
					<div class="input-group mb-1">
						<input class="form-control" type="password" id="UPMPW" name="UPMPW" onkeyup="pwRegex()" placeholder="영문, 숫자 포함 8~20자" required>
					</div>
					<span id="pwRegexResult" class="d-block"></span>
					<label class="form-label" for="UPMPWCHECK">변경할 비밀번호 확인</label>
					<div class="input-group mb-1">
						<input class="form-control" type="password" id="UPMPWC" onkeyup="pwCheck()" required>
					</div>
					<span id="pwCheckResult" class="d-block"></span>
					<div class="text-end">
						<input type="hidden" name="MID" value="${sessionScope.loginInfo.getMID()}">
						<button class="btn btn-primary btn-md" type="submit">수정</button>
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
	var pwRegexResult = false;
	var pwCheckResult = false;

	function pwRegex(){
		 var num = $("#UPMPW").val().search(/[0-9]/g);
		 var eng = $("#UPMPW").val().search(/[a-z]/ig);
		 pwRegexResult = false;
		 
		 if($("#UPMPW").val().length < 8 || $("#UPMPW").val().length > 20){
			$("#pwRegexResult").css("color", "red");
			$("#pwRegexResult").html("8자리~20자리 이내로 입력해 주세요");
		 }else if($("#UPMPW").val().search(/\s/) != -1){
			$("#pwRegexResult").css("color", "red");
			$("#pwRegexResult").html("비밀번호는 공백 없이 입력해주세요");
		 }else if(num < 0 || eng < 0){
			$("#pwRegexResult").css("color", "red");
			$("#pwRegexResult").html("영문, 숫자를 포함하여 입력해주세요");
		 }else {
			$("#pwRegexResult").css("color", "blue");
			$("#pwRegexResult").html("적절한 비밀번호 입니다");
			pwRegexResult = true;
		 }
		 pwCheck();
	}	

	function pwCheck(){
		 if($("#UPMPWC").val() == $("#UPMPW").val()){
			 $("#pwCheckResult").css("color", "blue");
			 $("#pwCheckResult").html("비밀번호가 일치합니다.");
			 pwCheckResult = true;
		 }else {
			 $("#pwCheckResult").css("color", "red");
			 $("#pwCheckResult").html("비밀번호가 일치하지 않습니다!");
			 pwCheckResult = false;
		 }
	}
	
	function passwordUpdate(){
		if(pwRegexResult){
			if(pwCheckResult){
				return true;
			}else{
				alert("비밀번호를 동일하게 입력해 주세요");
				return false;
			}
		}else{
			alert("비밀번호를 형식에 맞게 입력해 주세요");
			return false;
		}
	}
</script>
</html>
