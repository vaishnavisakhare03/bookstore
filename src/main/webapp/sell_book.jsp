<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Sell Book</title>
		<%@include file="component/css_files.jsp"%>
	</head>
	<body>
	
		<!-- If user is not logged in then he cannot open this page -->
		<c:if test="${empty userobj }">
			<c:redirect url="login.jsp"></c:redirect>
		</c:if>
		
		<!-- Nav Bar Component -->
		<%@include file="component/navbar.jsp"%>
		
		<div class="container">
			<div class="row mt-3">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<h5 class="text-center p-1" style="color:#053B50;">Sell Old Book</h5>
							
							<c:if test="${not empty success}">
								<h5 class="text-center text-success">${success}</h5>
								<c:remove var="success" scope="session"/>
							</c:if>	
							
							<c:if test="${not empty failed}">
								<h5 class="text-center text-danger">${failed}</h5>
								<c:remove var="failed" scope="session"/>
							</c:if>	
							
							<form action="add_old_books" method="post" enctype="multipart/form-data">
															
								<input type="hidden" value="${userobj.email}" name="user">
							
								<div class="form-group">
									<label for="exampleInputEmail1">Book Name</label>
									<input name="bname" type="text" class="form-control" id="exampleInoutEmail1" aria-describedby="emailHelp">
								</div>
								
								<div class="form-group">
									<label for="exampleInputEmail1">Author Name</label>
									<input name="author" type="text" class="form-control" id="exampleInoutEmail1" aria-describedby="emailHelp">
								</div>
							
								<div class="form-group">
									<label for="exampleInputEmail1">Price</label>
									<input name="price" type="number" class="form-control" id="exampleInoutEmail1">
								</div>
								
								<div class="form-group">
									<label for="exampleFormControlFile1">Upload Photo</label>
									<input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
								</div>
								
								<button type="submit" class="btn text-white" style="background-color:#053B50;">Sell</button>
							</form>
						
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>