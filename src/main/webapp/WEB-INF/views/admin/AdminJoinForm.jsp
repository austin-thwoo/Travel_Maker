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
		<div class="row justify-content-center container-fluid">
			<h1 class="text-center">AdminJoin</h1>
			<form action="memberJoin" method="POST" onsubmit="return memberjoin()">
				<div class="col-md-4 container-fluid">
					<label for="MID" class="form-label">아이디</label>
					<div class="input-group">
						<input type="text" class="form-control" id="MID" name="MID" aria-describedby="idCheck" onchange="idChange()" required>
						<div class="btn btn-outline-secondary btn-md" id="idCheck" onclick="idCheck()">중복확인</div>
					</div>
					<span id="idCheckResult" class="d-block"></span>
					
					<label for="MPW" class="form-label">비밀번호</label>
					<div class="input-group">
						<input type="password" class="form-control" id="MPW" name="MPW" onkeyup="pwRegex()" placeholder="영문, 숫자 포함 8~20자" required>
					</div>
					<span id="pwRegexResult" class="d-block"></span>
					
					<label for="pwCheck" class="form-label">비밀번호 확인</label>
					<div class="input-group">
						<input type="password" class="form-control" id="MPWC" onkeyup="pwCheck()" required>
					</div>
					<span id="pwCheckResult" class="d-block"></span>

					<label for="MNICK" class="form-label">닉네임</label>
					<div class="input-group">
						<input type="text" class="form-control" id="MNICK" name="MNICK" onkeyup="nickCheck()" required>
					</div>
					<span id="nickCheckResult" class="d-block"></span>

					<label for="MNAME" class="form-label">이름</label>
					<div class="input-group">
						<input type="text" class="form-control" id="MNAME" name="MNAME" required>
					</div>

					<label class="form-label">성별 : </label>
					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="MGENDER" id="MGENDERM" value="M">
  						<label class="form-check-label" for="MGENDERM">남</label>
					</div>
					<div class="form-check form-check-inline">
  						<input class="form-check-input" type="radio" name="MGENDER" id="MGENDERF" value="F">
  						<label class="form-check-label" for="MGENDERF">여</label>
					</div> <br/>

					<label for="MBIRTH" class="form-label">생년월일</label>
					<div class="input-group">
						<input type="date" class="form-control" id="MBIRTH" name="MBIRTH" required>
					</div>

					<label for="MPHONE" class="form-label">연락처</label>
					<div class="input-group">
						<input type="text" class="form-control" id="MPHONE" name="MPHONE" placeholder="'-'제외" onkeyup="phoneRegex()" required>
					</div>
					<span id="phoneRegexResult" class="d-block"></span>

					<div class="mt-3 text-center mb-1">
						<input type="hidden" name="MLEVEL" value="0">
						<button type="submit" class="btn btn-primary btn-md">회원가입</button>
						<input type="reset" class="btn btn-primary btn-md" value="다시작성">
					</div>
					
					<div class="text-center mt-2">
						<a href="goLoginForm">LogIn</a>
					</div>
				</div>
			</form>
		</div>
	</div>
	<%@ include file="../PageUp.jsp" %>
</body>
<footer>
	<%@ include file="../Footer.jsp" %>
</footer>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
	var idCheckResult = false;
	var pwRegexResult = false;
	var pwCheckResult = false;
	var nickCheckResult = false;
	var phoneRegexResult = false;
	
	function memberjoin(){
		if (idCheckResult) {
			if(pwRegexResult){
				if(pwCheckResult){
					if(nickCheckResult){
						if(phoneRegexResult){
							return true;
						}else{
							alert("연락처를 형식에 맞게 입력해 주세요");
							return false;
						}
					}else{
						alert("닉네임이 중복됩니다");
						return false;
					}
				}else{
					alert("비밀번호를 동일하게 입력해 주세요");
					return false;
				}
			}else{
				alert("비밀번호를 형식에 맞게 입력해 주세요");
				return false;
			}
		}else{
			alert("계정 중복 확인을 해주세요");
			return false;
		}
	}
	
	function idCheck(){
		$.ajax({
			type : "get",
			url : "idCheck",
			data : {"MID" : $("#MID").val()},
			dataType : "text",
			success : function(result){
				if (result == "0") {
					$("#idCheckResult").css("color", "green");
					$("#idCheckResult").html("사용 가능한 계정입니다.");
					idCheckResult = true;
				}else{
					$("#idCheckResult").css("color", "red");
					$("#idCheckResult").html("이미 사용 중이거나 탈퇴한 계정입니다.");
					idCheckResult = false;
				}
			}
		});
	}
	
	function idChange(){
		idCheckResult = false
	}
		
	function pwRegex(){
		 var num = $("#MPW").val().search(/[0-9]/g);
		 var eng = $("#MPW").val().search(/[a-z]/ig);
		 pwRegexResult = false;
		 
		 if($("#MPW").val().length < 8 || $("#MPW").val().length > 20){
			$("#pwRegexResult").css("color", "red");
			$("#pwRegexResult").html("8자리~20자리 이내로 입력해 주세요");
		 }else if($("#MPW").val().search(/\s/) != -1){
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
		 if($("#MPWC").val() == $("#MPW").val()){
			 $("#pwCheckResult").css("color", "blue");
			 $("#pwCheckResult").html("비밀번호가 일치합니다.");
			 pwCheckResult = true;
		 }else {
			 $("#pwCheckResult").css("color", "red");
			 $("#pwCheckResult").html("비밀번호가 일치하지 않습니다!");
			 pwCheckResult = false;
		 }
	}
	
	function nickCheck(){
		if($("#MNICK").val() != ""){
			$.ajax({	
				type : "post",
				url : "nickCheck",
				data : {"MNICK" : $("#MNICK").val()},
				dataType : "text",
				success : function(result){
							if (result == "0") {
								$("#nickCheckResult").css("color", "blue");
								$("#nickCheckResult").html("사용 가능한 닉네임입니다.");
								nickCheckResult = true;
							}else{
								$("#nickCheckResult").css("color", "red");
								$("#nickCheckResult").html("이미 사용 중인 닉네임입니다.");
								nickCheckResult = false;
							}
				}
			});
		}else{
			$("#nickCheckResult").html("");
			nickCheckResult = false;
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