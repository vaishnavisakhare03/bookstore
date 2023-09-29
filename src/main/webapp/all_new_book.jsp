<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="java.util.*" %>
<%@ page import="com.entity.BookDetails" %>
<%@ page import="com.entity.User" %>

<html>
	<head>
		<meta charset="UTF-8">
		<title>New Books</title>
		<%@include file="component/css_files.jsp"%>
		
		<style type="text/css">
			
			.card-ho:hover{
				background-color: #F1EFEF;
			}
			
			#toast {
				min-width: 300px;
				position: fixed;
				bottom: 30px;
				left: 50%;
				margin-left: -125px;
				background: #333;
				padding: 10px;
				color: white;
				text-align: center;
				z-index: 1;
				font-size: 18px;
				visibility: hidden;
				box-shadow: 0px 0px 100px #000;
			}
			
			#toast.display {
				visibility: visible;
				animation: fadeIn 0.5, fadeOut 0.5s 2.5s;
			}
			
			@keyframes fadeIn {from { bottom:0;
				opacity: 0;
			}
			
			to {
				bottom: 30px;
				opacity: 1;
			}
			
			}
			@keyframes fadeOut {form { bottom:30px;
				opacity: 1;
			}
			
			to {
				bottom: 0;
				opacity: 0;
			}
			}
		
		</style>
	</head>
	
	<body>
	
		<%
			User u = (User)session.getAttribute("userobj");		
		%>
	
		<c:if test="${not empty addCart}">
			
			<div id="toast">${addCart}</div>
			
			<script type="text/javascript">
				showToast();
				function showToast(content)
				{
				    $('#toast').addClass("display");
				    $('#toast').html(content);
				    setTimeout(()=>{$("#toast").removeClass("display"); },2000)
				}	
			</script>
			
			<c:remove var="addCart" scope="session"/>
			
		</c:if>
		
		<!-- Nav Bar Component -->
		<%@include file="component/navbar.jsp"%>
		
		<div class="container-fluid">
			<div class="row p-3">
				<% 
					BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
					List<BookDetails> list = dao.getAllNewbook();
					for(BookDetails b : list){
				%>
					<div class="col-md-3">
						<div class="card card-ho mt-4">
							<div class="card-body text-center">
								<img src="books/<%=b.getPhotoName() %>" alt="Java" style="width:100px; height:150px;" class="img-thumblin rounded m-2">
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
									<a href="view_details.jsp?bid=<%=b.getBookId()%>" class="btn btn-sm ml-2 text-white" style="background-color:#64CCC5;">View Details</a>
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