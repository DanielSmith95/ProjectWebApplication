<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Register a New Sale</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.2/united/bootstrap.min.css">
</head>

<body>
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  		<a class="navbar-brand" href="/shopOwner/registerSale">Register a New Sale</a>
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
				<form:form action="/shopOwner/submitSale" method="post" enctype="multipart/form-data">
					<div class="form-group">
						<label>Select Shop:</label>
  						<select class="form-control" name="shopId">
  							<c:forEach items="${shops}" var="shop">
    							<option value="${shop.shopId}" id="shopId">${shop.shopName}</option>
    						</c:forEach>
  						</select>
					</div> 
					Sale Type:
					<div class="btn-group" data-toggle="buttons">
				      <label class="btn btn-primary">
				        <input type="radio" name="options" id="option1" checked> Singular Item (E.g. Item down to £4.99)
				      </label>
				      <label class="btn btn-primary">
				        <input type="radio" name="options" id="option2"> Percentage Cut to Range (E.g. 50% off men's jackets)
				      </label>
				      <label class="btn btn-primary">
				        <input type="radio" name="options" id="option3"> Special Offer (E.g. Buy one get one free)
				      </label>
					</div>
  					<div class="form-group">
    					<label>Sale Title:</label>
    					<input type="text" class="form-control" name="saleTitle" required>
  					</div>
  					<div class="form-group">
    					<label>Sale Category:</label>
    					<select class="form-control" name="categoryId">
  							<c:forEach items="${categories}" var="category">
    							<option value="${category.categoryId}" id="categoryId">${category.categoryName}</option>
    						</c:forEach>
  						</select>
  					</div>
  					<div class="form-group" id="price">
    					<label>Original Price:</label>
    					<input type="text" class="form-control" name="originalPrice">
  					</div>
  					<div class="form-group" id="price2">
    					<label>Sale Price:</label>
    					<input type="text" class="form-control" name="salePrice">
  					</div>
  					<div class="form-group">
    					<label>Sale Description:</label>
    					<input type="text" class="form-control" name="saleDescription" required>
  					</div>
  					<div>
  						<label>Select Sale Image:</label>
  						<input type="file" class="form-control" name="saleImage" accept="image/*">
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

	<script>
	$(document).ready(function(){
	    $('input[name="options"]').change(function(){
	        if($('#option2').prop('checked') || $('#option3').prop('checked')){
	            $('#price').hide();
	            $('#price2').hide();
	        }
	        else {
	        	$('#price').show();
	            $('#price2').show();
	        }
	    });
	});
	</script>
</body>

</html>