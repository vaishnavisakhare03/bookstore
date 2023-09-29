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
		<title>Search Books</title>
		<%@include file="component/css_files.jsp"%>
		
		<style type="text/css">
			
			.card-ho:hover{
				background-color: #EADBC8;
			}
		
		</style>
	</head>
	
	<body>
	
		<%
			User u = (User)session.getAttribute("userobj");		
		%>
		
		<!-- Nav Bar Component -->
		<%@include file="component/navbar.jsp"%>
		
		<div class="container-fluid">
			<div class="row p-3">
				<%
					String ch = request.getParameter("ch");
					BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
					List<BookDetails> list = dao.getBookBySearch(ch);
					for(BookDetails b : list){
				%>
						
				<div class="col-md-3">
					<div class="card card-ho mt-4">
						<div class="card-body text-center">
							<img src="books/<%=b.getPhotoName() %>" alt="Java" style="width:100px; height:150px;" class="img-thumblin">
							<p><%=b.getBookName() %></p>
							<p><%=b.getAuthor() %></p>		
							
							
							<%
								if(b.getBookCategory().equals("Old")){
							%>
							
							<p>Category : <%=b.getBookCategory() %></p>	
														
							<!-- Buttons -->
							<div class="row text-center ml-5">
								<a href="view_details.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-2">View Details</a>
								<a href="" class="btn btn-danger btn-sm ml-2"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
							</div>	
							
							<%}else{ %>		
							
							<p>Category : <%=b.getBookCategory() %></p>	
														
							<!-- Buttons -->
							<div class="row text-center">
					
								<%
									if(u == null){
								%>								
									<a href="login.jsp" class="btn btn-danger btn-sm ml-4">Add Cart</a>									
								<%
									}else{
								%>
									<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-danger btn-sm ml-4">Add Cart</a>		
								<%
									}
								%>
					
								<a href="view_details.jsp?bid=<%=b.getBookId() %>" class="btn btn-success btn-sm ml-2">View Details</a>
								<a href="" class="btn btn-danger btn-sm ml-2"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
							</div>	
							
							<%} %>
						</div>
					</div>					
				</div>			
			
			<%
				}		
			%>

			</div>
		</div>
		
	</body>
</html>