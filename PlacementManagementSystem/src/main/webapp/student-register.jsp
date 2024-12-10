<!DOCTYPE html>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html lang="en">

<head>
   

    <title>Student Registration</title>

   

 <style>
        /* Reset and Basic Styles */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .container {
            max-width: 400px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);
        }

        .form-signin {
            display: flex;
            flex-direction: column;
        }

        .form-signin-heading {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .form-control {
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 14px;
        }

        .checkbox {
            display: flex;
            justify-content: space-between;
            align-items: center;
            font-size: 14px;
        }

        .btn-login {
            background-color: #5cb85c;
            color: white;
            padding: 12px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
            margin-top: 10px;
        }

        .btn-login:hover {
            background-color: #4cae4c;
        }

        .alert {
            padding: 10px;
            margin-bottom: 15px;
            background-color: #f2dede;
            color: #a94442;
            border: 1px solid #ebccd1;
            border-radius: 4px;
            text-align: center;
        }

        .login-wrap {
            text-align: center;
        }

        .login-wrap p {
            margin: 15px 0;
            font-size: 14px;
        }

        .registration {
            margin-top: 20px;
            font-size: 14px;
        }

        .registration a {
            color: #5cb85c;
            text-decoration: none;
        }

        .registration a:hover {
            text-decoration: underline;
        }

        a {
            color: #337ab7;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>

<body class="login-body">

    <div class="container">

        <form class="form-signin" action="registerStudent" method="POST">
            <h2 class="form-signin-heading">Register Now</h2>
            <div th:if="${errorMessage}" class="alert alert-danger">
                <p th:text="${errorMessage}"></p>
            </div>
            <c:if test="${not empty errorMessage}">
			    <div class="alert alert-danger">
			        <c:out value="${errorMessage}" />
			    </div>
			</c:if>
            
            <div class="login-wrap">
                <p>Enter your personal details below</p>
                <input type="text" class="form-control" name="name" placeholder="Full Name" required autofocus>
                <input type="email" class="form-control" name="email" placeholder="Email" required>
                <input type="password" class="form-control" name="password" placeholder="Password" required>
                <input type="password" class="form-control" name="rePassword" placeholder="Re-type Password" required>

                <!-- Optional fields -->
                <input type="text" class="form-control" name="address" placeholder="Address">
                <input type="text" class="form-control" name="phoneNumber" placeholder="Phone Number">
                <input type="text" class="form-control" name="dateOfBirth" placeholder="Date of Birth">
                
                <div class="radios">
                    <label class="label_radio col-lg-6 col-sm-6" for="radio-01">
                        <input name="gender" id="radio-01" value="Male" type="radio" /> Male
                    </label>
                    <label class="label_radio col-lg-6 col-sm-6" for="radio-02">
                        <input name="gender" id="radio-02" value="Female" type="radio" /> Female
                    </label>
                </div>
                
                <input type="text" class="form-control" name="registrationNumber" placeholder="Registration Number">
                <input type="text" class="form-control" name="department" placeholder="Department">
                <input type="number" class="form-control" name="yearOfStudy" placeholder="Year of Study">
                <input type="number" step="0.1" class="form-control" name="cgpa" placeholder="CGPA">
                <input type="text" class="form-control" name="resumeUrl" placeholder="Resume URL">
                <input type="text" class="form-control" name="placementStatus" placeholder="Placement Status">
                <input type="number" class="form-control" name="backlogs" placeholder="Backlogs">
                
                

                <label class="checkbox">
                    <input type="checkbox" value="agree this condition" required> I agree to the Terms of Service and Privacy Policy
                </label>
                <button class="btn btn-lg btn-login btn-block" type="submit">Submit</button>

                <div class="registration">
                    Already Registered.
                    <a class="" href="studentLogin">
                        Login
                    </a>
                </div>

            </div>

        </form>

    </div>


</body>

</html>
