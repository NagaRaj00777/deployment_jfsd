<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="">
    <meta name="author" content="Mosaddek">
    <meta name="keyword" content="FlatLab, Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
    <link rel="shortcut icon" href="img/favicon.png">

    <title>FlatLab - Flat & Responsive Bootstrap Admin Template</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <!-- Custom styles for this template -->
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />

</head>

<body class="login-body">

    <div class="container">

        <form class="form-signin" action="studentLogin" method="POST">
		    <h2 class="form-signin-heading">Sign in now</h2>
			    <c:if test="${not empty errorMessage}">
			        <div class="alert alert-danger">
			            <c:out value="${errorMessage}" />
			        </div>
			    </c:if>
		    <div class="login-wrap">
		        <input type="text" class="form-control" name="email" placeholder="Email" required autofocus>
		        <input type="password" class="form-control" name="password" placeholder="Password" required>
		        <label class="checkbox">
		            <input type="checkbox" value="remember-me"> Remember me
		            <span class="pull-right">
		                <a data-toggle="modal" href="#myModal"> Forgot Password?</a>
		            </span>
		        </label>
		        <button class="btn btn-lg btn-login btn-block" type="submit">Sign in</button>
		        <p>or you can sign in via social network</p>
		        <div class="registration">
		            Don't have an account yet?
		            <a class="" href="AdminRegister">Create an account</a>
		        </div>
		    </div>
		</form>


    </div>
    <script src="js/jquery.js"></script>
    <script src="js/bootstrap.bundle.min.js"></script>


</body>

</html>