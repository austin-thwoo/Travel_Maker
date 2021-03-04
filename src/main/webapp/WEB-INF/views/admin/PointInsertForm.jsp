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
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-6">
				<div class="input-group mb-1">
					<label for="MNICK" class="form-label">회원명 </label>
					<div class="input-group">
						<input type="text" class="form-control" id="MNICK" value="${memberInfo.getMNICK()}" disabled="disabled">
					</div>
		
					<label for="NOWPOAMOUNT" class="form-label">현재 포인트</label>
					<div class="input-group">
						<input type="text" class="form-control" id="NOWPOAMOUNT" value="${memberInfo.getPOAMOUNT()}" disabled="disabled">
					</div>
		
					<label for="POAMOUNT" class="form-label">지급 포인트</label>
					<div class="input-group">
						<input type="number" class="form-control" id="POAMOUNT" placeholder="포인트의 수치를 입력해 주세요." required>
					</div>
					
					<div class="input-group">
						<div class="form-check me-2">
							<input class="form-check-input" type="radio" name="POSTATE" id="POSTATE1" value="1">
							<label class="form-check-label" for="POSTATE1">지급</label>
						</div>
						<div class="form-check">
							<input class="form-check-input" type="radio" name="POSTATE" id="POSTATE-1" value="-1">
							<label class="form-check-label" for="POSTATE-1">차감</label>
						</div>
					</div>
					
					<label for="POINFO" class="form-label">포인트의 내용을 입력해주세요</label>
					<div class="input-group">
						<input type="text" class="form-control" id="POINFO" placeholder="포인트 지급/차감하는 이유를 기재해 주세요." required>
					</div>
				</div>
				<div class="text-end">
					<button type="button" id="button-addon2" class="btn btn-primary" onclick="pointInsert('${memberInfo.getMID()}')">지급</button>
				</div>
			</div>
		</div>
	</div>
</body>
<footer style="clear: both;">
	<%@ include file="../Footer.jsp"%>
</footer>
<script type="text/javascript">
	function pointInsert(MID){
		opener.location.href = "pointInsert?MID="+MID+"&POAMOUNT="+document.getElementById("POAMOUNT").value+"&POSTATE="+document.querySelector('input[name="POSTATE"]:checked').value+"&POINFO="+document.getElementById("POINFO").value+"&MLEVEL="+${MLEVEL}+"&nowPage="+${nowPage};
		self.close();
	}
</script>
</html>
