<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.DAO.CartDAOImpl" %>
<%@ page import="com.entity.Cart" %>
<%@ page import="com.entity.User" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Cart</title>
		<%@include file="component/css_files.jsp"%>
	</head>
	
	<body>
		<!-- Call NavBar -->
		<%@include file="component/navbar.jsp"%>
		
		<!-- If user is not logged in then he cannot open this page -->
		<c:if test="${empty userobj}">
			<c:redirect url="login.jsp"></c:redirect>
		</c:if>
		
		<!-- Display message if book is delete from cart or no -->
		<c:if test="${not empty success}">
			<div class="alert alert-success" role="alert">${success }</div>
			<c:remove var="success" scope="session"/>
		</c:if>
		
		<c:if test="${not empty failed}">
			<div class="alert alert-danger text-center" role="alert">${failed }</div>
			<c:remove var="failed" scope="session"/>
		</c:if>
		
		<div class="container">
			<div class="row p-4">
				<div class="col-md-6">
					<div class="card bg-white">
						<div class="card-body">
							<h3 class="text-center" style="color:#053B50;">Your Selected Item</h3>
							
							<table class="table table-striped">
								<thead class="text-white" style="background-color:#053B50;">
									<tr>
										<th scope="col">Book Name</th>
										<th scope="col">Author</th>
										<th scope="col">Price</th>
										<th scope="col">Action</th>
									</tr>
								</thead>
								<tbody>
								
									<%
										User u = (User)session.getAttribute("userobj");
										CartDAOImpl dao = new CartDAOImpl(DBConnect.getConn());
										List<Cart> cart = dao.getBookByUser(u.getId());
										
										Double totalPrice=0.0;
										for(Cart c : cart){
											totalPrice = c.getTotalPrice();
									%>
										<tr>
											<th scope="row"><%=c.getBookName()%></th>
											<td><%=c.getAuthor()%></td>
											<td><%=c.getPrice()%></td>
											<td><a href="remove_book?bid=<%=c.getBid()%>&&uid=<%=c.getUserid()%>&&cid=<%=c.getCid()%>" class="btn btn-sm btn-danger">Remove</a></td>
										</tr>
									
									<%
										}
									%>
									
									<tr>
										<td>Total Price</td>
										<td></td>
										<td><%=totalPrice %></td>										
									</tr>									
								</tbody>
							</table>
						</div>
					</div>
				</div>
				
				<div class="col-md-6">
					<div class="card">
						<div class="card-body">
							<h3 class="text-center" style="color:#053B50;">Your Details for Order</h3>
	
							<form method="post" action="order">
								<input type="hidden" value="${userobj.id}" name="id">
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="inputEmail4">Name</label> 
										<input name="name" type="text" class="form-control" id="inputEmail4" value="${userobj.name}" required>
									</div>
	
									<div class="form-group col-md-6">
										<label for="inputPassword4">Email</label> 
										<input name="email" type="email" class="form-control" id="inputPassword4" value="${userobj.email}" required>
									</div>
								</div>
	
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="inputEmail4">Phone Number</label> 
										<input name="phno" type="number" class="form-control" id="inputEmail4" value="${userobj.phno}" required>
									</div>
									<div class="form-group col-md-6">
										<label for="inputPassword4">Address</label> 
										<input name="address" type="text" class="form-control" id="inputPassword4" required>
									</div>
								</div>
	
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="inputEmail4">Landmark</label> 
										<input name="landmark" type="text" class="form-control" id="inputEmail4" required>
									</div>
									<div class="form-group col-md-6">
										<label for="inputPassword4">City</label> 
										<input name="city" type="text" class="form-control" id="inputPassword4" required>
									</div>
								</div>
								
								<div class="form-row">
									<div class="form-group col-md-6">
										<label for="inputEmail4">State</label> 
										<input name="state" type="text" class="form-control" id="inputEmail4" required>
									</div>
									<div class="form-group col-md-6">
										<label for="inputPassword4">Pin Code</label> 
										<input name="pinCode" type="text" class="form-control" id="inputPassword4" required>
									</div>
								</div>
								
								<div class="form-group">
									<label>Payment Mode</label>
									<select class="form-control" name="payment">
										<option value="noselect">--Select--</option>
										<option value="cod">Cash On Delivery</option>
										<option value="op">Online Payment</option>
									</select>
								</div>
								
								<div class="text-center">
									<button class="btn text-white" style="background-color:#64CCC5;">Order Now</button>
									<a href="index.jsp" class="btn text-white" style="background-color:#176B87;">Continue Shopping</a>
								</div>
								
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</body>
</html>