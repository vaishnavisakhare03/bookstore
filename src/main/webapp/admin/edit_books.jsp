<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="com.DAO.BookDAOImpl" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.entity.BookDetails" %>

<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Edit Books</title>
		<%@include file="css_files.jsp" %>
	</head>
	
	<body style="background-color: #F8F0E5">
		<%@include file="navbar.jsp" %>
	
		<div class="container p-5">
			<div class="row">
				<div class="col-md-4 offset-md-4">
					<div class="card">
						<div class="card-body">
							<h4 class="text-center">Edit Books</h4>
						
							<%
								int id=Integer.parseInt(request.getParameter("id"));
								BookDAOImpl dao = new BookDAOImpl(DBConnect.getConn());
								BookDetails b = dao.getBookById(id);
								//System.out.println("id : " + id);
								//System.out.println("edit_book : " + b);
							
							%>
							
							<form action="../editbooks" method="post">
							
								<input type="hidden" name="id" value="<%=b.getBookId()%>">
							
								<div class="form-group">
									<label for="exampleInputEmail1">Book Name</label>
									<input name="bname" type="text" class="form-control" id="exampleInoutEmail1" aria-describedby="emailHelp" value="<%=b.getBookName()%>">             
								</div>
								
								<div class="form-group">
									<label for="exampleInputEmail1">Author Name</label>
									<input name="author" type="text" class="form-control" id="exampleInoutEmail1" aria-describedby="emailHelp" value="<%=b.getAuthor() %>">
								</div>
							
								<div class="form-group">
									<label for="exampleInputEmail1">Price</label>
									<input name="price" type="number" class="form-control" id="exampleInoutEmail1" value="<%=b.getPrice() %>">
								</div>								
								
								<div class="form-group">
									<label for="inputState">Book Status</label>
									<select name="status" class="form-control" id="inputState">
									
									<%
										if("Active".equals(b.getStatus())){
											%>
											<option value="Active">Active</option>
											<option value="Inactive">Inactive</option>
											<%
										}else{
											%>
											<option value="Active">Active</option>
											<option value="Inactive">Inactive</option>
											<%
										}
									%>		
									
									</select>
								</div>
								
								<button type="submit" class="btn btn-primary">Update</button>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</body>
</html>