<!DOCTYPE html>
<html lang="en">
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>

    <!-- Google Fonts for Better Typography -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <!-- Bootstrap CSS (Optional) -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <style>
        /* General Reset and Basic Styles */
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #6dd5ed, #2193b0);
            color: #333;
            height: 100vh;
            margin: 0;
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0px 10px 25px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
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
            color: #2193b0;
            margin-bottom: 20px;
        }

        .form-control {
            padding: 12px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 16px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .form-control:focus {
            border-color: #2193b0;
            box-shadow: 0 0 8px rgba(33, 147, 176, 0.2);
            outline: none;
        }

        .btn-login {
            background: linear-gradient(135deg, #6dd5ed, #2193b0);
            color: white;
            padding: 12px;
            font-size: 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            transition: background 0.3s, transform 0.2s;
            width: 100%;
        }

        .btn-login:hover {
            background: linear-gradient(135deg, #57c4e5, #1c8ba8);
            transform: translateY(-2px);
        }

        .alert {
            padding: 12px;
            margin-bottom: 20px;
            background-color: #f8d7da;
            color: #721c24;
            border: 1px solid #f5c6cb;
            border-radius: 6px;
            text-align: center;
        }

        .login-wrap {
            text-align: center;
        }

        .forgot-password {
            font-size: 14px;
            margin-top: 10px;
        }

        .forgot-password a {
            color: #2193b0;
            text-decoration: none;
            font-weight: 500;
            transition: color 0.3s;
        }

        .forgot-password a:hover {
            color: #176e84;
            text-decoration: underline;
        }

        .icon {
            font-size: 50px;
            color: #2193b0;
            margin-bottom: 20px;
        }
    </style>
</head>

<body>

    <div class="container">
        <form class="form-signin" action="employerLogin" method="POST">
            <i class="fas fa-user-shield icon"></i>
            <h2 class="form-signin-heading">Admin Sign In</h2>

            <c:if test="${not empty errorMessage}">
                <div class="alert">
                    <c:out value="${errorMessage}" />
                </div>
            </c:if>

            <input type="text" class="form-control" name="username" placeholder="Username" required autofocus>
            <input type="password" class="form-control" name="password" placeholder="Password" required>

            <button class="btn btn-login btn-block" type="submit">Sign In</button>

            <div class="forgot-password">
                <a href="#forgotPasswordModal" data-toggle="modal">Forgot Password?</a>
            </div>
        </form>
    </div>

    <!-- Bootstrap JS and jQuery (Optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</body>

</html>
