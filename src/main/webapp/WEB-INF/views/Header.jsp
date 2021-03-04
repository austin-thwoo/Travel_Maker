<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container-fluid">
		<a class="navbar-brand" href="./?MID=${sessionScope.loginInfo.getMID()}"><img src="resources/upload/TravelMakerLogo.png" width="200" alt="Logo"></a>
		<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
				aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse justify-content-end" id="navbarSupportedContent">
			<div>
			<ul class="navbar-nav me-auto mb-2 mb-lg-0">
				<c:choose>
					<c:when test="${empty sessionScope.loginInfo}">
						<li class="nav-item">
							<a class="nav-link" href="goLoginForm">LogIn</a>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="goJoinForm">Join</a>
						</li>
					</c:when>
					<c:otherwise>
						<li class="nav-item">
							<span class="nav-link">${sessionScope.loginInfo.getMNICK()}님</span>
						</li>
						<li class="nav-item">
							<a class="nav-link" href="myPage?MID=${sessionScope.loginInfo.getMID()}&to=member">MyPage</a>
						</li>
						<c:if test="${sessionScope.loginInfo.getMLEVEL() eq 0}">
							<li class="nav-item">
								<a class="nav-link" href="adminPage?MID=${sessionScope.loginInfo.getMID()}">AdminPage</a>
							</li>
						</c:if>
						<li class="nav-item">
							<a class="nav-link" href="logout">LogOut</a>
						</li>
					</c:otherwise>
				</c:choose>
			</ul>
			</div>
		</div>
	</div>
</nav>