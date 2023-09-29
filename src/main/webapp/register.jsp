<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Registration</title>
<%@include file="component/css_files.jsp"%>
</head>
<body style="background-color: white;">
	<!-- Call NavBar -->
	<%@include file="component/navbar.jsp"%>

	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Registration Page</h4>
						
						<c:if test="${not empty success }">
							<p class="text-center text-success">${success}</p>
							<c:remove var="success" scope="session"/>
						</c:if>
						
						<c:if test="${not empty failed }">
							<p class="text-center text-danger">${failed}</p>
							<c:remove var="failed" scope="session"/>
						</c:if>
		
						<form method="post" action="register">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Username</label> 
								<input type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="fname">								
							</div>
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email</label> 
								<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">								
							</div>
							
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Phone Number</label> 
								<input type="number" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="phno">								
							</div>
						
							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
							</div>
							
							<div class="mb-3 form-check">
								<input type="checkbox" class="form-check-input" id="exampleCheck1" name="check"> 
								<label class="form-check-label" for="exampleCheck1">Agree terms & Condition</label>
							</div>
							
							<button type="submit" class="btn text-white" style="background-color:#053B50;">Submit</button>
							
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>

</body>
</html>