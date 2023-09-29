<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@include file="component/css_files.jsp"%>

</head>
<body>
	<!-- Call NavBar -->
	<%@include file="component/navbar.jsp"%>

	<!-- Form -->
	<div class="container p-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center">Login Page</h4>
						
						<c:if test="${not empty failed}">
							<h5 class="text-center text-danger">${failed}</h5>
							<c:remove var="failed" scope="session"/>
						</c:if>		
						
						<c:if test="${not empty success}">
							<h5 class="text-center text-success">${success}</h5>
							<c:remove var="success" scope="session"/>
						</c:if>											

						<form method="post" action="login">
							<div class="mb-3">
								<label for="exampleInputEmail1" class="form-label">Email</label>
								<input type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" required="required" name="email">
							</div>

							<div class="mb-3">
								<label for="exampleInputPassword1" class="form-label">Password</label>
								<input type="password" class="form-control" id="exampleInputPassword1" required="required" name="password">
							</div>

							<div class="text-center">
								<button type="submit" class="btn text-white" style="background-color:#053B50;">Login</button><br>
								Don't have a account?<a href="register.jsp"> Create Account</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>