<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <title>Login</title>

    <!-- Bootstrap CSS CDN -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootswatch/4.1.2/united/bootstrap.min.css">
</head>

<body>
  	<nav class="navbar navbar-expand-sm bg-dark navbar-dark fixed-top">
  		<a class="navbar-brand" href="/login">Login</a>
	</nav>
	
	<div class="container" style="margin-top: 10%; margin-bottom: 10%;">
  		<div class="row">
    		<div class="col">
    			<p style="text-align: center">Login</p>
    			<c:if test="${param.error != null}">
    				<div class="alert alert-error">    
                    	Invalid username and password.
                	</div>
                </c:if>
                <c:if test="${param.logout != null}">
    				<div class="alert alert-success">    
                    	Successfully logged out.
                	</div>
                </c:if>
    			<form:form action="/login" method="post">
    				<div class="form-group">
      					<label>Email:</label>
      					<input name="username" type="text" class="form-control">
    				</div>
    				<div class="form-group">
      					<label>Password:</label>
      					<input name="password" type="password" class="form-control">
    				</div>
    				<button type="submit" value="Submit" class="btn btn-primary">Submit</button>
  				</form:form>
    		</div>
  		<div>
  	</div>
    		<a href="/registerShopOwner" class="btn btn-primary btn-block" role="button" style="margin-top: 10%">Click here to register a Shop Owner account!</a>
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