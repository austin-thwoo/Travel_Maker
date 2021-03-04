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
		<%@ include file="../MainNav.jsp" %>
	</div>
	<div class="container">
	    <form action="boardUpdate" method="post" name="boardUpdateform">
	    	<div class="input-group mb-1">
	      		<select class="from-select-sm rounded-start" id="BTITLE" name="BCNUMBER">
		      		<c:forEach items="${boardCategoryList}" var="i">
		      			<c:choose>
		      				<c:when test="${boardDetail.getBCNUMBER() == i.getBCNUMBER()}">
		      					<option value="${i.getBCNUMBER()}" selected="selected">${i.getBCNAME()}</option>
		      				</c:when>
		      				<c:otherwise>
		      					<option value="${i.getBCNUMBER()}">${i.getBCNAME()}</option>
		      				</c:otherwise>
		      			</c:choose>
		      		</c:forEach>
	      		</select>
	        	<input type="text" class="form-control" name="BTITLE" placeholder="제목을 입력하세요." aria-describedby="BTITLE" value="${boardDetail.getBTITLE()}">
	      	</div>
	      
	    	<div class="input-group mb-1">
				<textarea name="BCONTENT" id="editor1">${boardDetail.getBCONTENT()}</textarea>
			</div>
	      	<div class="text-end">
	      		<input type="hidden" name="BNUMBER" value="${boardDetail.getBNUMBER()}">
		      	<button type="submit" class="btn btn-primary">수정</button>
	      		<button type="reset" class="btn btn-danger">취소</button>
	      	</div>
	    </form>
	</div>
	<%@ include file="../PageUp.jsp" %>
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
        document.getElementById("boardUpdateform").submit();
    }
</script>
</html>