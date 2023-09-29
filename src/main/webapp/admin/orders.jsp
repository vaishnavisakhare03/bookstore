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
		<title>All Orders</title>
		<%@include file="css_files.jsp"%>
	</head>
	<body>
	
		<!-- Restriction so that without login you cannot access -->
		<c:if test="${empty userobj }">
			<c:redirect url="../login.jsp"/>
		</c:if>
		
		<%@include file="navbar.jsp" %>
		<h3 class="text-center" style="color:#053B50;">Hello Admin</h3>

		<table class="table table-striped">
		  <thead class="text-white" style="background-color:#053B50;">
		    <tr>
		      <th scope="col">Order Id</th>
		      <th scope="col">Name</th>
		      <th scope="col">Email</th>
		      <th scope="col">Address</th>
		      <th scope="col">Ph No</th>
		      <th scope="col">Book Name</th>
		      <th scope="col">Author</th>
		      <th scope="col">Price</th>
		      <th scope="col">Payment type</th>
		    </tr>
		  </thead>
		  <tbody>
		  
		  <%
		  	BookOrderImpl dao = new BookOrderImpl(DBConnect.getConn());
		  	List<Book_Order> list = dao.getAllBookOrder();
		  	for(Book_Order b : list){
		  
		  %>		  		  
		    <tr>
		      <th scope="row"><%=b.getOrderId() %></th>
		      <td><%=b.getUserName() %></td>
		      <td><%=b.getEmail() %></td>
		      <td><%=b.getFulladd() %></td>
		      <td><%=b.getPhno() %></td>
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
		
		
	</body>
</html>