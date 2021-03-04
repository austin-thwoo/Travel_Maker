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
		<div class="row">
			<div class="col-3">
				<%@ include file="../AdminNav.jsp" %>
			</div>
			<div class="col justify-content-start">
				<table class="table table-striped">
					<thead>
						<tr>
							<th>게시글 번호</th>
							<th>게시글 제목</th>
							<th>댓글내용</th>
							<th>작성자</th>
							<th>등록일</th>
							<th>추천수</th>
							<th>신고횟수</th>
							<th>잠금</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${commentsList}" var = "i">
							<tr>
								<td>${i.getBNUMBER()}</td>
								<td><a href="goBoardDetail?BNUMBER=${i.getBNUMBER()}&MID=${sessionScope.loginInfo.getMID()}&nowPage=1&BCNUMBER=0&to=board&order=BNUMBER" target="_blank">${i.getBTITLE()}</a></td>
								<td>${i.getCMCONTENT()}</td>
								<td>${i.getMNICK()}</td>
								<td>${fn:substring(i.getCMDATE(),5,16)}</td>
								<td>${i.getCOMMENTSLIKE()}</td>
								<td><a href="javascript:complaintCommentsDetail('${i.getBNUMBER()}', '${i.getMID()}', '${i.getCMDATE()}')">${i.getCOMMENTSCOMPLAINT()}</a></td>
								<td>
									<c:choose>
										<c:when test="${i.getCMSTATE() == 1}">
											<button class="btn btn-primary btn-sm" onclick="commentsLock('${i.getBNUMBER()}', '${i.getMID()}', '${i.getCMDATE()}', '${i.getCMSTATE()}', this)">잠금</button>
										</c:when>
										<c:when test="${i.getCMSTATE() == -1}">
											<button class="btn btn-primary btn-sm" onclick="commentsLock('${i.getBNUMBER()}', '${i.getMID()}', '${i.getCMDATE()}', '${i.getCMSTATE()}', this)">복구</button>
										</c:when>
									</c:choose>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<div class="row container-fluid">
					<div class="d-flex justify-content-center">
						<nav aria-label="Page navigation example">
							<ul class="pagination">
								<c:choose>
									<c:when test="${page.getStartPage() eq 1}">
										<li class="page-item disabled">
											<a class="page-link" href="#" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a class="page-link" href="goComplaintCommentsList?nowPage=${page.getStartPage() - 1}&MID=${MID}" aria-label="Previous">
												<span aria-hidden="true">&laquo;</span>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
								<c:forEach var="i" begin="${page.getStartPage()}" end="${page.getEndPage()}" step="1">
									<c:choose>
										<c:when test="${i eq page.getNowPage()}">
											<li class="page-item disabled">
												<a class="page-link" href="#">${i}</a>
											</li>
										</c:when>
										<c:otherwise>
											<li class="page-item">
												<a class="page-link" href="goComplaintCommentsList?nowPage=${i}&MID=${MID}">${i}</a>
											</li>
										</c:otherwise>
									</c:choose>
								</c:forEach>
								<c:choose>
									<c:when test="${page.getEndPage() eq page.getLastPage()}">
										<li class="page-item disabled">
											<a class="page-link disabled" href="#" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</c:when>
									<c:otherwise>
										<li class="page-item">
											<a class="page-link" href="goComplaintCommentsList?nowPage=${page.getEndPage() + 1}&MID=${MID}" aria-label="Next">
												<span aria-hidden="true">&raquo;</span>
											</a>
										</li>
									</c:otherwise>
								</c:choose>
							</ul>
						</nav>
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
<script type="text/javascript">
	function commentsLock(BNUMBER, MID, CMDATE, CMSTATE, button){
		$.ajax({
			url: "commentsLock",
			data: {
				"BNUMBER": BNUMBER,
				"MID": MID,
				"CMDATE": CMDATE,
				"CMSTATE": (CMSTATE * -1) 
			},
			dataType : "Text",
			type: "post",
			success : function(result){
				if (result == 1) {
					if (CMSTATE == 1) {
						button.innerHTML = "복구";	
					}else{
						button.innerHTML = "잠금";
					}
					button.onclick=function(){
						commentsLock(BNUMBER, MID, CMDATE, (CMSTATE*-1), button);
					};
				}
				
			}
		});
	}
	
	function complaintCommentsDetail(BNUMBER, MID, CMDATE){
		window.open("complaintCommentsDetail?BNUMBER="+BNUMBER+"&MID="+MID+"&CMDATE="+CMDATE, "_blank", "menubar=0, scrollbars=1, status=0, titlebar=0, toolbar=0, left=30, top=30, width=700, height=500");
	}
</script>
</html>
