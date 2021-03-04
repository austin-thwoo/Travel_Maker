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
<style>
.starR {
	background:
		url('http://miuu227.godohosting.com/images/icon/ico_review.png')
		no-repeat right 0;
	background-size: auto 100%;
	width: 30px;
	height: 30px;
	display: inline-block;
	text-indent: -9999px;
	cursor: pointer;
}

.starR.on {
	background-position: 0 0;
}
#map {
	width: 80%;
    height: 700px;
    background-color: grey;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../Header.jsp" %>
	<div class="my-1">
		<%@ include file="../MainNav.jsp" %>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-8">
				<img src="resources/upload/${packageDetail.getPIMG()}" alt="패키지 이미지" width="800">
			</div>
			<div class="col">
				<table class="table table-borderless w-75">
					<colgroup>
						<col width="40%">
						<col width="60%">
					</colgroup>
					<tr>
						<th>패키지 번호 : </th>
						<td>${packageDetail.getPNUMBER()}</td>
					</tr>
					<tr>
						<th>패키지 이름 : </th>
						<td>${packageDetail.getPNAME()}</td>
					</tr>
					<tr>
						<th>여행기간 : </th>
						<td>${packageDetail.getPPERIOD()-1}박 ${packageDetail.getPPERIOD()}일</td>
					</tr>
					<tr>
						<th>최소인원 : </th>
						<td>${packageDetail.getPMIN()}</td>
					</tr>
					<tr>
						<th>최대인원 : </th>
						<td>${packageDetail.getPMAX()}</td>
					</tr>
					<tr>
						<th>성인요금 : </th>
						<td>${packageDetail.getPADULT()}원</td>
					</tr>
					<tr>
						<th>아동요금 : </th>
						<td>${packageDetail.getPCHILD()}원</td>
					</tr>
					<tr>
						<th>유아요금 : </th>
						<td>${packageDetail.getPINFANT()}원</td>
					</tr>
				</table>
				<c:choose>
					<c:when test="${!empty packageSchedule}">
						<div class="input-group">
							<select class="form-control" id="PSSTART">
								<option value="false">옵션 선택</option>
								<c:forEach items="${packageSchedule}" var="i" varStatus="vs">
									<option value="${i.getPSSTART()}">옵션${vs.index+1} : ${fn:substring(i.getPSSTART(),0,10)} ~ ${fn:substring(i.getPSEND(),0,10)}</option>
								</c:forEach>
							</select>
						</div>
						<c:if test="${!empty sessionScope.loginInfo}">
							<c:choose>
								<c:when test="${likeCheck == 0}">
									<button class="btn btn-primary btn-md" onclick="likeInsert('${sessionScope.loginInfo.getMID()}','${packageDetail.getPNUMBER()}', this)">좋아요</button>	
								</c:when>
								<c:otherwise>
									<button class="btn btn-primary btn-md" onclick="likeDelete('${sessionScope.loginInfo.getMID()}','${packageDetail.getPNUMBER()}', this)">좋아요 취소</button>
								</c:otherwise>
							</c:choose>
							<button class="btn btn-primary btn-md" onclick="cartInsert('${sessionScope.loginInfo.getMID()}', '${packageDetail.getPNUMBER()}', document.getElementById('PSSTART'), this)">장바구니</button>
							<button class="btn btn-primary btn-md" onclick="goSaleForm('${sessionScope.loginInfo.getMID()}', '${packageDetail.getPNUMBER()}', document.getElementById('PSSTART'))">결제하기</button>
						</c:if>
					</c:when>
					<c:otherwise>
						상품 준비 중입니다.
					</c:otherwise>
				</c:choose>
			</div>
		</div>
		<div class="row mb-1 justify-content-center">
			<h3>지역 위치</h3>
			<div id="map"></div>
		</div>
		<div class="row justify-content-center mb-3">
			<h3>상세 정보</h3>
			${packageDetail.getPINFO_1()}${packageDetail.getPINFO_2()}${packageDetail.getPINFO_3()}${packageDetail.getPINFO_4()}${packageDetail.getPINFO_5()}${packageDetail.getPINFO_6()}${packageDetail.getPINFO_7()}${packageDetail.getPINFO_8()}${packageDetail.getPINFO_9()}${packageDetail.getPINFO_10()}
		</div>
		<div class="row container">
			<c:if test="${reviewCheck > 0}">
				<div class="input-group mb-1">
					<div class="starRev" >			
						<span class="starR">1</span> 
						<span class="starR">2</span> 
						<span class="starR">3</span>					
						<span class="starR">4</span>
						<span class="starR">5</span>
					</div> 
					<input type="hidden" id="RVSCORE" value="0"> 			
					<input type="text" id="RVCONTENT" class="form-control" aria-describedby="button-addon2" required="required">
					<button id="button-addon2" class="btn btn-primary" onclick="reviewInsert('${packageDetail.getPNUMBER()}', '${sessionScope.loginInfo.getMID()}', document.getElementById('RVSCORE'), document.getElementById('RVCONTENT'))">작성</button>
				</div>
			</c:if>
			<table class="table table-striped">
				<colgroup>
					<col width="10%">
					<col width="20%">
					<col width="60%">
					<col width="10%">
				</colgroup>
				<thead>
					<tr>
						<th>작성자</th>
						<th>점수</th>
						<th>내용</th>
						<th>작성일자</th>
					</tr>
				</thead>
				<tbody id="reviewInsertResult">
					<c:forEach items="${reviewList}" var="i">
						<tr>
							<td>${i.getMNICK()}</td>
							<td>
								<c:forEach step="1" begin="1" end="5" var="j">
									<c:choose>
										<c:when test="${j <= i.getRVSCORE()}">
											<span class="starR on"></span>
										</c:when>
										<c:otherwise>
											<span class="starR"></span>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</td>
							<td>${i.getRVCONTENT()}</td>
							<td>${fn:substring(i.getRVDATE(),5,16)}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<%@ include file="../PageUp.jsp" %>
</body>
<footer>
	<%@ include file="../Footer.jsp" %>
</footer>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOHxnO0_2b5Ss2Xn_nBEAmrAj8Contr5M&callback=initMap"></script>
<script type="text/javascript">
	var address =null;
	
	function goSaleForm(MID, PNUMBER, PSSTART){
		if(PSSTART.options[PSSTART.selectedIndex].value != "false"){
			location.href = "goSaleForm?MID="+MID+"&PNUMBER="+PNUMBER+"&PSSTART="+PSSTART.options[PSSTART.selectedIndex].value;
		}else{
			alert("옵션을 선택해 주세요");
		}
	}
	
	$('.starRev span').click(function() {
		$(this).parent().children('span').removeClass('on');
		$(this).addClass('on').prevAll('span').addClass('on');		
		$("#RVSCORE").val($(this).text());
		console.log($("#RVSCORE").val());
		return false;	
	});
	
	function reviewInsert(OPNUMBER, OMID, RVSCORE, RVCONTENT) {
		location.href = "reviewInsert?OPNUMBER="+OPNUMBER+"&OMID="+OMID+"&RVSCORE="+RVSCORE.value+"&RVCONTENT="+RVCONTENT.value;
	}
	
	function likeInsert(MID, PNUMBER, button){
		$.ajax({
			url : "likeInsert",
			type : "post",
			data : {
				"PNUMBER" : PNUMBER,
				"MID" : MID
			},
			dataType : "Text",
			success : function(result){
				if (result == 1) {
					button.onclick = function(){
						likeDelete(MID, PNUMBER, button);
					};
					button.innerHTML = "좋아요 취소";
				}
			}
		});
	}
	
	function likeDelete(MID, PNUMBER, button){
		$.ajax({
			url : "likeDelete",
			type : "post",
			data : {
				"PNUMBER" : PNUMBER,
				"MID" : MID
			},
			dataType : "Text",
			success : function(result){
				if (result == 1) {
					button.onclick = function(){
						likeInsert(MID, PNUMBER, button);
					};
					button.innerHTML = "좋아요";
				}
			}
		});
	}
	
	function cartInsert(MID, PNUMBER, PSSTART, button){
		if(PSSTART.options[PSSTART.selectedIndex].value != "false"){
			$.ajax({
				url : "cartInsert",
				type : "post",
				data : {
					"MID" : MID,
					"PNUMBER" : PNUMBER,
					"PSSTART" : PSSTART.options[PSSTART.selectedIndex].value
				},
				dataType : "Text",
				error : function(result){
					alert("이미 장바구니에 등록된 상품입니다.");
				}
			});
		}else{
			alert("옵션을 선택해 주세요");
		}
		PSSTART.value = "false";
	}
	
	function initMap() {
	  const map = new google.maps.Map(document.getElementById("map"), {
	    zoom: 4,
	    center: ${center},
	  });
	  setMarkers(map);
	}
	
	const locations = ${locations};

	function setMarkers(map) {
	  

	  for (let i = 0; i < locations.length; i++) {
	    const location = locations[i];
	    new google.maps.Marker({
	      position: { lat: location[1], lng: location[2] },
	      map,
	      title: location[0],
	      zIndex: location[3],
	    });
	  }
	}
</script>
</html>