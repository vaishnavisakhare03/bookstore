<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@page isELIgnored="false" %>

<div class="container-fluid p-3">
	<div class="row">
		<div class="col-md-3" style="color:#053B50;">
			<h3><i class="fa-solid fa-book"></i>BookStore</h3>
		</div>
		
		<div class="col-md-3">
			<c:if test="${not empty userobj }">
				<a class="btn btn-outline-dark">${ userobj.name}</a> 
				<a data-toggle="modal" data-target="#exampleModalCenter" class="btn btn-light text-black">Logout</a>
			</c:if >
			<c:if test="${empty userobj }">
				<a href="../login.jsp" class="btn btn-outline-dark">Login</a> 
				<a href="../register.jsp" class="btn btn-light text-black">Register</a>
			</c:if>
		</div>
	</div>

</div>

<!--  Logout modal-->

<!-- Modal -->
<div class="modal fade" id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLongTitle"></h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
	      <div class="text-center">
	        <h4>Do you want to Logout?</h4>
	        <button type="button" class="btn btn-outline-dark" data-dismiss="modal">Close</button>
	        <a href="../Logout" type="button" class="btn btn-light text-black">Logout</a>
	      </div>
      </div>
      <div class="modal-footer">
        
      </div>
    </div>
  </div>
</div>

<!-- Logout modal -->

<nav class="navbar navbar-expand-lg bg-custom">
	<a class="navbar-brand" href="#"><i class="fa-solid fa-house-user text-white"></i></a>
	<button class="navbar-toggler" type="button" data-toggle="collapse"
		data-target="#navbarSupportedContent"
		aria-controls="navbarSupportedContent" aria-expanded="false"
		aria-label="Toggle navigation">
		<span class="navbar-toggler-icon"></span>
	</button>

	<div class="collapse navbar-collapse" id="navbarSupportedContent">
	
		<ul class="navbar-nav mr-auto">
			<li class="nav-item active"><a class="nav-link text-white" href="home.jsp">Home<span class="sr-only">(current)</span></a></li>
		</ul>
		
	</div>
</nav>