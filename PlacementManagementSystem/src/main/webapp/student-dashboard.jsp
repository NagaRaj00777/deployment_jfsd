<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<%

Student currentStudent = (Student) session.getAttribute("student");

if(currentStudent==null){
	response.sendRedirect("studentLogin");
}
%>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Dashboard</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="css/slidebars.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
    
    
     <style>
        /* General Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f4f8;
            color: #333;
            margin: 0;
            padding: 0;
        }

        a {
            color: #4a90e2;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }

        .wrapper {
            padding: 20px;
            max-width: 1200px;
            margin: auto;
        }

        /* Card Styling */
        .card {
            background: #ffffff;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            margin-bottom: 30px;
            overflow: hidden;
        }

        .card-header {
            background: linear-gradient(135deg, #4a90e2, #007bff);
            color: #ffffff;
            padding: 20px;
            font-size: 20px;
            display: flex;
            align-items: center;
            border-bottom: 2px solid #0056b3;
        }

        .card-header i {
            margin-right: 10px;
            font-size: 24px;
        }

        .card-body {
            padding: 20px;
            font-size: 16px;
            background-color: #f9f9f9;
        }

        .card-body p, .card-body ul {
            margin: 10px 0;
            line-height: 1.6;
        }

        .card-body ul {
            padding-left: 20px;
        }

        .card-body li {
            margin-bottom: 10px;
        }

        /* Table Styling */
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            border-radius: 8px;
            overflow: hidden;
        }

        table th, table td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #4a90e2;
            color: #fff;
        }

        table tr:nth-child(even) {
            background-color: #f2f8ff;
        }

        table tr:hover {
            background-color: #e0efff;
        }

        /* Footer */
        .site-footer {
            background-color: #2c3e50;
            color: #ffffff;
            text-align: center;
            padding: 15px;
            position: relative;
        }

        .site-footer a {
            color: #ffffff;
        }

        .go-top {
            position: absolute;
            right: 20px;
            bottom: 15px;
            font-size: 20px;
            color: #fff;
            transition: transform 0.3s ease;
        }

        .go-top:hover {
            transform: translateY(-5px);
        }
    </style>
</head>

<%@ include file="student-header.jsp" %>

<section id="main-content">
    <section class="wrapper">
        <!-- Student Profile Section -->
        <c:if test="${not empty errorMessage}">
    <div class="alert alert-danger">${errorMessage}</div>
</c:if>
        
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-user"></i> Student Profile
                    </header>
                    <div class="card-body">
                        <p><strong>Name:</strong> <c:out value="${student.name}" /></p>
                        <p><strong>Email:</strong> <c:out value="${student.email}" /></p>
                        <p><strong>Department:</strong> <c:out value="${student.department}" /></p>
                        <p><strong>Year of Study:</strong> <c:out value="${student.yearOfStudy}" /></p>
                        <p><strong>CGPA:</strong> <c:out value="${student.cgpa}" /></p>
                        <p><strong>Placement Status:</strong> <c:out value="${student.placementStatus}" /></p>
                    </div>
                </section>
            </div>
        </div>

        <!-- Applied Jobs Section -->
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-briefcase"></i> Applied Jobs
                    </header>
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Job Title</th>
                                    <th>Company</th>
                                    <th>Status</th>
                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach var="job" items="${appliedJobs}">
                                    <tr>
                                        <td><c:out value="${job.jobTitle}" /></td>
                                        <td><c:out value="${job.company}" /></td>
                                        <td><c:out value="${job.status}" /></td>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </section>
            </div>
        </div>

        <!-- Certifications Section -->
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-certificate"></i> Certifications
                    </header>
                    <div class="card-body">
                        <ul>
                            <c:forEach var="certification" items="${student.certifications}">
                                <li><c:out value="${certification}" /></li>
                            </c:forEach>
                        </ul>
                    </div>
                </section>
            </div>
        </div>

        <!-- Internship Experience Section -->
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-institution"></i> Internship Experience
                    </header>
                    <div class="card-body">
                        <p><c:out value="${student.internshipExperience}" /></p>
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
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/jquery.scrollTo.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/common-scripts.js"></script>

</body>
</html>
