<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%

Student currentStudent = (Student) session.getAttribute("student");

if(currentStudent==null){
	response.sendRedirect("studentLogin");
}
%>

<%@page import="java.util.Properties"%>
<%@page import="jakarta.mail.*"%>
<%@page import="jakarta.mail.internet.*"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Send Email to Employer</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>
<body>

<%@ include file="student-header.jsp" %>

<section id="main-content">
    <section class="wrapper">
        <!-- Email Form Section -->
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-envelope"></i> Send Email to Employer
                    </header>
                    <div class="card-body">
                        <form action="sendEmail" method="post">
                            <div class="form-group">
                                <label for="employerEmail">Employer Email</label>
                                <input type="email" class="form-control" id="employerEmail" name="employerEmail" required placeholder="Enter employer's email">
                            </div>
                            <div class="form-group">
                                <label for="subject">Subject</label>
                                <input type="text" class="form-control" id="subject" name="subject" required placeholder="Enter email subject">
                            </div>
                            <div class="form-group">
                                <label for="message">Message</label>
                                <textarea class="form-control" id="message" name="message" rows="5" required placeholder="Enter your message"></textarea>
                            </div>
                            <button type="submit" class="btn btn-primary">Send Email</button>
                        </form>
                    </div>
                </section>
            </div>
        </div>
    </section>
</section>

<footer class="site-footer">
    <div class="text-center">
        2024 &copy; Student Dashboard
        <a href="#" class="go-top">
            <i class="fa fa-angle-up"></i>
        </a>
    </div>
</footer>

<script src="js/jquery.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/common-scripts.js"></script>

</body>
</html>
