<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.BookDetails" %>
<%@ page import="com.entity.User" %>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Details</title>
		<%@include file="component/css_files.jsp"%>
	</head>
	
	<body style="background-color: white;">
	
		<%
			User u = (User)session.getAttribute("userobj");		
		%>
		
		<!-- Nav Bar Component -->
		<%@include file="component/navbar.jsp"%>
		
		<%
			int bid = Integer.parseInt(request.getParameter("bid"));
			BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
			BookDetails b = dao.getBookById(bid);
		%>
		
		<div class="container p-5">
			<div class="row">
			<!-- Left Part -->
				<div class="col-md-6 text-center p-5 border bg-white">
					<img src="books/<%=b.getPhotoName() %>" style="height:150px; width:100px" class="rounded"><br>
					<h4 class="mt-3">Book Name : <span class="text-success"><%=b.getBookName() %></span></h4>
					<h4>Author Name : <span class="text-success"><%=b.getAuthor() %></span></h4>
					<h4>Category : <span class="text-success"><%=b.getBookCategory() %></span></h4>
				</div>
				
			<!-- Right Part -->
				<div class="col-md-6 text-center p-5 border bg-white">
					<h2><%=b.getBookName() %></h2>
					
					<% 
						if("Old".equals(b.getBookCategory())){
							%>
							<h5>Contact to Seller</h5>
							<h5>Email : <%=b.getEmail() %></h5>
							<%
						}
					%>
					
					<div class="row">
						<div class="col-md-4 text-success p-2">
							<i class="fa-solid fa-money-bill-1-wave fa-2x"></i>
							<p>Cash On Delivery</p>
						</div>
						
						<div class="col-md-4 text-success p-2">
							<i class="fa-solid fa-rotate-left fa-2x"></i>
							<p>Return Available</p>
						</div>
						
						<div class="col-md-4 text-success p-2">
							<i class="fa-solid fa-truck fa-2x"></i>
							<p>Free Shipping</p>
						</div>						
					</div>
					
					<%
						if("Old".equals(b.getBookCategory())){
					%>
						<div class="text-center p-3">
							<a href="index.jsp" class="btn text-white" style="background-color:#64CCC5;"><i class="fa-solid fa-cart-shopping"></i> Continue Shopping</a>
							<a href="" class="btn text-white" style="background-color:#176B87;"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					<%
						}else{
					%>
						<div class="text-center p-3">
							<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn text-white" style="background-color:#64CCC5;"><i class="fa-solid fa-cart-shopping"></i>Add to Cart</a>
							<a href="" class="btn text-white" style="background-color:#176B87;"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
						</div>
					
					<%
						}
					%>
					
					
				</div>
			</div>
		</div>
	</body>
</html>
				