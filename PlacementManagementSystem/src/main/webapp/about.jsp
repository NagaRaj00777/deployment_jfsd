<!DOCTYPE html>
<html lang="en">
<%@ page contentType="text/html; charset=UTF-8" language="java" %>

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>About Us</title>

    <!-- Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">

    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f4f4;
            color: #333;
            margin: 0;
            padding: 0;
        }

        .about-section {
            background-color: #fff;
            border-radius: 10px;
            padding: 60px 20px;
            margin: 50px auto;
            max-width: 1000px;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
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

        .about-section h1 {
            font-size: 36px;
            font-weight: 700;
            color: #2193b0;
            margin-bottom: 30px;
        }

        .about-section p {
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 30px;
            color: #555;
        }

        .team-member {
            margin-bottom: 30px;
        }

        .team-member img {
            width: 150px;
            height: 150px;
            object-fit: cover;
            border-radius: 50%;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.2);
            margin-bottom: 15px;
        }

        .team-member h4 {
            font-size: 20px;
            font-weight: 700;
            margin-bottom: 5px;
        }

        .team-member p {
            font-size: 14px;
            color: #777;
            margin-bottom: 10px;
        }

        .social-links a {
            display: inline-block;
            margin: 5px;
            font-size: 20px;
            color: #2193b0;
            transition: color 0.3s, transform 0.3s;
        }

        .social-links a:hover {
            color: #176e84;
            transform: scale(1.2);
        }
    </style>
</head>

<body>

    <div class="container">
        <div class="about-section">
            <!-- About Us Heading -->
            <h1>About Us</h1>
            <p>
                We are a dedicated team committed to connecting students with employers, offering growth and learning opportunities for a successful future.
            </p>

            <!-- Team Members Section -->
            <div class="row justify-content-center">
                <!-- Team Member 1 -->
                <div class="col-md-4 col-sm-6 team-member">
                    <img src="adhi.jpg" alt="Team Member 1">
                    <h4>Y.Adithya Sai</h4>
                    <p>Developer</p>
                    <div class="social-links">
                        <a href="https://www.instagram.com" target="_blank" title="Instagram">
                            <i class="fab fa-instagram"></i>
                        </a>
                        <a href="https://www.linkedin.com" target="_blank" title="LinkedIn">
                            <i class="fab fa-linkedin"></i>
                        </a>
                    </div>
                </div>

                <!-- Team Member 2 -->
                <div class="col-md-4 col-sm-6 team-member">
                    <img src="me.jpg" alt="Team Member 2">
                    <h4>Gadde Naga Raju</h4>
                    <p>Team Lead</p>
                    <div class="social-links">
                        <a href="https://www.facebook.com" target="_blank" title="Facebook">
                            <i class="fab fa-facebook"></i>
                        </a>
                        <a href="https://www.twitter.com" target="_blank" title="Twitter">
                            <i class="fab fa-twitter"></i>
                        </a>
                    </div>
                </div>

                <!-- Team Member 3 -->
                <div class="col-md-4 col-sm-6 team-member">
                    <img src="jfsdteammember.jpg" alt="Team Member 3">
                    <h4>Reddy Keshava Laxshmi</h4>
                    <p>Developer</p>
                    <div class="social-links">
                        <a href="https://www.github.com" target="_blank" title="GitHub">
                            <i class="fab fa-github"></i>
                        </a>
                        <a href="https://www.linkedin.com" target="_blank" title="LinkedIn">
                            <i class="fab fa-linkedin"></i>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Bootstrap JS and jQuery (Optional) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.bundle.min.js"></script>

</body>

</html>
