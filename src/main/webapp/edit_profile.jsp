<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Edit Profile</title>
		<%@include file="component/css_files.jsp"%>
	</head>
	<body>
		<!-- Nav Bar Component -->
		<%@include file="component/navbar.jsp"%>
		
		<div class="container">
			<div class="row mt-3">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
						
						<h4 class="text-center" style="color:#053B50;">Edit Profile</h4>
						
						<c:if test="${not empty failed}">
							<h5 class="text-center text-danger">${failed}</h5>
							<c:remove var="failed" scope="session"/>
						</c:if>		
						
						<c:if test="${not empty success}">
							<h5 class="text-center text-success">${success}</h5>
							<c:remove var="success" scope="session"/>
						</c:if>	
						
						<form method="post" action="update_profile">
							<input type="hidden" value="${userobj.id}" name="id">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Username</label> 
								<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname" value="${userobj.name}">								
							</div>
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email</label> 
								<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email" value="${userobj.email}">								
							</div>
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone Number</label> 
								<input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="phno" value="${userobj.phno}">								
							</div>
						
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
							</div>
							
							
							<button type="submit" class="btn text-white" style="background-color:#053B50;">Update</button>
							
						</form>
						
						</div>
					</div>
				</div>
			</div>
		</div>				
		
	</body>
</html>