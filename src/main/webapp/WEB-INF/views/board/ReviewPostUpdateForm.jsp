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
	<%@ include file="../Header.jsp"%>
	<div class="my-1">
		<%@ include file="../MainNav.jsp"%>
	</div>
	<div class="container">
		<form action="reviewPostUpdate" method="post" id="reviewPostUpdateform">
			<div>
				<h3>여행 후기 수정</h3>
			</div>
			<div class="input-group mb-1">			
				<input type="text" class="form-control" name="RPTITLE" placeholder="제목을 입력하세요." value="${reviewPostDetail.getRPTITLE()}" aria-describedby="RPTITLE">
			</div>
			<div class="input-group mb-1">
				<textarea name="RPCONTENT" id="editor1">${reviewPostDetail.getRPCONTENT()}</textarea>
			</div>
	      	<div class="text-end">
				<input type="hidden" name="OMID" value="${reviewPostDetail.getOMID()}">
				<input type="hidden" name="OPNUMBER" value="${reviewPostDetail.getOPNUMBER()}">
				<input type="hidden" name="ODATE" value="${reviewPostDetail.getODATE()}">
				<input type="hidden" name="to" value="${to}">
				<button class="btn btn-primary" onclick="submitContents()">수정</button>
			</div>
		</form>
	</div>
	<%@ include file="../PageUp.jsp"%>
</body>
<footer>
	<%@ include file="../Footer.jsp"%>
</footer>
<script type="text/javascript" src="resources/ckeditor/ckeditor.js"></script>
<script type="text/javascript">
	$(function(){
		CKEDITOR.replace('editor1',{
			width : '1500px',
			height : '600px',
			filebrowserImageUploadUrl: './fileUpload'
		});
        
    });
	
    function submitContents() {
        document.getElementById("reviewPostUpdateform").submit();
    }
</script>
</html>