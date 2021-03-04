<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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
	<div class="container mt-2">
		<c:choose>
			<c:when test="${!empty boardCategory.getBCNAME()}">
				<h1>${boardCategory.getBCNAME()}</h1>
			</c:when>
			<c:otherwise>
				<h1>전체</h1>
			</c:otherwise>
		</c:choose>
		<table class="table table-hover text-center">
			<thead>
				<tr class="table-secondary">
					<th><a href="boardList?nowPage=1&BCNUMBER=${BCNUMBER}&to=${to}&order=BNUMBER&searchType=${searchBoard.getSearchType()}&keyWord=${searchBoard.getKeyWord()}">번호</a></th>
					<th>제목</th>
					<th>작성자</th>
					<th>등록일</th>
					<th><a href="boardList?nowPage=1&BCNUMBER=${BCNUMBER}&to=${to}&order=BOARDVIEWS&searchType=${searchBoard.getSearchType()}&keyWord=${searchBoard.getKeyWord()}">조회수</a></th>
					<th><a href="boardList?nowPage=1&BCNUMBER=${BCNUMBER}&to=${to}&order=BOARDLIKE&searchType=${searchBoard.getSearchType()}&keyWord=${searchBoard.getKeyWord()}">추천수</a></th>
					<c:if test="${sessionScope.loginInfo.getMLEVEL() == 0}">
						<th>신고수</th>
						<th>잠금</th>
					</c:if>
				</tr>
			</thead>
			<c:forEach items="${boardList}" var="i" varStatus="status">
				<c:choose>
					<c:when test="${sessionScope.loginInfo.getMLEVEL() == 0}">
						<tr>
							<td>${i.getBNUMBER()}</td>
							<td><a href="goBoardDetail?BNUMBER=${i.getBNUMBER()}&MID=${sessionScope.loginInfo.getMID()}&nowPage=${page.getNowPage()}&BCNUMBER=${BCNUMBER}&to=${to}&order=${order}&searchType=${searchBoard.getSearchType()}&keyWord=${searchBoard.getKeyWord()}">${i.getBTITLE()}</a></td>
							<td>${i.getMNICK()}</td>
							<td>${fn:substring(i.getBDATE(),5,16)}</td>
							<td>${i.getBOARDVIEWS()}</td>
							<td>${i.getBOARDLIKE()}</td>
							<th>${i.getBOARDCOMPLAINT()}</th>
							<th>
								<c:choose>
		    						<c:when test="${i.getBSTATE() eq 1}">								
										<button class="btn btn-primary btn-sm" type="button" onclick="boardLock('${i.getBNUMBER()}', '${i.getBSTATE()}', this)">잠금</button>
									</c:when>
									<c:otherwise>
										<button class="btn btn-primary btn-sm" type="button" onclick="boardLock('${i.getBNUMBER()}', '${i.getBSTATE()}', this)">복구</button>
									</c:otherwise>
								</c:choose>								
							</th>
						</tr>
					</c:when>
					<c:otherwise>
						<c:choose>
							<c:when test="${i.getBSTATE() eq 1}">
								<tr>
									<td>${i.getBNUMBER()}</td>
									<td><a href="goBoardDetail?BNUMBER=${i.getBNUMBER()}&MID=${sessionScope.loginInfo.getMID()}&nowPage=${page.getNowPage()}&BCNUMBER=${BCNUMBER}&to=${to}&order=${order}&searchType=${searchBoard.getSearchType()}&keyWord=${searchBoard.getKeyWord()}">${i.getBTITLE()}</a></td>
									<td>${i.getMNICK()}</td>
									<td>${fn:substring(i.getBDATE(),5,16)}</td>
									<td>${i.getBOARDVIEWS()}</td>
									<td>${i.getBOARDLIKE()}</td>
								</tr>
							</c:when>
							<c:otherwise>
								<tr>
									<td>${i.getBNUMBER()}</td>
									<td colspan="5">삭제된 게시글 입니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
					</c:otherwise>
				</c:choose>
			</c:forEach>
		</table>
		<c:if test="${!empty sessionScope.loginInfo}">
			<div class="row container-fluid mb-1">
				<div class="text-end">
					<button class="btn btn-primary btn-md" onclick="location.href = 'goBoardInsertForm'">글쓰기</button>
				</div>
			</div>
		</c:if>
		
		<form action="boardList">
			<div class="row container-fluid mb-1">
				<div class="input-group">
					<c:choose>
						<c:when test="${!empty searchBoard}">
							<select class="form-select-sm rounded-start" name="searchType" id="button-addon2">
								<c:choose>
									<c:when test="${searchBoard.getSearchType() eq 'all'}">
										<option value="all" selected>전체</option>
									</c:when>
									<c:otherwise>
										<option value="all">전체</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${searchBoard.getSearchType() eq 'BTITLE'}">
										<option value="BTITLE" selected>제목</option>
									</c:when>
									<c:otherwise>
										<option value="BTITLE">제목</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${searchBoard.getSearchType() eq 'BCONTENT'}">
										<option value="BCONTENT" selected>내용</option>
									</c:when>
									<c:otherwise>
										<option value="BCONTENT">내용</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${searchBoard.getSearchType() eq 'MNICK'}">
										<option value="MNICK" selected>작성자</option>
									</c:when>
									<c:otherwise>
										<option value="MNICK">작성자</option>
									</c:otherwise>
								</c:choose>
								<c:choose>
									<c:when test="${searchBoard.getSearchType() eq 'BTITLE,BCONTENT'}">
										<option value="BTITLE,BCONTENT" selected>제목+내용</option>
									</c:when>
									<c:otherwise>
										<option value="BTITLE,BCONTENT">제목+내용</option>
									</c:otherwise>
								</c:choose>
							</select>
							<input type="text" name="keyWord" class="form-control" aria-describedby="button-addon2" value="${searchBoard.getKeyWord()}">
						</c:when>
						<c:otherwise>
							<select class="form-select-sm rounded-start" name="searchType" id="button-addon2">
								<option value="all" selected>전체</option>
								<option value="BTITLE">제목</option>
								<option value="BCONTENT">내용</option>
								<option value="MNICK">작성자</option>
								<option value="BTITLE,BCONTENT">제목+내용</option>
							</select>
							<input type="text" name="keyWord" class="form-control" aria-describedby="button-addon2">
						</c:otherwise>
					</c:choose>
					<input type="hidden" name="nowPage" value="1">
					<input type="hidden" name="BCNUMBER" value="${BCNUMBER}">
					<input type="hidden" name="to" value="searchB">
					<input type="hidden" name="order" value="${order}">
					<button id="button-addon2" type="submit" class="btn btn-outline-primary">검색</button>
				</div>
			</div>
		</form>

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
									<a class="page-link" href="boardList?nowPage=${page.getStartPage() - 1}&BCNUMBER=${BCNUMBER}&to=${to}&order=${order}&searchType=${searchBoard.getSearchType()}&keyWord=${searchBoard.getKeyWord()}" aria-label="Previous">
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
										<a class="page-link" href="boardList?nowPage=${i}&BCNUMBER=${BCNUMBER}&to=${to}&order=${order}&searchType=${searchBoard.getSearchType()}&keyWord=${searchBoard.getKeyWord()}">${i}</a>
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
									<a class="page-link" href="boardList?nowPage=${page.getEndPage() + 1}&BCNUMBER=${BCNUMBER}&to=${to}&order=${order}&searchType=${searchBoard.getSearchType()}&keyWord=${searchBoard.getKeyWord()}" aria-label="Next">
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
	<%@ include file="../PageUp.jsp" %>
</body>
<footer>
	<%@ include file="../Footer.jsp"%>
</footer>
<script type="text/javascript">
	function boardLock(BNUMBER, BSTATE, button){
		$.ajax({
			url : "boardLock",
			type : "post",
			data : {
				"BNUMBER" : BNUMBER,
				"BSTATE" : (BSTATE * -1)
			},
			dataType : "text",
			success : function(result){
				if(result == '1'){
					if(BSTATE == 1){
						button.innerHTML = "복구";
					}else{
						button.innerHTML = "잠금"
					}
					button.onclick = function(){
						boardLock(BNUMBER, (BSTATE * -1), button);
					};
				}
			}
		});
	}
</script>
</html>
