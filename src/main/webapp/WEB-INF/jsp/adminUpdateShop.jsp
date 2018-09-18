<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Update Shop</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.2/united/bootstrap.min.css">
</head>

<body>
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  		<a class="navbar-brand" href="/admin/homepage">Update Shop</a>
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
	
	<div class="container" style="margin-top: 10%; margin-bottom: 10%;">
  		<div class="row">
    		<div class="col">
				<form:form action="/admin/submitShopUpdate" method="post">
					<input type="hidden" name="shopId" value="${shop.shopId}">
					<input type="hidden" name="ownerId" value="${shop.ownerId}">
  					<div class="form-group">
    					<label>Shop Name:</label>
    					<input type="text" class="form-control" name="shopName" value="${shop.shopName}">
  					</div>
  					<div class="form-group">
    					<label>Address Line 1:</label>
    					<input type="text" class="form-control" name="addressLine1" value="${shop.addressLine1}">
  					</div>
  					<div class="form-group">
    					<label>Address Line 2:</label>
    					<input type="text" class="form-control" name="addressLine2" value="${shop.addressLine2}">
  					</div>
  					<div class="form-group">
    					<label>Address Line 3:</label>
    					<input type="text" class="form-control" name="addressLine3" value="${shop.addressLine3}">
  					</div>
  					<div class="form-group">
    					<label>Postcode:</label>
    					<input type="text" class="form-control" name="postcode" value="${shop.postcode}">
  					</div>
  					<div class="form-group">
    					<label>Telephone No.:</label>
    					<input type="text" class="form-control" name="telephoneNo" value="${shop.telephoneNo}">
  					</div>
  					<div class="form-group">
    					<label>Business Email:</label>
    					<input type="text" class="form-control" name="shopEmail" value="${shop.shopEmail}">
  					</div>
  					<div class="form-group">
    					<label>Biography:</label>
    					<input type="text" class="form-control" name="biography" value="${shop.biography}">
  					</div>
  					<div class="form-group">
    					<label>Opening Hours:</label>
    					<input type="text" class="form-control" name="openingHours" value="${shop.openingHours}">
  					</div>
  					<button type="submit" class="btn btn-primary">Submit</button>
  				</form:form>
			</div>
  		</div>
	</div>
	
    <!-- jQuery CDN -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <!-- Popper.JS -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <!-- Bootstrap JS -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

</body>

</html>