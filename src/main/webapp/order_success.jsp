<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Order Success</title>
		<%@include file="component/css_files.jsp"%>
	</head>
	<body>
		<!-- Call NavBar -->
		<%@include file="component/navbar.jsp"%>
		
		<div class="container text-center mt-3 p-5">
			<i class="fas fa-check-circle fa-5x text-success"></i>
			<h1>Thank You</h1>
			<h2>Successfully Ordered</h2>
			<h5>Within 2 days your product will be delivered to your address</h5>
			
			<a href="index.jsp" class="btn btn-outline-dark mt-3">Home</a>
			<a href="order.jsp" class="btn btn-light text-black mt-3">View Order</a>
		</div>
	</body>
</html>