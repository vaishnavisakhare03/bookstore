<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.BookDetails" %>
<%@ page import="com.entity.User" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>BookStore</title>
		<%@include file="component/css_files.jsp"%>
		<style type="text/css">
			.back-img{
				background: url("image/book_cover.jpg");
				height: 50vh;
				width: 100%;
				background-repeat: no-repeat;
				background-size: cover;
			}
			
			.card-ho:hover{
				background-color: #F1EFEF;
			}
			
			hr {
				background-color: #fff;
				border-top: 2px dashed #8c8b8b;
			}
		
		</style>
	</head>

	<body style="background-color: white;">
	
		<%
			User u = (User)session.getAttribute("userobj");		
		%>
	
		<!-- Nav Bar Component -->
		<%@include file="component/navbar.jsp"%>
	
		<!-- Book Cover -->
		<div class="container-fluid back-img"></div>
		
		<!-- Recent Books -->
		<div class="container-fluid">
			<h3 class="text-center m-3" style="color:#053B50;">Recent Books</h3>
			<div class="row">
			
			<%
				BookDAOImpl dao1 = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list1 = dao1.getRecentBook();
				for(BookDetails b : list1){
			%>
						
				<div class="col-md-3">
					<div class="card card-ho">
						<div class="card-body text-center">
							<img src="books/<%=b.getPhotoName() %>" alt="Java" style="width:150px; height:200px;" class="img-thumblin rounded m-2">
							<p>Book : <%=b.getBookName() %>
							<br>Author : <%=b.getAuthor() %>	
							<br>Category : <%=b.getBookCategory() %></p>	
							
							<%
								if(b.getBookCategory().equals("Old")){
							%>
							
														
							<!-- Buttons -->
							<div class="row text-center ml-5">
								<a href="view_details.jsp?bid=<%=b.getBookId() %>" class="btn btn-sm ml-2 text-white" style="background-color:#64CCC5;">View Details</a>
								<a href="" class="btn btn-sm ml-2 text-white" style="background-color:#176B87;"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
							</div>	
							
							<%}else{ %>		
							
														
							<!-- Buttons -->
							<div class="row text-center">
							
								<%
									if(u == null){
								%>								
									<a href="login.jsp" class="btn btn-sm ml-4 text-white" style="background-color:#176B87;">Add Cart</a>									
								<%
									}else{
								%>
									<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-sm ml-4 text-white" style="background-color:#176B87;">Add Cart</a>		
								<%
									}
								%>
								
								<a href="view_details.jsp?bid=<%=b.getBookId() %>" class="btn btn-sm ml-2 text-white" style="background-color:#64CCC5;">View Details</a>
								<a href="" class="btn btn-sm ml-2 text-white" style="background-color:#176B87;"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
							</div>	
							
							<%} %>
						</div>
					</div>					
				</div>			
			
			<%
				}		
			%>
			</div>
			<div class="text-center mt-2"><a href="all_recent_book.jsp" class="btn btn-link btn-sm">View All</a></div>
		</div>
		
		<hr>
		<!-- New Book -->
		<div class="container-fluid">
			<h3 class="text-center mb-3" style="color:#053B50;">New Books</h3>
			<div class="row">
				
				
				<% 
					BookDAOImpl dao2 = new BookDAOImpl(DBConnect.getConn());
					List<BookDetails> list2 = dao2.getNewBook();
					for(BookDetails b : list2){
				%>
					<div class="col-md-3">
						<div class="card card-ho">
							<div class="card-body text-center">
								<img src="books/<%=b.getPhotoName() %>" alt="Java" style="width:150px; height:200px;" class="img-thumblin rounded m-2">
								<p>Book : <%=b.getBookName() %>
								<br>Author : <%=b.getAuthor() %>	
								<br>Category : <%=b.getBookCategory() %></p>	
															
								<!-- Buttons -->
								<div class="row text-center">
								
								<%
									if(u == null){
								%>								
									<a href="login.jsp" class="btn btn-sm ml-4 text-white" style="background-color:#176B87;">Add Cart</a>									
								<%
									}else{
								%>
									<a href="cart?bid=<%=b.getBookId()%>&&uid=<%=u.getId()%>" class="btn btn-sm ml-4 text-white" style="background-color:#176B87;">Add Cart</a>		
								<%
									}
								%>
									<a href="view_details.jsp?bid=<%=b.getBookId() %>" class="btn btn-sm ml-2 text-white" style="background-color:#64CCC5;">View Details</a>
									<a href="" class="btn btn-sm ml-2 text-white" style="background-color:#176B87;"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
								</div>			
							</div>
						</div>
					</div>
					
				<%
					}
				%>														
												
			</div>
			<div class="text-center mt-2"><a href="all_new_book.jsp" class="btn btn-link btn-sm">View All</a></div>
		</div>
		<hr>
		
		<!-- Old Book -->
		<div class="container-fluid">
			<h3 class="text-center mb-3" style="color:#053B50;">Old Books</h3>
			<div class="row">
				
				<%
				BookDAOImpl dao3 = new BookDAOImpl(DBConnect.getConn());
				List<BookDetails> list3 = dao3.getOldBook();
				for(BookDetails b : list3){
				%>
						
				<div class="col-md-3">
					<div class="card card-ho">
						<div class="card-body text-center">
							<img src="books/<%=b.getPhotoName() %>" alt="Java" style="width:150px; height:200px;" class="img-thumblin rounded m-2">
							<p>Book : <%=b.getBookName() %>
							<br>Author : <%=b.getAuthor() %>	
							<br>Category : <%=b.getBookCategory() %></p>	
							
							<!-- Buttons -->
								<div class="row text-center">
									<a href="view_details.jsp?bid=<%=b.getBookId() %>" class="btn btn-sm text-white ml-5" style="background-color:#64CCC5;">View Details</a>
									<a href="" class="btn btn-sm ml-2 text-white" style="background-color:#176B87;"><%=b.getPrice() %> <i class="fa-solid fa-indian-rupee-sign"></i></a>
								</div>
						</div>
					</div>					
				</div>	
				
				<%
					}
				%>		
		
			</div>
			<div class="text-center mt-2"><a href="all_old_book.jsp" class="btn btn-link btn-sm">View All</a></div>
		</div>
		
		<!-- Footer -->
		<%@include file="component/footer.jsp" %>
		
	</body>
</html>




















