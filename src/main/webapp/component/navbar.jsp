<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<link rel="stylesheet" href="/bookstore/src/main/webapp/component/style.css" type="text/css">

<div class="container-fluid p-3">
	<div class="row text-info">
		<div class="col-md-3" style="color:#053B50;">
			<h3><i class="fa-solid fa-book"></i>BookStore</h3>
		</div>
		
		<div class="col-md-6">
			<form class="form-inline my-2 my-lg-0" action="search.jsp" method="post">
				<input class="form-control mr-sm-2" type="search" name="ch"
					placeholder="Search" aria-label="Search">
				<button class="btn btn-info my-2 my-sm-0" type="submit" style="background-color:#053B50;">Search</button>
			</form>
		</div>
		
		<!-- User is logged in -->
		<c:if test="${not empty userobj }">
			<div class="col-md-3 d-flex justify-content-start align-items-center">
				<a href="checkout.jsp"><i class="fa-solid fa-cart-shopping fa-2x mr-2" style="color:#053B50;"></i></a>
				<a href="login.jsp" class="btn btn-outline-dark mr-2"><i class="fa-solid fa-user"></i> ${userobj.name }</a> 
				<a href="Logout" class="btn btn-light text-black">Logout</a>
			</div>
		</c:if >
		
		<!-- User is not logged in -->
			<c:if test="${empty userobj }">
				<div class="col-md-3">
					<a href="login.jsp" class="btn btn-outline-dark">Login</a> 
					<a href="register.jsp" class="btn btn-light text-black">Register</a>
				</div>
			</c:if>				
		
	</div>
</div>


<nav class="navbar navbar-expand-lg" style="background-color:#053B50;">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-house-user" style="color: #EEEEEE;"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>
 
	<div class="collapse navbar-collapse" id="navbarSupportedContent">
	
		<div class="navbar-nav mr-auto">
			<a class="nav-link" href="index.jsp" style="color: #EEEEEE;">Home<span class="sr-only">(current)</span></a>
			<a class="nav-link disabled" href="all_recent_book.jsp" style="color: #EEEEEE;">Recent</a>
			<a class="nav-link disabled" href="all_new_book.jsp" style="color: #EEEEEE;">New</a>
			<a class="nav-link disabled" href="all_old_book.jsp" style="color: #EEEEEE;">Old</a>
		</div>
		
		<form class="form-inline my-2 my-lg-0">
			<a href="setting.jsp" class="btn btn-light my-2 my-sm-0" type="submit"><i class="fa-solid fa-gear"></i></a>
			<a href="helpline.jsp" class="btn btn-light my-2 my-sm-0 ml-1" type="submit"><i class="fa-solid fa-address-book"></i></a>
		</form>
		
	</div>
</nav>