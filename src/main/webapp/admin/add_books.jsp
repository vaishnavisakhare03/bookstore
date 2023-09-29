<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Add Books</title>
		<%@include file="css_files.jsp" %>
	</head>
	
	<body style="background-color: white">
		<%@include file="navbar.jsp" %>
		
		<!-- Restriction so that without login you cannot access -->
		<c:if test="${empty userobj }">
			<c:redirect url="../login.jsp"/>
		</c:if>
	
		<div class="container p-5">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center" style="color:#053B50;">Add Books</h4>
							
							<c:if test="${not empty success}">
								<h5 class="text-center text-success">${success}</h5>
								<c:remove var="success" scope="session"/>
							</c:if>	
							
							<c:if test="${not empty failed}">
								<h5 class="text-center text-danger">${failed}</h5>
								<c:remove var="failed" scope="session"/>
							</c:if>	
							
							<form action="../add_books" method="post" enctype="multipart/form-data">
							
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
									<label for="inputState">Book Categories</label>
									<select name="categories" class="form-control" id="inputState">
									<option selected>---select---</option>
									<option value="New">New Book</option>
									</select>
								</div>
								
								<div class="form-group">
									<label for="inputState">Book Status</label>
									<select name="status" class="form-control" id="inputState">
									<option selected>---select---</option>
									<option value="Active">Active</option>
									<option value="Inactive">Inactive</option>
									</select>
								</div>
								
								<div class="form-group">
									<label for="exampleFormControlFile1">Upload Photo</label>
									<input name="bimg" type="file" class="form-control-file" id="exampleFormControlFile1">
								</div>
								
								<button type="submit" class="btn text-white" style="background-color:#053B50;">Add</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>