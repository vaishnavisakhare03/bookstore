<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.DAO.BookOrderImpl" %>
<%@ page import="com.entity.Book_Order" %>
<%@ page import="com.entity.User" %>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Ordered Books</title>
		<%@include file="component/css_files.jsp"%>
	</head>
	<body>
	
		<c:if test="${empty userobj}">
			<c:redirect url="login.jsp"></c:redirect>
		</c:if>
		
		<!-- Nav Bar Component -->
		<%@include file="component/navbar.jsp"%>
		
		<div class="container">
			<h3 class="text-center p-2" style="color:#053B50;">Your Order</h3>
			<table class="table table-striped mt-3">
			  <thead class="text-white" style="background-color:#053B50;">
			    <tr>
			      <th scope="col">Order Id</th>
			      <th scope="col">User Name</th>
			      <th scope="col">Book Name</th>
			      <th scope="col">Author</th>
			      <th scope="col">Price</th>
			      <th scope="col">Payment</th>
			    </tr>
			  </thead>
			  <tbody>
			  
			  <%
			  	User u = (User)session.getAttribute("userobj");
			    BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
			    List<Book_Order> list = dao.getBook(u.getEmail());
			    
			    for(Book_Order b : list){
			  %>
			  <tr>
			      <th scope="row"><%=b.getOrderId() %></th>
			      <td><%=b.getUserName() %></td>
			      <td><%=b.getBookName() %></td>
			      <td><%=b.getAuthor() %></td>
			      <td><%=b.getPrice() %></td>
			      <td><%=b.getPaymentType() %></td>
			    </tr>
			  <%
			    }
			  %>

			  </tbody>
			</table>
		</div>
		
	</body>
</html>