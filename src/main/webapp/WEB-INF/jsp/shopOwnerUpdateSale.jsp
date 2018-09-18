<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Update Sale</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.2/united/bootstrap.min.css">
</head>

<body>
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  		<a class="navbar-brand" href="/shopOwner/viewShopsSales">Update Sale</a>
  		<ul class="navbar-nav">
   			<li class="nav-item">
     			<a class="nav-link" href="/shopOwner/homepage">Home</a>
    		</li>
    		<li class="nav-item">
      			<a class="nav-link" href="/shopOwner/viewShopsSales">View Shops and Sales</a>
    		</li>
    		<li class="nav-item">
      			<a class="nav-link" href="/shopOwner/registerShop">Register a New Shop</a>
    		</li>
    		<li class="nav-item">
      			<a class="nav-link" href="/shopOwner/registerSale">Register a New Sale</a>
    		</li>
    		<li class="nav-item">
      			<a class="nav-link" href="/shopOwner/settings">Settings</a>
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
				<form:form action="/shopOwner/submitSaleUpdate" method="post">
					<input type="hidden" name="saleId" value="${sale.saleId}">
					<input type="hidden" name="shopId" value="${sale.shopId}">
  					<div class="form-group">
    					<label>Sale Title:</label>
    					<input type="text" class="form-control" name="saleTitle" value="${sale.saleTitle}">
  					</div>
  					<div class="form-group">
    					<label>Original Price:</label>
    					<input type="text" class="form-control" name="originalPrice" value="${sale.originalPrice}">
  					</div>
  					<div class="form-group">
    					<label>Sale Price:</label>
    					<input type="text" class="form-control" name="salePrice" value="${sale.salePrice}">
  					</div>
  					<div class="form-group">
    					<label>Sale Description:</label>
    					<input type="text" class="form-control" name="saleDescription" value="${sale.saleDescription}">
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