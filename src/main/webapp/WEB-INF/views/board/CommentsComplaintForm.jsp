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
	crossorigin="anonymous"></script>
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div class="row justify-content-center">
			<div class="col-8">
				<div class="card text-white bg-secondary">
					<div class="card-header">댓글 신고하기</div>
					<div class="card-body">
						<div class="form-group">
							<form action="commentsComplaintInsert">
								<label for="content">신고사유</label>
								<textarea class="form-control" name="CCREASON"></textarea>
								<input type="hidden" name="MID" value="${complaint.getMID()}">
								<input type="hidden" name="CMBNUMBER" value="${complaint.getCMBNUMBER()}">
								<input type="hidden" name="CMDATE" value="${complaint.getCMDATE()}">
								<input type="hidden" name="CMMID" value="${complaint.getCMMID()}">
								<button type="submit" class="btn btn-danger">신고</button>
								<button type="submit" class="btn btn-danger" onclick="WinClose()">취소</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
<script>
	function WinClose() {
		window.close();
	}
</script>
</html>
