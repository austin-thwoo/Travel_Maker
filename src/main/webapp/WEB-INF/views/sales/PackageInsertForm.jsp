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
	crossorigin="anonymous">	
	</script>
<style>
html, body, #google-map {
	width: 100%;
	height: 600px;
}
</style>
<title>Insert title here</title>
</head>
<body>
	<%@ include file="../Header.jsp"%>
	<div class="my-1">
		<%@ include file="../MainNav.jsp"%>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-3">
				<%@ include file="../AdminNav.jsp"%>
			</div>
			<div class="col row">
				<div class="col-10 justify-content-center">
					<form action="packageInsert" method="post" id="packageInsertform" enctype="multipart/form-data">
						<div class="container-fluid text-start mb-1">
							<label class="form-label" for="PNAME">패키지이름</label>
							<div class="input-group">
								<input class="form-control" type="text" id="PNAME" name="PNAME">
							</div>
	
							<label class="form-label" for="PPREIOD">패키지기간</label>
							<div class="input-group">
								<input class="form-control" type="number" id="PPERIOD" name="PPERIOD">
							</div>
	
							<label class="form-label" for="PIMG">패키지사진</label>
							<div class="input-group">
								<input class="form-control" type="file" id="PIMGFILE" name="PIMGFILE" accept="image/*" required="required">
							</div>
	
							<label class="form-label" for="PADULT">어른요금</label>
							<div class="input-group">
								<input class="form-control" type="number" id="PADULT" name="PADULT">
							</div>
	
							<label class="form-label" for="PCHILD">아동요금</label>
							<div class="input-group">
								<input class="form-control" type="number" id="PCHILD" name="PCHILD">
							</div>
	
							<label class="form-label" for="PINFANT">유아요금</label>
							<div class="input-group">
								<input class="form-control" type="number" id="PINFANT" name="PINFANT">
							</div>
	
							<label class="form-label" for="PMIN">최소인원</label>
							<div class="input-group">
								<input class="form-control" type="number" id="PMIN" name="PMIN">
							</div>
	
							<label class="form-label" for="PMAX">최대인원</label>
							<div class="input-group">
								<input class="form-control" type="number" id="PMAX" name="PMAX">
							</div>
	
							<label class="form-label" for="PINFO">패키지상세</label>
							<div class="input-group mb-3">
								<textarea name="PINFO" id="editor1"></textarea>
							</div>
							
							<label class="form-label">패키지일정</label>
							<div class="input-group mb-3">
								<input class="form-control" type="number" min="0" value="0" onchange="addScheduleForm(this)">
							</div>
							<span id="schedule"></span>
							
							<div class="input-group" id="search-panel">
						        <input class="form-control" id="address" type="text"/>
						        <button class="btn btn-primary btn-sm" id="search" type="button" value="Geocode" aria-describedby="address">지도 검색</button>
						    </div>
						    <div class="mb-3" id="google-map"></div>
							
							<span id="mapResult"></span>
							
							<div class="text-center">
								<button class="btn btn-primary btn-md" type="button" onclick="submitContents()">저장</button>
								<button class="btn btn-primary btn-md" type="reset">취소</button>
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<%@ include file="../PageUp.jsp"%>
</body>
<footer>
	<%@ include file="../Footer.jsp"%>
</footer>
<script src="https://code.jquery.com/jquery-3.3.1.min.js"></script>
<script async defer src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBOHxnO0_2b5Ss2Xn_nBEAmrAj8Contr5M&callback=initMap"></script>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	var markerCount = 0;

	$(function(){
		CKEDITOR.replace('editor1',{
			width : '800px',
			height : '600px',
			filebrowserImageUploadUrl: './fileUpload'
		});
        
    });
	
    function submitContents() {
        document.getElementById("packageInsertform").submit();
    }
    
    function initMap() {
        var map = new google.maps.Map(document.getElementById('google-map'), {
            zoom: 5, //맵 확대 정도
            center: {
                lat: 35.907757, //위도 (latitude)
                lng: 127.766922 //경도 (longitude)
            }
        });
        
        var geocoder = new google.maps.Geocoder();
        
        document.getElementById('search').addEventListener('click', function() {
            geocodeAddress(geocoder, map);
        });
        
		function geocodeAddress(geocoder, resultMap) {
	
	        var address = document.getElementById('address').value;
	        
	        geocoder.geocode({'address': address}, function(result, status) {
	
	        	if (status === 'OK') {
	            	
	            	resultMap.setCenter(result[0].geometry.location); // 맵의 중심 좌표
	            	resultMap.setZoom(5); //맵 확대 정도
	            	
	            	var marker = new google.maps.Marker({
		            	map: resultMap,
	                	position: result[0].geometry.location	
	            	});
	            	
	            	mapResult(marker, address);
	        	}else{
		        	alert('지오코드가 다음의 이유로 성공하지 못했습니다 : ' + status);
	        	}
	        });
	        
	        document.getElementById('address').value = "";
	    }
    }
    
    function mapResult(marker, address){
    	console.log(markerCount);
    	// 위도
    	console.log('위도(latitude) : ' + marker.position.lat());
    	// 경도
    	console.log('경도(longitude) : ' + marker.position.lng());
    	
    	var parent = document.getElementById('mapResult');
    	var newNodeLat = document.createElement("input");
    	newNodeLat.setAttribute("name", "PackageLocation["+markerCount+"].PLOLAT");
    	newNodeLat.setAttribute("type", "hidden");
    	newNodeLat.value = marker.position.lat();
    	
    	var newNodeLng = document.createElement("input");
    	newNodeLng.setAttribute("name", "PackageLocation["+markerCount+"].PLOLNG");
    	newNodeLng.setAttribute("type", "hidden");
    	newNodeLng.value = marker.position.lng();
    	
    	var newNodeName = document.createElement("input");
    	newNodeName.setAttribute("name", "PackageLocation["+markerCount+"].PLONAME");
    	newNodeName.setAttribute("type", "hidden");
    	newNodeName.value = address;
    	
    	parent.appendChild(newNodeLat);
    	parent.appendChild(newNodeLng);
    	parent.appendChild(newNodeName);
    	
    	markerCount++;
    }
    
    var formCount = 0;
    function addScheduleForm(count){
    	var parent = document.getElementById("schedule");
    	
    	if(formCount < count.value){
    		for (var i = formCount; i < count.value; i++){
    			var newNode = document.createElement("table");
				newNode.setAttribute("id", "scheduleForm"+formCount);
				newNode.setAttribute("class", "table table-striped");
				newNode.innerHTML = "<tr>" +
										"<td>출발일자</td>" +
										"<td>" +
											"<input type='date' class='form-control' name='PackageSchedule[" + i + "].PSSTART' onchange='setPSEND(this, document.getElementById(&#39;PSEND"+i+"&#39;), document.getElementById(&#39;PPERIOD&#39;))' required>" +
										"</td>" +
										"<td>종료일자</td>" +
										"<td>" +
											"<input type='date' class='form-control' name='PackageSchedule[" + i + "].PSEND' id='PSEND"+i+"' readonly>" +
										"</td>" +
									"</tr>";
				parent.appendChild(newNode);
				formCount++;
    		}
    	}else{
    		for (var i = formCount; i > count.value; i--){
				formCount--;
				var scheduleForm = "scheduleForm" + formCount;
				var removedNode = document.getElementById(scheduleForm);
				parent.removeChild(removedNode);
    		}
    	}
    }
    
    function setPSEND(PSSTART, PSEND, PPERIOD){
    	var date = new Date(PSSTART.value);
    	date.setDate(date.getDate() + parseInt(PPERIOD.value));
    	PSEND.valueAsDate = date;
    }
</script>
</html>