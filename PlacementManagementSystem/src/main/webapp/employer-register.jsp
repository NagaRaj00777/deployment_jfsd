<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Employee Registration</title>

    <!-- Bootstrap core CSS -->
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <!--external css-->
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
</head>

<body class="login-body">

    <div class="container">

        <form class="form-signin" action="employerRegister" method="POST">
            <h2 class="form-signin-heading">Employee Registration</h2>
            <c:if test="${not empty errorMessage}">
                <div class="alert alert-danger">
                    <c:out value="${errorMessage}" />
                </div>
            </c:if>

            <div class="login-wrap">
                <p>Enter company and personal details below</p>
                
                <input type="text" class="form-control" name="companyName" placeholder="Company Name" required>
                <input type="text" class="form-control" name="contactPerson" placeholder="Contact Person" required>
                <input type="email" class="form-control" name="contactEmail" placeholder="Contact Email" required>
                <input type="text" class="form-control" name="contactPhone" placeholder="Contact Phone">
                <input type="text" class="form-control" name="address" placeholder="Address">
                <input type="text" class="form-control" name="website" placeholder="Website">
                <input type="text" class="form-control" name="industryType" placeholder="Industry Type">
                
                <p>Enter login details</p>
                <input type="text" class="form-control" name="username" placeholder="Username" required>
                <input type="password" class="form-control" name="password" placeholder="Password" required>
                
                <button class="btn btn-lg btn-login btn-block" type="submit">Submit</button>

                <div class="registration">
                    Already Registered?
                    <a href="employerLogin">Login</a>
                </div>
            </div>
        </form>

    </div>
</body>

</html>
