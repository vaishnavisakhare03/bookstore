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
		<title>Old Books</title>
		<%@include file="component/css_files.jsp"%>
	</head>
	<body >
		<!-- Nav Bar Component -->
		<%@include file="component/navbar.jsp"%>
		
		<c:if test="${not empty success }">
			<div class="alert alert-success text-center">${success}</div>
			<c:remove var="success" scope="session"/>
		</c:if>
		
		<div class="container p-5">
		<table class="table table-striped">
		  <thead class="text-white" style="background-color:#053B50;">
		    <tr>
		      <th scope="col">Book Name</th>
		      <th scope="col">Author</th>
		      <th scope="col">Price</th>
		      <th scope="col">Category</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		  <tbody>
		  
		  <%
		  		User u = (User)session.getAttribute("userobj");
		  		String email = u.getEmail();
		  		
		  		BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		  		List<BookDetails> list = dao.getBookByOld(email, "Old");
		  		for(BookDetails b : list){
		  %>
		  
		  <tr>
		      <td><%=b.getBookName() %></td>
		      <td><%=b.getAuthor() %></td>
		      <td><%=b.getPrice() %></td>
		      <td><%=b.getBookCategory() %></td>
		      <td><a href="delete_old_book?em=<%=email%>&&id=<%=b.getBookId()%>" class="btn btn-sm btn-danger">Delete</a></td>
		  </tr>
		  
		  <%} %>		  		    
		    
		  </tbody>
		</table>
		</div>
	</body>
</html>