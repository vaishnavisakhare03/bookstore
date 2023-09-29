<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Setting</title>
		<%@include file="component/css_files.jsp"%>
		
		<style type="text/css">
			a{
				text-decoration: none;
				color: black;
			}
			
			a:hover{
				text-decoration: none;
			}
		</style>
	</head>
	<body>
	
		<!-- If user is not logged in then he cannot open this page -->
		<c:if test="${empty userobj }">
			<c:redirect url="login.jsp"></c:redirect>
		</c:if>
		
		<!-- Nav Bar Component -->
		<%@include file="component/navbar.jsp"%>
		
		<div class="container">
			<c:if test="${not empty userobj }">
				<h3 class="text-center p-4">Hello, ${userobj.name }</h3>
			</c:if>
			
			<div class="row p-3">
				<div class="col-md-4">
					<a href="sell_book.jsp">
						<div class="card">
							<div class="card-body text-center">
								<div style="color:#053B50;">
									<i class="fa-solid fa-book-open fa-3x"></i>
								</div>
								<h4>Sell</h4>
								<p>Sell your Old Books</p>
							</div>
						</div>
					</a>	
				</div>
				
				<div class="col-md-4">
					<a href="old_book.jsp">
						<div class="card">
							<div class="card-body text-center">
								<div style="color:#64CCC5;">
									<i class="fa-solid fa-book-open fa-3x"></i>
								</div>
								<h4>Old</h4>
								<p>Old Books</p>
							</div>
						</div>
					</a>	
				</div>
				
				<div class="col-md-4">
					<a href="edit_profile.jsp">
						<div class="card">
							<div class="card-body text-center">
								<div style="color:#053B50;">
									<i class="fa-solid fa-lock fa-3x"></i>
								</div>
								<h4>Edit</h4>
								<p>Edit your Credentials</p>
							</div>
						</div>
					</a>	
				</div>
				
				<div class="col-md-6 mt-3">
					<a href="order.jsp">
						<div class="card">
							<div class="card-body text-center">
								<div style="color:#64CCC5;">
									<i class="fa-solid fa-box-open fa-3x"></i>
								</div>
								<h4>Order</h4>
								<p>Track your Oder</p>
							</div>
						</div>
					</a>	
				</div>
				
				<div class="col-md-6 mt-3">
					<a href="helpline.jsp">
						<div class="card">
							<div class="card-body text-center">
								<div style="color:#64CCC5;">
									<i class="fa-solid fa-user-circle fa-3x"></i>
								</div>
								<h4>Help Center</h4>
								<p>Need any help?</p>
							</div>
						</div>
					</a>	
				</div>
				
			</div>
		</div>
	</body>
</html>