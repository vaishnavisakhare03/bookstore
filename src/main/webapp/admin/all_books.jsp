<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>
    
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.BookDetails" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>All Books</title>
		<%@include file="css_files.jsp"%>
	</head>
	<body>
		<%@include file="navbar.jsp" %>
		
		<!-- Restriction so that without login you cannot access -->
		<c:if test="${empty userobj }">
			<c:redirect url="../login.jsp"/>
		</c:if>
		
		<h3 class="text-center" style="color:#053B50;">Hello Admin</h3>
		
		<c:if test="${not empty success}">
			<h5 class="text-center text-success">${success}</h5>
			<c:remove var="success" scope="session"/>
		</c:if>	
							
		<c:if test="${not empty failed}">
			<h5 class="text-center text-danger">${failed}</h5>
			<c:remove var="failed" scope="session"/>
		</c:if>	

		<table class="table table-striped">
		  <thead class="text-white" style="background-color:#053B50;">
		    <tr>
		      <th scope="col">ID</th>
		      <th scope="col">Image</th>
		      <th scope="col">Book Name</th>
		      <th scope="col">Author</th>
		      <th scope="col">Price</th>
		      <th scope="col">Categories</th>
		      <th scope="col">Status</th>
		      <th scope="col">Action</th>
		    </tr>
		  </thead>
		  <tbody>
		  
		  <%
		  	BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
		  	List<BookDetails> list = dao.getAllBooks();
		  	for(BookDetails b : list){
		  %>
		  
		    <tr>
		      
		      <td><%=b.getBookId()%></td>
		      <td><img src="../books/<%=b.getPhotoName()%>" style="width: 50px; height:50px;"></td>
		      <td><%=b.getBookName()%></td>
		      <td><%=b.getAuthor()%></td>
		      <td><%=b.getPrice()%></td>
		      <td><%=b.getBookCategory()%></td>
		      <td><%=b.getStatus()%></td>
		      <td><a href="edit_books.jsp?id=<%=b.getBookId()%>" class="btn btn-sm text-white" style="background-color:#64CCC5;"><i class="fa-regular fa-pen-to-square"></i> Edit</a>
		      <a href="../delete?id=<%=b.getBookId() %>" class="btn btn-sm text-white" style="background-color:#176B87;"><i class="fa-solid fa-trash-can"></i> Delete</a></td>
		    </tr>
		    
		    <%
		  	}
		    %>
		   
		  </tbody>
		</table>

	</body>
</html>