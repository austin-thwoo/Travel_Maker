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
		<%@ include file="../MainNav.jsp"%>
	</div>
	<form action="ordersInsert" method="POST" name="saleForm">
	<div class="container">
		<div class="row">
			<div class="col-9 container-fluid">
				<h2>예약정보</h2>
				<table class="table table-striped">
					<tr>
						<td>상품명</td>
						<td>${packageDetail.getPNAME()}</td>
					</tr>
					<tr>
						<td>여행기간</td>
						<td>${fn:substring(packageSchedule.getPSSTART(),0,10)} ~ ${fn:substring(packageSchedule.getPSSTART(),0,10)} / ${packageDetail.getPPERIOD()-1}박 ${packageDetail.getPPERIOD()}일</td>
					</tr>
				</table>
				<hr />
				<h2>인원 정보</h2>
				<table class="table table-striped">
					<tr>
						<td>성인</td>
						<td>아동</td>
						<td>유아</td>
					</tr>
					<tr>
						<!-- 성인 -->
						<td>
							<div class="col-3">
								<input class="form-control" id="OADULT" name="OADULT" type="number" min="0" value="0" onchange="addTravelerForm(this, document.getElementById('OCHILD'), document.getElementById('OINFANT'))">
							</div>
						</td>
						<!-- 아동 -->
						<td>
							<div class="col-3">
								<input class="form-control" id="OCHILD" name="OCHILD" type="number" min="0" value="0" onchange="addTravelerForm(document.getElementById('OADULT'), this, document.getElementById('OINFANT'))">
							</div>
						</td>
						<!-- 유아 -->
						<td>
							<div class="col-3">
								<input class="form-control" id="OINFANT" name="OINFANT" type="number" min="0" value="0" onchange="addTravelerForm(document.getElementById('OADULT'), document.getElementById('OCHILD'), this)">
							</div>
						</td>
					</tr>
					<tr>
						<td>${packageDetail.getPADULT()}원</td>
						<td>${packageDetail.getPCHILD()}원</td>
						<td>${packageDetail.getPINFANT()}원</td>
					</tr>
				</table>
				<hr/>
				<div>
					<h2>여행자 정보</h2>
					<div id="travelerForm">
					</div>
				</div>
				<hr />
				<div class="container-fluid">
					<div class="row container-fluid">
						<h1 class="text-center">여행 약관</h1>
						<div class="container-fluid text-center">
							<h5>해외여행 표준약관 약관</h5>
							<div class="input-group justify-content-center">
								<textarea rows="20" cols="100" class="textarea" style="resize: none;" readonly>해외여행 표준약관 내용 이지롱</textarea>
							</div>
							<div class="text-center">
								<input type="checkbox" required="required" name="checkBox"> 해외여행 표준약관 동의합니다.
							</div>

							<h5>국내여행표준약관</h5>
							<div class="input-group justify-content-center">
								<textarea rows="20" cols="100" class="textarea" style="resize: none;" readonly>국내여행표준약관 내용이지로옹</textarea>
							</div>
							<div class="text-center">
								<input type="checkbox" required="required" name="checkBox"> 국내여행표준약관 동의합니다.
							</div>
								
							<h5>개인정보 이용약관</h5>
							<div class="input-group justify-content-center">
								<textarea rows="20" cols="100" class="textarea" style="resize: none;" readonly>개인정보 이용약관</textarea>
							</div>
							<div class="text-center">
								<input type="checkbox" required="required" name="checkBox"> 개인정보 이용약관 동의합니다.
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="col">
				<div class="border p-1 sticky-top row text-center justify-content-center">
					<h2>상품 결제 정보</h2>
					<table class="text-center">
						<tr>
							<td id="adult">성인 0</td>
							<td id="child">아동 0</td>
							<td id="infant">유아 0</td>
						</tr>
						<tr>
							<td colspan="3">남은 포인트 ${pointInfo.getPOAMOUNT()}</td>
						</tr>
						<tr>
							<td colspan="3">
								사용할 포인트 
								<div class="row justify-content-center">
									<div class="col-7">
										<input class="form-control" name="POAMOUNT" id="POAMOUNT" type="number" min="0" max="${pointInfo.getPOAMOUNT()}" value="0">
										<a class="btn btn-primary btn-sm" onclick="usePoint(document.getElementById('POAMOUNT'), document.getElementById('OADULT'), document.getElementById('OCHILD'), document.getElementById('OINFANT'))">사용하기</a>
									</div>
								</div>
							</td>
						</tr>
						<tr>
							<td colspan="3" id="deposit">
								계약금 0원
							</td>
						</tr>
						<tr>
							<td colspan="3" id="total">
								총 금액 0원
							</td>
						</tr>
						<tr>
							<td colspan="3">
								<div class="btn-group-vertical">
									<input type="hidden" id="MID" name="MID" value="${sessionScope.loginInfo.getMID()}">
									<input type="hidden" id="MNAME" name="MNAME" value="${pointInfo.getMNAME()}">
									<input type="hidden" id="PNUMBER" name="PNUMBER" value="${packageDetail.getPNUMBER()}">
									<input type="hidden" id="PNAME" name="PNAME" value="${packageDetail.getPNAME()}">
									<input type="hidden" id="PSSTART" name="PSSTART" value="${packageSchedule.getPSSTART()}">
									<input type="hidden" id="OAMOUNT" name="OAMOUNT" value="0">
									<input type="hidden" id="OSTATE" name="OSTATE" value="0">
									<a class="btn btn-outline-primary btn-md" onclick="depositPay('${sessionScope.loginInfo.getMID()}', '${packageDetail.getPNUMBER()}', document.getElementById('OADULT'), document.getElementById('OCHILD'), document.getElementById('OINFANT'), '${packageSchedule.getPSSTART()}', document.getElementById('POAMOUNT'), '${packageDetail.getPNAME()}', '${pointInfo.getMNAME()}')">계약금결제</a>
									<a class="btn btn-outline-primary btn-md" onclick="totalPay('${sessionScope.loginInfo.getMID()}', '${packageDetail.getPNUMBER()}', document.getElementById('OADULT'), document.getElementById('OCHILD'), document.getElementById('OINFANT'), '${packageSchedule.getPSSTART()}', document.getElementById('POAMOUNT'), '${packageDetail.getPNAME()}', '${pointInfo.getMNAME()}')">전액결제</a>
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	</form>
	<%@ include file="../PageUp.jsp"%>
</body>
<footer>
	<%@ include file="../Footer.jsp"%>
</footer>
<script type="text/javascript">
	var formCount = 0;
	var pointFlag = false;
	
	function addTravelerForm(OADULT, OCHILD, OINFANT){
		var sum = parseInt(OADULT.value)+parseInt(OCHILD.value)+parseInt(OINFANT.value);
		var parent = document.getElementById("travelerForm");
		
		if(formCount < sum){
			for (var i = formCount; i < sum; i++) {
				var newNode = document.createElement("table");
				newNode.setAttribute("id", "travelerForm"+formCount);
				newNode.setAttribute("class", "table table-striped");
				newNode.innerHTML = "<h4>여행객" + (i+1) + "</h4>" +
									"<tr>" +
										"<td>성명(한글)</td>" +
										"<td>" +
											"<input type='text' class='form-control' name='Travelers[" + i + "].TNAME' placeholder='한글성명  ex)홍길동' required>" +
										"</td>" +
										"<td>생년월일</td>" +
										"<td>" +
											"<input type='date' class='form-control' name='Travelers[" + i + "].TBIRTH' placeholder='법정생년월일  ex)19911223' required>" +
										"</td>" +
									"</tr>" +
									"<tr>" +
										"<td>영문 이름</td>" +
										"<td colspan='3'>" +
											"<div class='col-6'>" +
											"<input type='text' class='form-control' name='Travelers[" + i + "].TENNAME' placeholder='영문 이름 ex) HONG GIL DONG' required>" +
											"</div>" +
										"</td>" +
									"</tr>" +
									"<tr>" +
										"<td>휴대폰 번호</td>" +
										"<td>" +
											"<input type='text' class='form-control' name='Travelers[" + i + "].TPHONE' placeholder='휴대폰 번호 ex) 01012345678' required>" +
										"</td>" +
										"<td>이메일 주소</td>" +
										"<td>" +
											"<input type='email' class='form-control' name='Travelers[" + i + "].TEMAIL' placeholder='이메일 주소 ex) Hong@naver.com' required>" +
										"</td>" +
									"</tr>";
				parent.appendChild(newNode);
				formCount++;
			}
		}else{
			for (var i = formCount; i > sum; i--) {
				formCount--;
				var travelerForm = "travelerForm" + formCount;
				var removedNode = document.getElementById(travelerForm);
				parent.removeChild(removedNode);
			}
		}
		
		var total = parseInt(OADULT.value)*${packageDetail.getPADULT()}+parseInt(OCHILD.value)*${packageDetail.getPCHILD()}+parseInt(OINFANT.value)*${packageDetail.getPINFANT()};
		document.getElementById("adult").innerHTML = "성인 " + OADULT.value;
		document.getElementById("child").innerHTML = "아동 " + OCHILD.value;
		document.getElementById("infant").innerHTML = "유아 " + OINFANT.value;
		document.getElementById("deposit").innerHTML = "계약금 " + total*0.1 + "원";
		document.getElementById("total").innerHTML = "총 금액 " + total + "원";
	}
	
	function usePoint(POAMOUNT, OADULT, OCHILD, OINFANT){
		var total = parseInt(OADULT.value)*${packageDetail.getPADULT()}+parseInt(OCHILD.value)*${packageDetail.getPCHILD()}+parseInt(OINFANT.value)*${packageDetail.getPINFANT()};
		var point = POAMOUNT.value;
		if(parseInt(point) > '${pointInfo.getPOAMOUNT()}'){
			point = "${pointInfo.getPOAMOUNT()}";
			POAMOUNT.value = "${pointInfo.getPOAMOUNT()}";
		}
		
		if(point > 0){
			pointFlag = true;
		}else{
			pointFlag = false;
		}
		
		if(total*0.1-point < 0){
			document.getElementById("deposit").innerHTML = "계약금 " + 0 + "원";
		}else{
			document.getElementById("deposit").innerHTML = "계약금 " + (total*0.1-point) + "원";
		}
		
		if((total-point) < 0){
			document.getElementById("total").innerHTML = "총 금액 " + 0 + "원";
		}else{
			document.getElementById("total").innerHTML = "총 금액 " + (total-point) + "원";
		}
	}
	
	function depositPay(MID, PNUMBER, OADULT, OCHILD, OINFANT, PSSTART, POAMOUNT, PNAME, MNAME){
		var total = parseInt(OADULT.value)*${packageDetail.getPADULT()}+parseInt(OCHILD.value)*${packageDetail.getPCHILD()}+parseInt(OINFANT.value)*${packageDetail.getPINFANT()};
		total = total*0.1;
		
		if(pointFlag){
			total = total - POAMOUNT.value;
		}
		
		document.getElementById("OAMOUNT").value = total;
		document.getElementById("OSTATE").value = 1;
		
		goPayApi(MID, total, PNAME, MNAME);
	}
	
	function totalPay(MID, PNUMBER, OADULT, OCHILD, OINFANT, PSSTART, POAMOUNT, PNAME, MNAME){
		var total = parseInt(OADULT.value)*${packageDetail.getPADULT()}+parseInt(OCHILD.value)*${packageDetail.getPCHILD()}+parseInt(OINFANT.value)*${packageDetail.getPINFANT()};
		total = total;
		
		if(pointFlag){
			total = total - POAMOUNT.value;
		}
		
		document.getElementById("OAMOUNT").value = total;
		document.getElementById("OSTATE").value = 2;
		
		goPayApi(MID, total, PNAME, MNAME);
	}
	
	function goPayApi(MID, total, PNAME, MNAME){
		PNAME = encodeURI(PNAME);
		var len = document.getElementsByName("checkBox").length;
		var flag = false;
		
		for (var i = 0; i < len; i++) {
			if(document.getElementsByName("checkBox")[i].checked == true){
				flag = true;
			}else{
				flag = false;
				break;
			}
		}
		
		if(flag){
			var to = "goPayApi?MID="+MID+"&OAMOUNT="+total+"&PNAME="+PNAME+"&MNAME="+MNAME+"&pay=1";
			window.open(to, "_blank", "menubar=0, scrollbars=1, status=0, titlebar=0, toolbar=0, left=30, top=30, width=900, height=600");
		}else{
			alert("필수 약관에 동의 하셔야 합니다.");
		}
	}
</script>
</html>