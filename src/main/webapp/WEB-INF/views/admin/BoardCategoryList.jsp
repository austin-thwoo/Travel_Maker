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
			<div class="col-6 justify-content-center text-start">
				<h1>게시판 카테고리 목록</h1>
				<div class="list-group">
					<c:forEach items="${boardCategoryList}" var="i">
						<div class="input-group mb-1">
							<label class="list-group-item form-control" aria-describedby="${i.getBCNAME()}">${i.getBCNAME()}</label>
							<button class="btn btn-primary" id="${i.getBCNAME()}" data-bs-toggle="collapse" data-bs-target="#CategoryUpdateForm${i.getBCNUMBER()}">수정하기</button>
							<c:if test="${i.getBCSTATE()==1}">
								<button class="btn btn-primary" onclick="boardCategorylock('${i.getBCNUMBER()}', '${i.getBCSTATE()}', this)">잠금</button>
							</c:if>
							<c:if test="${i.getBCSTATE()==-1}">
								<button class="btn btn-primary" onclick="boardCategorylock('${i.getBCNUMBER()}', '${i.getBCSTATE()}', this)">복구</button>
							</c:if>
						</div>
						<div class="collapse multi-collapse input-group mb-1" id="CategoryUpdateForm${i.getBCNUMBER()}">
							<input class="form-control" type="text" aria-describedby="button-addon" id="CNAME_${i.getBCNAME()}" onkeyup="boardCategoryCheck(this, document.getElementById('boardCategoryCheckResult${i.getBCNUMBER()}'))">
							<button class="btn btn-primary" id="button-addon" onclick="boardCategoryUpdate('${i.getBCNUMBER()}', document.getElementById('CNAME_${i.getBCNAME()}'))">저장</button>
						</div>
						<span id="boardCategoryCheckResult${i.getBCNUMBER()}" class="d-block"></span>
					</c:forEach>
				</div>
				
				<div class="row justify-content-end">
					<div class="col-5">
						<div class="input-group">
							<input class="form-control" type="text"aria-describedby="button-addon" id="BCNAME" onkeyup="boardCategoryCheck(this, document.getElementById('boardCategoryCheckResult'))">
							<button class="btn btn-primary" id="button-addon" onclick="boardCategoryInsert()">등록하기</button>
						</div>
						<span id="boardCategoryCheckResult" class="d-block"></span>
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
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script type="text/javascript">
	var boardCategoryCheckResult = false;
	
	function boardCategoryInsert(){
		if(boardCategoryCheckResult){
			location.href = "boardCategoryInsert?BCNAME=" + $("#BCNAME").val();
		}else{
			alert("이미 존재 하는 카테고리 입니다.");
		}
	}
	
	function boardCategoryCheck(BCNAME, output){
		if(BCNAME.value != ""){
			$.ajax({	
				type : "post",
				url : "boardCategoryCheck",
				data : {
						"BCNAME" : BCNAME.value
						},
				dataType : "text",
				success : function(result){
							if (result == "0") {
								output.style.color = "blue";
								output.innerHTML = "사용 가능한 카테고리 입니다.";
								boardCategoryCheckResult = true;
							}else{
								output.style.color = "red";
								output.innerHTML = "이미 존재 하는 카테고리 입니다.";
								boardCategoryCheckResult = false;
							}
				}
			});
		}else{
			output.innerHTML = "";
			boardCategoryCheckResult = false;
		}
	}
	
	function boardCategoryUpdate(BCNUMBER, BCNAME){
		if(boardCategoryCheckResult){
			location.href = "boardCategoryUpdate?BCNUMBER=" + BCNUMBER + "&BCNAME=" + BCNAME.value;
		}else{
			alert("이미 존재 하는 카테고리 입니다.");
		}
	}
	
	function boardCategorylock(BCNUMBER, BCSTATE, button){
		$.ajax({
			url : "boardCategorylock",
			type : "post",
			data : {
				"BCNUMBER" : BCNUMBER,
				"BCSTATE" : (BCSTATE * -1)
			},
			dataType : "text",
			success : function(result){
				if(result == '1'){
					if(BCSTATE == 1){
						button.innerHTML = "복구";
					}else{
						button.innerHTML = "잠금"
					}
					button.onclick = function(){
						boardCategorylock(BCNUMBER, (BCSTATE * -1), button);
					};
				}
			}
		});
	}
</script>
</html>
