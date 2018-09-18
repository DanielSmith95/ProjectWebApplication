<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Shop Owner Homepage</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.2/united/bootstrap.min.css">
</head>

<body>
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  		<a class="navbar-brand" href="/shopOwner/homepage">Shop Owner Homepage</a>
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
	
	<div class="container" style="margin-top: 10%">
  		<div class="row">
    		<div class="col">
    			 <a href="/shopOwner/viewShopsSales" class="btn btn-primary btn-block" role="button" style="padding: 25%">View Shops and Sales</a>
    		</div>
   			<div class="col">
   				 <a href="/shopOwner/registerShop" class="btn btn-primary btn-block" role="button" style="padding: 25%">Register a New Shop</a>
   			</div>
    		<div class="w-100"></div>
    		<div class="col" style="margin-top: 5%">
    			 <a href="/shopOwner/registerSale" class="btn btn-primary btn-block" role="button" style="padding: 25%">Register a New Sale</a>
    		</div>
    		<div class="col" style="margin-top: 5%">
    			 <a href="/shopOwner/settings" class="btn btn-primary btn-block" role="button" style="padding: 25%">Settings</a>
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