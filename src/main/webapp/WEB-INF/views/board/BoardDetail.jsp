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
			<div class="col text-start">${boardDetail.getBTITLE()}</div>
			<div class="col d-flex justify-content-end text-end">
				<ul class="list-group list-group-horizontal">
					<li class="list-group-item border-0 p-1">${boardDetail.getMNICK()}</li>
					<li class="list-group-item border-0 p-1">조회 ${boardDetail.getBOARDVIEWS()}</li>
					<li class="list-group-item border-0 p-1">추천 ${boardDetail.getBOARDLIKE()}</li>
					<li class="list-group-item border-0 p-1">${fn:substring(boardDetail.getBDATE(),5,16)}</li>
				</ul>
			</div>
		</div>
		<div class="form-group">
			${boardDetail.getBCONTENT()}
		</div>
		<div class="row container-fluid">
			<div class="d-flex justify-content-center">
				<c:choose>
					<c:when test="${boardLike == 0}">
						<div class="col-1">
							<a href="#" id="boardLike" class="text-decoration-none text-dark" onclick="boardLikeInsert('${boardDetail.getBNUMBER()}', '${sessionScope.loginInfo.getMID()}', this)">
								<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
			  						<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
								</svg>
								${boardDetail.getBOARDLIKE()}
							</a>
						</div>
					</c:when>
					<c:when test="${boardLike == 1}">
						<div class="col-1">
							<a href="#" id="boardLike" class="text-decoration-none text-dark" onclick="boardLikeDelete('${boardDetail.getBNUMBER()}', '${sessionScope.loginInfo.getMID()}', this)">
								<svg xmlns="http://www.w3.org/2000/svg"	width="30" height="30" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
	 								<path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.964.22.817.533 2.512.062 4.51a9.84 9.84 0 0 1 .443-.05c.713-.065 1.669-.072 2.516.21.518.173.994.68 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.162 3.162 0 0 1-.488.9c.054.153.076.313.076.465 0 .306-.089.626-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.826 4.826 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.616.849-.231 1.574-.786 2.132-1.41.56-.626.914-1.279 1.039-1.638.199-.575.356-1.54.428-2.59z" />
								</svg>
								${boardDetail.getBOARDLIKE()}
							</a>
						</div>
					</c:when>
				</c:choose>
				<div class="col-1">
				<a class="text-decoration-none text-dark" href="#" onclick="goBoardComplaint('${boardDetail.getBNUMBER()}', '${sessionScope.loginInfo.getMID()}')">
					<svg xmlns="http://www.w3.org/2000/svg" width="30" height="30" fill="currentColor" class="bi bi-flag" viewBox="0 0 16 16">
  						<path d="M14.778.085A.5.5 0 0 1 15 .5V8a.5.5 0 0 1-.314.464L14.5 8l.186.464-.003.001-.006.003-.023.009a12.435 12.435 0 0 1-.397.15c-.264.095-.631.223-1.047.35-.816.252-1.879.523-2.71.523-.847 0-1.548-.28-2.158-.525l-.028-.01C7.68 8.71 7.14 8.5 6.5 8.5c-.7 0-1.638.23-2.437.477A19.626 19.626 0 0 0 3 9.342V15.5a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 1 0v.282c.226-.079.496-.17.79-.26C4.606.272 5.67 0 6.5 0c.84 0 1.524.277 2.121.519l.043.018C9.286.788 9.828 1 10.5 1c.7 0 1.638-.23 2.437-.477a19.587 19.587 0 0 0 1.349-.476l.019-.007.004-.002h.001M14 1.221c-.22.078-.48.167-.766.255-.81.252-1.872.523-2.734.523-.886 0-1.592-.286-2.203-.534l-.008-.003C7.662 1.21 7.139 1 6.5 1c-.669 0-1.606.229-2.415.478A21.294 21.294 0 0 0 3 1.845v6.433c.22-.078.48-.167.766-.255C4.576 7.77 5.638 7.5 6.5 7.5c.847 0 1.548.28 2.158.525l.028.01C9.32 8.29 9.86 8.5 10.5 8.5c.668 0 1.606-.229 2.415-.478A21.317 21.317 0 0 0 14 7.655V1.222z"/>
					</svg>
					신고
				</a>
				</div>
			</div>
		</div>
		<div class="row container-fluid mb-1">
			<div class="text-end">
				<a type="button" class="btn btn-outline-primary btn-md" href="boardList?nowPage=${nowPage}&BCNUMBER=${BCNUMBER}&MID=${sessionScope.loginInfo.getMID()}&to=${to}&order=${order}&searchType=${searchBoard.getSearchType()}&keyWord=${searchBoard.getKeyWord()}">목록</a>
				<a type="button" class="btn btn-outline-primary btn-md" href="nextBoardDetail?BNUMBER=${boardDetail.getBNUMBER()}&MID=${sessionScope.loginInfo.getMID()}&nowPage=${nowPage}&BCNUMBER=${BCNUMBER}&to=${to}&order=${order}&searchType=${searchBoard.getSearchType()}&keyWord=${searchBoard.getKeyWord()}&next=-1">이전</a>
				<a type="button" class="btn btn-outline-primary btn-md" href="nextBoardDetail?BNUMBER=${boardDetail.getBNUMBER()}&MID=${sessionScope.loginInfo.getMID()}&nowPage=${nowPage}&BCNUMBER=${BCNUMBER}&to=${to}&order=${order}&searchType=${searchBoard.getSearchType()}&keyWord=${searchBoard.getKeyWord()}&next=1">다음</a>
			</div>
		</div>
		<c:if test="${boardDetail.getMID() eq sessionScope.loginInfo.getMID() or sessionScope.loginInfo.getMLEVEL() == 0}">
			<div class="row container-fluid mb-1">
				<div class="text-end">
					<c:if test="${boardDetail.getMID() eq sessionScope.loginInfo.getMID()}">
						<a type="button" class="btn btn-outline-warning btn-md" href="goBoardUpdateForm?BNUMBER=${boardDetail.getBNUMBER()}">수정</a>
					</c:if>
					<c:choose>
						<c:when test="${boardDetail.getBSTATE() == 1}">
							<button type="button" class="btn btn-outline-danger btn-md" onclick="boardLock('${boardDetail.getBNUMBER()}', '${boardDetail.getBSTATE()}', '${sessionScope.loginInfo.getMLEVEL()}', this)">삭제</button>
						</c:when>
						<c:otherwise>
							<c:if test="${sessionScope.loginInfo.getMLEVEL() == 0}">
								<button type="button" class="btn btn-outline-danger btn-md" onclick="boardLock('${boardDetail.getBNUMBER()}', '${boardDetail.getBSTATE()}', '${sessionScope.loginInfo.getMLEVEL()}', this)">복구</button>
							</c:if>
						</c:otherwise>
					</c:choose>
				</div>
			</div>
		</c:if>
		
		<!-- 댓글 -->
		<div class="input-group mb-1">
			<input type="text" id="CMCONTENT" class="form-control" aria-describedby="button-addon2">
			<button id="button-addon2" class="btn btn-primary" onclick="commentsInsert('${boardDetail.getBNUMBER()}', '${sessionScope.loginInfo.getMID()}', '${sessionScope.loginInfo.getMLEVEL()}')">작성</button>
		</div>
		<div id="commentsInsertResult">
			<c:choose>
				<c:when test="${sessionScope.loginInfo.getMLEVEL() == 0}">
					<c:forEach items="${commentsList}" var="i" varStatus="status">
						<div class="row container-fluid border border-start-0 border-end-0 mb-1" id="comments${status.index}">
							<div class="col-1">
								${i.getMNICK()}
							</div>
							<div class="col">
								${i.getCMCONTENT()}
							</div>
							<div class="col-3 d-flex justify-content-end">
								<ul class="list-group list-group-horizontal">
									<li class="list-group-item border-0 p-1">
										<c:set var="flag" value="0"></c:set>
										<c:forEach items="${commentsLike}" var="j">
											<c:if test="${i.getBNUMBER() eq j.getCMBNUMBER() && i.getMID() eq j.getCMMID() && i.getCMDATE() eq j.getCMDATE()}">
												<c:set var="flag" value="${flag + 1}"></c:set>
											</c:if>
										</c:forEach>
										<c:choose>
											<c:when test="${flag == 0}">
												<a class="text-decoration-none text-dark" href="#" onclick="commentsLikeInsert('${boardDetail.getBNUMBER()}', '${i.getMID()}','${i.getCMDATE()}', '${sessionScope.loginInfo.getMID()}', this)">
													<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
								  						<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
													</svg>
													${i.getCOMMENTSLIKE()}
												</a>
											</c:when>
											<c:when test="${flag == 1}">
												<a class="text-decoration-none text-dark" href="#" onclick="commentsLikeDelete('${boardDetail.getBNUMBER()}', '${i.getMID()}','${i.getCMDATE()}', '${sessionScope.loginInfo.getMID()}', this)">
													<svg xmlns="http://www.w3.org/2000/svg"	width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
							 							<path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.964.22.817.533 2.512.062 4.51a9.84 9.84 0 0 1 .443-.05c.713-.065 1.669-.072 2.516.21.518.173.994.68 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.162 3.162 0 0 1-.488.9c.054.153.076.313.076.465 0 .306-.089.626-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.826 4.826 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.616.849-.231 1.574-.786 2.132-1.41.56-.626.914-1.279 1.039-1.638.199-.575.356-1.54.428-2.59z" />
													</svg>
													${i.getCOMMENTSLIKE()}
												</a>
											</c:when>
										</c:choose>
									</li>
									<li class="list-group-item border-0 p-1">${fn:substring(i.getCMDATE(),5,16)}</li>
									<c:choose>
										<c:when test="${i.getCMSTATE() eq 1}">								
											<li class="list-group-item border-0 p-1">
												<button class="btn btn-primary btn-sm" onclick="commentsLock('${boardDetail.getBNUMBER()}','${i.getMID()}','${i.getCMDATE()}','${i.getCMSTATE()}', '${sessionScope.loginInfo.getMLEVEL()}', this, document.getElementById('comments${status.index}'))">잠금</button>
											</li>
										</c:when>
										<c:when test="${i.getCMSTATE() eq -1}">								
											<li class="list-group-item border-0 p-1">
												<button class="btn btn-primary btn-sm" onclick="commentsLock('${boardDetail.getBNUMBER()}','${i.getMID()}','${i.getCMDATE()}','${i.getCMSTATE()}', '${sessionScope.loginInfo.getMLEVEL()}', this, document.getElementById('comments${status.index}'))">복구</button>
											</li>
										</c:when>
									</c:choose>
								</ul>
							</div>
						</div>
					</c:forEach>
				</c:when>
				<c:otherwise>
					<c:forEach items="${commentsList}" var="i" varStatus="status">
						<c:if test="${i.getCMSTATE() == 1}">
							<div class="row container-fluid border border-start-0 border-end-0 mb-1" id="comments${status.index}">
								<div class="col-1">
									${i.getMNICK()}
								</div>
								<div class="col">
									${i.getCMCONTENT()}
								</div>
								<div class="col-3 d-flex justify-content-end">
									<ul class="list-group list-group-horizontal">
										<li class="list-group-item border-0 p-1">
											<c:set var="flag" value="0"></c:set>
											<c:forEach items="${commentsLike}" var="j">
												<c:if test="${i.getBNUMBER() eq j.getCMBNUMBER() && i.getMID() eq j.getCMMID() && i.getCMDATE() eq j.getCMDATE()}">
													<c:set var="flag" value="${flag + 1}"></c:set>
												</c:if>
											</c:forEach>
											<c:choose>
												<c:when test="${flag == 0}">
													<a class="text-decoration-none text-dark" href="#" onclick="commentsLikeInsert('${boardDetail.getBNUMBER()}', '${i.getMID()}','${i.getCMDATE()}', '${sessionScope.loginInfo.getMID()}', this)">
														<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up" viewBox="0 0 16 16">
								  							<path d="M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z"/>
														</svg>
														${i.getCOMMENTSLIKE()}
													</a>
												</c:when>
												<c:when test="${flag == 1}">
													<a class="text-decoration-none text-dark" href="#" onclick="commentsLikeDelete('${boardDetail.getBNUMBER()}', '${i.getMID()}','${i.getCMDATE()}', '${sessionScope.loginInfo.getMID()}', this)">
														<svg xmlns="http://www.w3.org/2000/svg"	width="16" height="16" fill="currentColor" class="bi bi-hand-thumbs-up-fill" viewBox="0 0 16 16">
							 								<path d="M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.964.22.817.533 2.512.062 4.51a9.84 9.84 0 0 1 .443-.05c.713-.065 1.669-.072 2.516.21.518.173.994.68 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.162 3.162 0 0 1-.488.9c.054.153.076.313.076.465 0 .306-.089.626-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.826 4.826 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.616.849-.231 1.574-.786 2.132-1.41.56-.626.914-1.279 1.039-1.638.199-.575.356-1.54.428-2.59z" />
														</svg>
														${i.getCOMMENTSLIKE()}
													</a>
												</c:when>
											</c:choose>
										</li>
										<li class="list-group-item border-0 p-1">
											<a class="text-decoration-none text-dark" href="#" onclick="goCommentsComplaint('${boardDetail.getBNUMBER()}', '${i.getMID()}','${i.getCMDATE()}', '${sessionScope.loginInfo.getMID()}')">
												<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-flag" viewBox="0 0 16 16">
						  							<path d="M14.778.085A.5.5 0 0 1 15 .5V8a.5.5 0 0 1-.314.464L14.5 8l.186.464-.003.001-.006.003-.023.009a12.435 12.435 0 0 1-.397.15c-.264.095-.631.223-1.047.35-.816.252-1.879.523-2.71.523-.847 0-1.548-.28-2.158-.525l-.028-.01C7.68 8.71 7.14 8.5 6.5 8.5c-.7 0-1.638.23-2.437.477A19.626 19.626 0 0 0 3 9.342V15.5a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 1 0v.282c.226-.079.496-.17.79-.26C4.606.272 5.67 0 6.5 0c.84 0 1.524.277 2.121.519l.043.018C9.286.788 9.828 1 10.5 1c.7 0 1.638-.23 2.437-.477a19.587 19.587 0 0 0 1.349-.476l.019-.007.004-.002h.001M14 1.221c-.22.078-.48.167-.766.255-.81.252-1.872.523-2.734.523-.886 0-1.592-.286-2.203-.534l-.008-.003C7.662 1.21 7.139 1 6.5 1c-.669 0-1.606.229-2.415.478A21.294 21.294 0 0 0 3 1.845v6.433c.22-.078.48-.167.766-.255C4.576 7.77 5.638 7.5 6.5 7.5c.847 0 1.548.28 2.158.525l.028.01C9.32 8.29 9.86 8.5 10.5 8.5c.668 0 1.606-.229 2.415-.478A21.317 21.317 0 0 0 14 7.655V1.222z"/>
												</svg>
												신고
											</a>
										</li>
										<li class="list-group-item border-0 p-1">${fn:substring(i.getCMDATE(),5,16)}</li>
										<c:if test="${sessionScope.loginInfo.getMID() eq i.getMID()}">								
											<li class="list-group-item border-0 p-1">
												<button class="btn btn-primary btn-sm" onclick="commentsLock('${boardDetail.getBNUMBER()}','${i.getMID()}','${i.getCMDATE()}','${i.getCMSTATE()}', '${sessionScope.loginInfo.getMLEVEL()}', this, document.getElementById('comments${status.index}'))">잠금</button>
											</li>
										</c:if>
									</ul>
								</div>
							</div>
						</c:if>
					</c:forEach>
				</c:otherwise>
			</c:choose>
		</div>
	</div>
	<%@ include file="../PageUp.jsp" %>
</body>
<footer>
	<%@ include file="../Footer.jsp"%>
</footer>
<script type="text/javascript">
	function commentsInsert(BNUMBER, MID, MLEVEL){
		$.ajax({
			url : "commentsInsert",
			type : "post",
			data : {
				"BNUMBER" : BNUMBER,
				"MID" : MID,
				"CMCONTENT" : $("#CMCONTENT").val()
			},
			dataType : "json",
			success : function (result){
				var htmlResult = "";
				for (var i in result) {
					if(result[i].CMSTATE == 1){
						htmlResult += "<div class='row container-fluid border border-start-0 border-end-0 mb-1' id='comments"+i+"'>" +
										"<div class='col-1'>" +
											result[i].MNICK +
										"</div>" +
										"<div class='col'>" +
											result[i].CMCONTENT +
										"</div>" +
										"<div class='col-3 d-flex justify-content-end'>" +
											"<ul class='list-group list-group-horizontal'>" +
												"<li class='list-group-item border-0 p-1'>" +
													"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-hand-thumbs-up' viewBox='0 0 16 16'>" +
							  							"<path d='M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z'/>" +
													"</svg>" +
													result[i].COMMENTSLIKE +
												"</li>" +
												"<li class='list-group-item border-0 p-1'>" +
													"<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-flag' viewBox='0 0 16 16'>" +
							  							"<path d='M14.778.085A.5.5 0 0 1 15 .5V8a.5.5 0 0 1-.314.464L14.5 8l.186.464-.003.001-.006.003-.023.009a12.435 12.435 0 0 1-.397.15c-.264.095-.631.223-1.047.35-.816.252-1.879.523-2.71.523-.847 0-1.548-.28-2.158-.525l-.028-.01C7.68 8.71 7.14 8.5 6.5 8.5c-.7 0-1.638.23-2.437.477A19.626 19.626 0 0 0 3 9.342V15.5a.5.5 0 0 1-1 0V.5a.5.5 0 0 1 1 0v.282c.226-.079.496-.17.79-.26C4.606.272 5.67 0 6.5 0c.84 0 1.524.277 2.121.519l.043.018C9.286.788 9.828 1 10.5 1c.7 0 1.638-.23 2.437-.477a19.587 19.587 0 0 0 1.349-.476l.019-.007.004-.002h.001M14 1.221c-.22.078-.48.167-.766.255-.81.252-1.872.523-2.734.523-.886 0-1.592-.286-2.203-.534l-.008-.003C7.662 1.21 7.139 1 6.5 1c-.669 0-1.606.229-2.415.478A21.294 21.294 0 0 0 3 1.845v6.433c.22-.078.48-.167.766-.255C4.576 7.77 5.638 7.5 6.5 7.5c.847 0 1.548.28 2.158.525l.028.01C9.32 8.29 9.86 8.5 10.5 8.5c.668 0 1.606-.229 2.415-.478A21.317 21.317 0 0 0 14 7.655V1.222z'/>" +
													"</svg>" +
													"신고" +
												"</li>" +
												"<li class='list-group-item border-0 p-1'>" + result[i].CMDATE.substring(5, 16) + "</li>"; 
						if(result[i].MID == MID || MLEVEL == 0){
							if(result[i].CMSTATE == 1) {
								htmlResult += "<li class='list-group-item border-0 p-1'>" +
													"<button class='btn btn-primary btn-sm' onclick='commentsLock(&#39;" + ${boardDetail.getBNUMBER()} + "&#39;,&#39;" + result[i].MID + "&#39;,&#39;" + result[i].CMDATE + "&#39;,&#39;" + result[i].CMSTATE + "&#39;, " + MLEVEL + ", this, document.getElementById(&#39;comments"+i+"&#39;))'>잠금</button>" +
											"</li>";
							}else if(result[i].CMSTATE == -1 && MLEVEL == 0){
								htmlResult += "<li class='list-group-item border-0 p-1'>" +
													"<button class='btn btn-primary btn-sm' onclick='commentsLock(&#39;" + ${boardDetail.getBNUMBER()} + "&#39;,&#39;" + result[i].MID + "&#39;,&#39;" + result[i].CMDATE + "&#39;,&#39;" + result[i].CMSTATE + "&#39;, " + MLEVEL + ", this, document.getElementById(&#39;comments"+i+"&#39;))'>잠금</button>" +
											"</li>";
							}
						}
						htmlResult += "</ul>" +
										"</div>" +
									"</div>";
					}
				}
				$("#CMCONTENT").val("");
				$("#commentsInsertResult").html(htmlResult);
			}
		});
	}
	
	function boardLikeInsert(BNUMBER, MID, boardLike){
		$.ajax({
			url : "boardLikeInsert",
			data : {
				"BNUMBER" : BNUMBER,
				"MID" : MID
			},
			dataType : "text",
			type : "post",
			success : function(result){
				var out = "<svg xmlns='http://www.w3.org/2000/svg'	width='30' height='30' fill='currentColor' class='bi bi-hand-thumbs-up-fill' viewBox='0 0 16 16'>" +
								"<path d='M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.964.22.817.533 2.512.062 4.51a9.84 9.84 0 0 1 .443-.05c.713-.065 1.669-.072 2.516.21.518.173.994.68 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.162 3.162 0 0 1-.488.9c.054.153.076.313.076.465 0 .306-.089.626-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.826 4.826 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.616.849-.231 1.574-.786 2.132-1.41.56-.626.914-1.279 1.039-1.638.199-.575.356-1.54.428-2.59z' />" +
							"</svg> " +
							result;
				boardLike.onclick = function(){
					boardLikeDelete(BNUMBER, MID, boardLike);
				};
				boardLike.innerHTML = out;
			}
		});
	}
	
	function boardLikeDelete(BNUMBER, MID, boardLike){
		$.ajax({
			url : "boardLikeDelete",
			data : {
				"BNUMBER" : BNUMBER,
				"MID" : MID
			},
			dataType : "text",
			type : "post",
			success : function(result){
				var out = "<svg xmlns='http://www.w3.org/2000/svg' width='30' height='30' fill='currentColor' class='bi bi-hand-thumbs-up' viewBox='0 0 16 16'>" +
								"<path d='M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z'/>" +
							"</svg> " +
							result;
				boardLike.onclick = function(){
					boardLikeInsert(BNUMBER, MID, boardLike);
				};
				boardLike.innerHTML = out;
			}
		});
	}
	
	function goBoardComplaint(BNUMBER, MID){
		window.open("goBoardComplaint?BNUMBER="+BNUMBER+"&MID="+MID, "_blank", "menubar=0, scrollbars=1, status=0, titlebar=0, toolbar=0, left=30, top=30, width=500, height=300");
	}
	
	function goCommentsComplaint(CMBNUMBER, CMMID, CMDATE, MID){
		window.open("goCommentsComplaint?CMBNUMBER="+CMBNUMBER+"&CMMID="+CMMID+"&CMDATE="+CMDATE+"&MID="+MID, "_blank", "menubar=0, scrollbars=1, status=0, titlebar=0, toolbar=0, left=30, top=30, width=700, height=500");
	}
	
	function commentsLikeInsert(CMBNUMBER, CMMID, CMDATE, MID, CommentsLike){
		$.ajax({
			url : "commentsLikeInsert",
			data : {
				"CMBNUMBER" : CMBNUMBER,
				"CMMID" : CMMID,
				"CMDATE" : CMDATE,
				"MID" : MID
			},
			dataType : "text",
			type : "post",
			success : function(result){
				var out = "<svg xmlns='http://www.w3.org/2000/svg'	width='16' height='16' fill='currentColor' class='bi bi-hand-thumbs-up-fill' viewBox='0 0 16 16'>" +
								"<path d='M6.956 1.745C7.021.81 7.908.087 8.864.325l.261.066c.463.116.874.456 1.012.964.22.817.533 2.512.062 4.51a9.84 9.84 0 0 1 .443-.05c.713-.065 1.669-.072 2.516.21.518.173.994.68 1.2 1.273.184.532.16 1.162-.234 1.733.058.119.103.242.138.363.077.27.113.567.113.856 0 .289-.036.586-.113.856-.039.135-.09.273-.16.404.169.387.107.819-.003 1.148a3.162 3.162 0 0 1-.488.9c.054.153.076.313.076.465 0 .306-.089.626-.253.912C13.1 15.522 12.437 16 11.5 16H8c-.605 0-1.07-.081-1.466-.218a4.826 4.826 0 0 1-.97-.484l-.048-.03c-.504-.307-.999-.609-2.068-.722C2.682 14.464 2 13.846 2 13V9c0-.85.685-1.432 1.357-1.616.849-.231 1.574-.786 2.132-1.41.56-.626.914-1.279 1.039-1.638.199-.575.356-1.54.428-2.59z' />" +
							"</svg> " +
							result;
				CommentsLike.onclick = function(){
					commentsLikeDelete(CMBNUMBER, CMMID, CMDATE, MID, CommentsLike);
				};
				CommentsLike.innerHTML = out;
			}
		});
	}
	
	function commentsLikeDelete(CMBNUMBER, CMMID, CMDATE, MID, CommentsLike){
		$.ajax({
			url : "commentsLikeDelete",
			data : {
				"CMBNUMBER" : CMBNUMBER,
				"CMMID" : CMMID,
				"CMDATE" : CMDATE,
				"MID" : MID
			},
			dataType : "text",
			type : "post",
			success : function(result){
				var out = "<svg xmlns='http://www.w3.org/2000/svg' width='16' height='16' fill='currentColor' class='bi bi-hand-thumbs-up' viewBox='0 0 16 16'>" +
								"<path d='M8.864.046C7.908-.193 7.02.53 6.956 1.466c-.072 1.051-.23 2.016-.428 2.59-.125.36-.479 1.013-1.04 1.639-.557.623-1.282 1.178-2.131 1.41C2.685 7.288 2 7.87 2 8.72v4.001c0 .845.682 1.464 1.448 1.545 1.07.114 1.564.415 2.068.723l.048.03c.272.165.578.348.97.484.397.136.861.217 1.466.217h3.5c.937 0 1.599-.477 1.934-1.064a1.86 1.86 0 0 0 .254-.912c0-.152-.023-.312-.077-.464.201-.263.38-.578.488-.901.11-.33.172-.762.004-1.149.069-.13.12-.269.159-.403.077-.27.113-.568.113-.857 0-.288-.036-.585-.113-.856a2.144 2.144 0 0 0-.138-.362 1.9 1.9 0 0 0 .234-1.734c-.206-.592-.682-1.1-1.2-1.272-.847-.282-1.803-.276-2.516-.211a9.84 9.84 0 0 0-.443.05 9.365 9.365 0 0 0-.062-4.509A1.38 1.38 0 0 0 9.125.111L8.864.046zM11.5 14.721H8c-.51 0-.863-.069-1.14-.164-.281-.097-.506-.228-.776-.393l-.04-.024c-.555-.339-1.198-.731-2.49-.868-.333-.036-.554-.29-.554-.55V8.72c0-.254.226-.543.62-.65 1.095-.3 1.977-.996 2.614-1.708.635-.71 1.064-1.475 1.238-1.978.243-.7.407-1.768.482-2.85.025-.362.36-.594.667-.518l.262.066c.16.04.258.143.288.255a8.34 8.34 0 0 1-.145 4.725.5.5 0 0 0 .595.644l.003-.001.014-.003.058-.014a8.908 8.908 0 0 1 1.036-.157c.663-.06 1.457-.054 2.11.164.175.058.45.3.57.65.107.308.087.67-.266 1.022l-.353.353.353.354c.043.043.105.141.154.315.048.167.075.37.075.581 0 .212-.027.414-.075.582-.05.174-.111.272-.154.315l-.353.353.353.354c.047.047.109.177.005.488a2.224 2.224 0 0 1-.505.805l-.353.353.353.354c.006.005.041.05.041.17a.866.866 0 0 1-.121.416c-.165.288-.503.56-1.066.56z'/>" +
							"</svg> " +
							result;
				CommentsLike.onclick = function(){
					commentsLikeInsert(CMBNUMBER, CMMID, CMDATE, MID, CommentsLike);
				};
				CommentsLike.innerHTML = out;
			}
		});
	}
	
	function commentsLock(BNUMBER, MID, CMDATE, CMSTATE, MLEVEL, button, commentsIdx){
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
					if(MLEVEL == 0){
						if (CMSTATE == 1) {
							button.innerHTML = "복구";	
						}else{
							button.innerHTML = "잠금";
						}
						button.onclick=function(){
							commentsLock(BNUMBER, MID, CMDATE, (CMSTATE*-1), MLEVEL, button, commentsIdx);
						};
					}else{
						var parent = document.getElementById("commentsInsertResult");
						parent.removeChild(commentsIdx);
					}
				}
				
			}
		});
	}
	
	function boardLock(BNUMBER, BSTATE, MLEVEL, button){
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
					if(MLEVEL == 0){
						if(BSTATE == 1){
							button.innerHTML = "복구";
						}else{
							button.innerHTML = "삭제"
						}
						button.onclick = function(){
							boardLock(BNUMBER, (BSTATE * -1), MLEVEL, button);
						};
					}else{
						location.href = "boardList?nowPage=${nowPage}&BCNUMBER=${BCNUMBER}&to=${to}";
					}
				}
			}
		});
	}
</script>
</html>
