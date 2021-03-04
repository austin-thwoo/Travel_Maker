<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
.dropdown:hover .dropdown-menu {
	display: block;
	margin-top: 0;
}
</style>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
	<div class="container">
		<ul class="navbar-nav me-auto mb-2 mb-lg-0">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="goPackageList?to=sales&nowPage=1" id="navbarDropdown" role="button" aria-expanded="false"> Package </a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown">
					<li><a class="dropdown-item" href="goPackageList?to=sales&nowPage=1">상품</a></li>
					<li><a class="dropdown-item" href="goReviewPostList?to=board&nowPage=1">후기</a></li>
				</ul>
			</li>
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="boardList?nowPage=1&BCNUMBER=0&to=board&order=BNUMBER" id="navbarDropdown" role="button" aria-expanded="false"> Board </a>
				<ul class="dropdown-menu" aria-labelledby="navbarDropdown" id="boardCategoryList"></ul>
			</li>
		</ul>
		<form action="goPackageList" class="mb-0">
			<div class="container-fluid">
				<div class="row justify-content-end">
					<div class="input-group">
						<c:choose>
							<c:when test="${!empty search}">
								<select class="form-select-sm rounded-start" name="searchType" id="button-addon2">
									<c:choose>
										<c:when test="${search.getSearchType() eq 'all'}">
											<option value="all" selected>전체</option>
										</c:when>
										<c:otherwise>
											<option value="all">전체</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${search.getSearchType() eq 'PNAME'}">
											<option value="PNAME" selected>상품명</option>
										</c:when>
										<c:otherwise>
											<option value="PNAME">상품명</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${search.getSearchType() eq 'PLONAME'}">
											<option value="PLONAME" selected>지역</option>
										</c:when>
										<c:otherwise>
											<option value="PLONAME">지역</option>
										</c:otherwise>
									</c:choose>
									<c:choose>
										<c:when test="${search.getSearchType() eq 'CNAME'}">
											<option value="CNAME" selected>카테고리</option>
										</c:when>
										<c:otherwise>
											<option value="CNAME">카테고리</option>
										</c:otherwise>
									</c:choose>
								</select>
								<input type="text" name="keyWord" class="form-control" aria-describedby="button-addon2" value="${search.getKeyWord()}">
							</c:when>
							<c:otherwise>
								<select class="form-select-sm rounded-start" name="searchType" id="button-addon2">
									<option value="all" selected>전체</option>
									<option value="PNAME">상품명</option>
									<option value="PLONAME">지역</option>
									<option value="CNAME">카테고리</option>
								</select>
								<input type="text" name="keyWord" class="form-control" aria-describedby="button-addon2">
							</c:otherwise>
						</c:choose>
						<input type="hidden" name="nowPage" value="1">
						<input type="hidden" name="to" value="search">
						<button class="btn btn-outline-secondary" type="submit" id="button-addon2">검색</button>
					</div>
				</div>
			</div>
		</form>
	</div>
</nav>
<script src="https://code.jquery.com/jquery-3.5.1.min.js" integrity="sha256-9/aliU8dGd2tb6OSsuzixeV4y/faTqgFtohetphbbj0=" crossorigin="anonymous"></script>
<script>
	$(document).ready(function() {
		$.ajax({
			url : "boardCategoryList",
			type : "get",
			dataType : "json",
			success : function(result){
						var htmlResult = "";
						for (var i in result) {
							if(result[i].BCSTATE == 1){
								htmlResult += "<li><a class='dropdown-item' href='boardList?nowPage=1&BCNUMBER=" + result[i].BCNUMBER + "&to=board&order=BNUMBER'>" + result[i].BCNAME + "</a></li>";	
							}
						}
						$("#boardCategoryList").html(htmlResult);
			}
		});
	});
</script>