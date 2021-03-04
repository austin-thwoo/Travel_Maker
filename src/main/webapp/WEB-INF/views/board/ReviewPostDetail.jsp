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
		<%@ include file="../MainNav.jsp" %>
	</div>
	<div class="container">
		<div class="row contaniner-fluid">
			<div class="col text-start">${reviewPostDetail.getRPTITLE()}</div>
			<div class="col d-flex justify-content-end text-end">
				<ul class="list-group list-group-horizontal">
					<li class="list-group-item border-0 p-1">${reviewPostDetail.getMNICK()}</li>
					<li class="list-group-item border-0 p-1">${fn:substring(reviewPostDetail.getRPDATE(),5,16)}</li>
				</ul>
			</div>
		</div>
		<div class="form-group">
			<img alt="썸네일 이미지" src="resources/upload/${reviewPostDetail.getRPIMG()}" width="600px">
			${reviewPostDetail.getRPCONTENT()}
		</div>
		<div class="row container-fluid mb-1">
			<div class="text-end">
				<a type="button" class="btn btn-outline-primary btn-md" href="goReviewPostList?nowPage=${page.getNowPage()}&to=${to}&searchType=${searchReviewPost.getSearchType()}&keyWord=${searchReviewPost.getKeyWord()}">목록</a>
			</div>
		</div>
		<c:if test="${reviewPostDetail.getOMID() eq sessionScope.loginInfo.getMID() or sessionScope.loginInfo.getMLEVEL() == 0}">
			<div class="row container-fluid mb-1">
				<div class="text-end">
					<c:if test="${reviewPostDetail.getOMID() eq sessionScope.loginInfo.getMID()}">
						<a type="button" class="btn btn-outline-warning btn-md"  href="goReviewPostUpdateForm?OPNUMBER=${reviewPostDetail.getOPNUMBER()}&OMID=${reviewPostDetail.getOMID()}&ODATE=${reviewPostDetail.getODATE()}&to=${to}">수정</a>
					</c:if>
					<c:choose>
						<c:when test="${reviewPostDetail.getRPSTATE() == 1}">
							<button type="button" class="btn btn-outline-danger btn-md" onclick="reviewPostLock('${reviewPostDetail.getOPNUMBER()}', '${reviewPostDetail.getOMID()}', '${reviewPostDetail.getODATE()}', '${reviewPostDetail.getRPSTATE()}', '${sessionScope.loginInfo.getMLEVEL()}', this)">삭제</button>
						</c:when>
						<c:otherwise>
							<c:if test="${sessionScope.loginInfo.getMLEVEL() == 0}">
								<button type="button" class="btn btn-outline-danger btn-md" onclick="reviewPostLock('${reviewPostDetail.getOPNUMBER()}', '${reviewPostDetail.getOMID()}', '${reviewPostDetail.getODATE()}', '${reviewPostDetail.getRPSTATE()}', '${sessionScope.loginInfo.getMLEVEL()}', this)">복구</button>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</c:if>
	</div>
	<%@ include file="../PageUp.jsp" %>
</body>
<footer>
	<%@ include file="../Footer.jsp"%>
</footer>
<script type="text/javascript">
	function reviewPostLock(OPNUMBER, OMID, ODATE, RPSTATE, MLEVEL, button){
		$.ajax({
			url : "reviewPostLock",
			type : "post",
			data : {
				"OPNUMBER" : OPNUMBER,
				"OMID" : OMID,
				"ODATE" : ODATE,
				"RPSTATE" : (RPSTATE * -1)
			},
			dataType : "text",
			success : function(result){
				if(result == '1'){
					if(MLEVEL == 0){
						if(RPSTATE == 1){
							button.innerHTML = "복구";
						}else{
							button.innerHTML = "삭제"
						}
						button.onclick = function(){
							reviewPostLock(OPNUMBER, OMID, ODATE, (RPSTATE * -1), MLEVEL, button);
						};
					}else{
						location.href = "goReviewPostList?nowPage=${nowPage}&MID=${sessionScope.loginInfo.getMID()}&to=${to}";
					}
				}
			}
		});
	}
</script>
</html>
