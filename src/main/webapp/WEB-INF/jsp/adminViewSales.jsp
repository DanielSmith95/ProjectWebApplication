<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>View Selected Shop's Sales</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.2/united/bootstrap.min.css">
</head>

<body>
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  		<a class="navbar-brand" href="/admin/homepage">View Sales</a>
  		<ul class="navbar-nav">
   			<li class="nav-item">
     			<a class="nav-link" href="/admin/homepage">Home</a>
    		</li>
    		<li class="nav-item">
      			<a class="nav-link" href="/admin/searchShopsSales">Search Shops and Sales</a>
    		</li>
    		<li class="nav-item">
      			<a class="nav-link" href="/admin/viewUsers">View and Suspend Users</a>
    		</li>
    		<li class="nav-item">
      			<a class="nav-link" href="/admin/viewErrorReports">View User and Error Reports</a>
    		</li>
    		<li class="nav-item">
      			<a class="nav-link" href="/admin/settings">Settings</a>
    		</li>
  		</ul>
  		<ul class="navbar-nav ml-auto">
  			<li>
  				<a class="nav-link" href="/logout">Logout</a>
  			</li>
  		</ul>
	</nav>
	
	<!-- <div class="container" style="margin-top: 10%">
  		<div class="row">
    		<div class="col">
    			 <p>Filtering/Search Option 1</p>
    		</div>
   			<div class="col">
   				 <p>Filtering/Search Option 2</p>
   			</div>
    		<div class="w-100"></div>
    		<div class="col" style="margin-top: 5%">
    			 <p>Filtering/Search Option 3</p>
    		</div>
    		<div class="col" style="margin-top: 5%">
    			 <p>Filtering/Search Option 4</p>
    		</div>
  		</div>
	</div> -->
	
	<div class="container" style="margin-top: 10%">
		<table class="table table-striped">
			<thead>
				<tr>
					<th>Sale Title</th>
					<th>Original Price</th>
					<th>Sale Price</th>
					<th>Sale Description</th>
					<th>Update Sale</th>
					<th>Delete Sale</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${sales}" var="sale">
					<tr>
						<td>${sale.saleTitle}</td>
						<td>${sale.originalPrice}</td>
						<td>${sale.salePrice}</td>
						<td>${sale.saleDescription}</td>
						<td>
							<form:form action="/admin/updateSale" method="post">
								<input type="hidden" name="saleId" value="${sale.saleId}">
								<button class="btn btn-primary btn-block" type="submit">Update Sale</button>
							</form:form>
						</td>
						<td>
							<form:form action="/admin/deleteSale" method="post">
								<input type="hidden" name="saleId" value="${sale.saleId}">
								<button class="btn btn-primary btn-block" type="submit">Delete Sale</button>
							</form:form>
						</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
	
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>

</html>