<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="container">
	<ul class="list-group mb-0 py-3 pt-md-1 mt-5">
		<li class="list-group-item mb-1">
			<button class="btn d-inline-flex align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#getting-member-collapse" aria-expanded="false">
        		Member
      		</button>
      		<div class="collapse" id="getting-member-collapse">
				<ul class="list-unstyled fw-normal pb-1 small">
					<li><a class="dropdown-item" href="myPage?MID=${sessionScope.loginInfo.getMID()}&to=member">내정보 보기</a></li>
					<li><a class="dropdown-item" href="goPasswordCheckForm?to=goMemberUpdateForm">내정보 수정</a></li>
					<li><a class="dropdown-item" href="goPasswordUpdateForm">내 비밀번호 수정</a></li>
					<li><a class="dropdown-item" href="goPasswordCheckForm?to=memberDelete">탈퇴 하기</a></li>
					<li><a class="dropdown-item" href="goPointHistory?MID=${sessionScope.loginInfo.getMID()}&nowPage=1">내 포인트</a></li>
				</ul>
			</div>
		</li>
		<li class="list-group-item mb-1">
			<button class="btn d-inline-flex align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#getting-board-collapse" aria-expanded="false">
        		Board
      		</button>
      		<div class="collapse" id="getting-board-collapse">
				<ul class="list-unstyled fw-normal pb-1 small">
					<li><a class="dropdown-item" href="#"></a></li>
					<li><a class="dropdown-item" href="goMyReviewList?MID=${sessionScope.loginInfo.getMID()}">내 리뷰보기</a></li>
					<li><a class="dropdown-item" href="boardList?nowPage=1&BCNUMBER=0&to=member&MID=${sessionScope.loginInfo.getMID()}&order=BNUMBER">내 게시글 목록</a></li>
					<li><a class="dropdown-item" href="goReviewPostList?to=member&nowPage=1&MID=${sessionScope.loginInfo.getMID()}">내 후기 목록</a></li>
					<li><a class="dropdown-item" href="goMyCommentsList?MID=${sessionScope.loginInfo.getMID()}&nowPage=1">내 댓글 목록</a></li>
				</ul>
			</div>
		</li>
		<li class="list-group-item mb-1">
			<button class="btn d-inline-flex align-items-center rounded collapsed" data-bs-toggle="collapse" data-bs-target="#getting-sales-collapse" aria-expanded="false">
        		Sales
      		</button>
      		<div class="collapse" id="getting-sales-collapse">
				<ul class="list-unstyled fw-normal pb-1 small">
					<li><a class="dropdown-item" href="goPreferenceList?MID=${sessionScope.loginInfo.getMID()}">선호 카테고리</a></li>
					<li><a class="dropdown-item" href="likeList?MID=${sessionScope.loginInfo.getMID()}&nowPage=1">좋아요 목록</a></li>
					<li><a class="dropdown-item" href="goCartList?MID=${sessionScope.loginInfo.getMID()}&nowPage=1">장바구니</a></li>
					<li><a class="dropdown-item" href="goShoppingList?MID=${sessionScope.loginInfo.getMID()}&OSTATE=1&nowPage=1">계약금 결제내역</a></li>
					<li><a class="dropdown-item" href="goShoppingList?MID=${sessionScope.loginInfo.getMID()}&OSTATE=0&nowPage=1">구매내역</a></li>
				</ul>
			</div>
		</li>
	</ul>
</div>