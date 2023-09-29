<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.BookDetails" %>

<html>
	<head>
		<meta charset="UTF-8">
		<title>Old Books</title>
		<%@include file="component/css_files.jsp"%>
		
		<style type="text/css">
			
			.card-ho:hover{
				background-color: #F1EFEF;
			}
		
		</style>
	</head>
	
	<body>
		<!-- Nav Bar Component -->
		<%@include file="component/navbar.jsp"%>
		
		<div class="container-fluid">
			<div class="row p-3">
				<% 
					BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
					List<BookDetails> list = dao.getAllOldbook();
					for(BookDetails b : list){
				%>
					<div class="col-md-3">
						<div class="card card-ho mt-4">
							<div class="card-body text-center">
								<img src="books/<%=b.getPhotoName() %>" alt="photo" style="width:100px; height:150px;" class="img-thumblin rounded m-2">
								<p>Book : <%=b.getBookName() %>
								<br>Author : <%=b.getAuthor() %>	
								<br>Category : <%=b.getBookCategory() %></p>
								
								<!-- Buttons -->
									<div class="row text-center">
										<a href="view_details.jsp?bid=<%=b.getBookId() %>" class="btn btn-sm ml-5 text-white" style="background-color:#64CCC5;">View Details</a>
										<a href="" class="btn btn-sm ml-2 text-white" style="background-color:#176B87;"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
									</div>
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