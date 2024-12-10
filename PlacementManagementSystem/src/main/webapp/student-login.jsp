<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - FlatLab</title>
    
    <!-- Google Fonts for Better Typography -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        /* General Reset and Basic Styles */
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        .container {
            width: 100%;
            max-width: 400px;
            background-color: #fff;
            padding: 40px;
            border-radius: 15px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            text-align: center;
            animation: fadeIn 1s ease-in-out;
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .form-signin-heading {
            font-size: 28px;
            font-weight: 700;
            color: #0072ff;
            margin-bottom: 20px;
        }

        .form-control {
            width: 100%;
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 8px;
            font-size: 16px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .form-control:focus {
            border-color: #0072ff;
            box-shadow: 0 0 8px rgba(0, 114, 255, 0.2);
            outline: none;
        }

        .btn-login {
            background: linear-gradient(135deg, #00c6ff, #0072ff);
            color: #fff;
            padding: 12px;
            border: none;
            border-radius: 8px;
            font-size: 18px;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
        }

        .btn-login:hover {
            background: linear-gradient(135deg, #0072ff, #005bb5);
            transform: translateY(-2px);
        }

        .alert {
            padding: 12px;
            margin-bottom: 20px;
            background-color: #ffdddd;
            color: #d8000c;
            border: 1px solid #f5c6cb;
            border-radius: 8px;
        }

        .registration, .forgot-password {
            font-size: 14px;
            margin-top: 15px;
        }

        .registration a, .forgot-password a {
            color: #0072ff;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .registration a:hover, .forgot-password a:hover {
            color: #005bb5;
            text-decoration: underline;
        }

        .icon {
            font-size: 50px;
            color: #0072ff;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

    <div class="container">
        <form class="form-signin" action="studentLogin" method="POST">
            <i class="fas fa-user-circle icon"></i>
            <h2 class="form-signin-heading">Sign In</h2>

            <c:if test="${not empty errorMessage}">
                <div class="alert">
                    <c:out value="${errorMessage}" />
                </div>
            </c:if>

            <input type="text" class="form-control" name="email" placeholder="Email" required autofocus>
            <input type="password" class="form-control" name="password" placeholder="Password" required>

            <button class="btn btn-login btn-block" type="submit">Sign In</button>

            <div class="forgot-password">
                <a href="#myModal">Forgot Password?</a>
            </div>

            <div class="registration">
                Don't have an account yet? <br>
                <a href="studentRegister">Create an account</a>
            </div>
        </form>
    </div>

</body>

</html>
