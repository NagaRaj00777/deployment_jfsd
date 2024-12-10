<%@page import="com.klef.jfsd.springboot.model.Employer"%>
<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!DOCTYPE html>
<html lang="en">

<%

Employer currentEmployer = (Employer) session.getAttribute("employer");

if (currentEmployer == null) {
    response.sendRedirect("employerLogin");
}
%>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Student Details - Employer Dashboard</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="css/slidebars.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />



</head>

<%@ include file="employer-header.jsp" %>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-user"></i> Student Details
                    </header>
                    <div class="card-body">
                        <h5>Student Information:</h5>
                        
                        <!-- Display student information -->
                        <p><strong>Name:</strong> <c:out value="${student.name}" /></p>
                        <p><strong>Email:</strong> <c:out value="${student.email}" /></p>
                        <p><strong>Phone Number:</strong> <c:out value="${student.phoneNumber}" /></p>
                        <p><strong>Address:</strong> <c:out value="${student.address}" /></p>
                        <p><strong>Date of Birth:</strong> <c:out value="${student.dateOfBirth}" /></p>
                        <p><strong>Gender:</strong> <c:out value="${student.gender}" /></p>
                        <p><strong>Registration Number:</strong> <c:out value="${student.registrationNumber}" /></p>
                        <p><strong>Department:</strong> <c:out value="${student.department}" /></p>
                        <p><strong>Year of Study:</strong> <c:out value="${student.yearOfStudy}" /></p>
                        <p><strong>CGPA:</strong> <c:out value="${student.cgpa}" /></p>

                        <!-- Skills -->
                        <p><strong>Skills:</strong> 
                            <c:forEach var="skill" items="${student.skills}">
                                <span ><c:out value="${skill}" /></span>
                            </c:forEach>
                        </p>

                        <!-- Resume Link -->
                        <c:choose>
                            <c:when test="${not empty student.resumeUrl}">
                                <p><strong>Resume:</strong> <a href="${student.resumeUrl}" class="btn btn-link">Download Resume</a></p>
                            </c:when>
                            <c:otherwise>
                                <p>No resume available</p>
                            </c:otherwise>
                        </c:choose>

                        <!-- Placement and Company Details -->
                        <p><strong>Placement Status:</strong> <c:out value="${student.placementStatus}" /></p>
                        

                        <p><strong>Backlogs:</strong> <c:out value="${student.backlogs}" /></p>

                        <!-- Certifications -->
                        <p><strong>Certifications:</strong> 
                            <c:forEach var="certification" items="${student.certifications}">
                                <span class="badge bg-warning"><c:out value="${certification}" /></span>
                            </c:forEach>
                        </p>

                        <!-- Projects -->
                        <p><strong>Projects:</strong> 
                            <c:forEach var="project" items="${student.projects}">
                                <span class="badge bg-info"><c:out value="${project}" /></span>
                            </c:forEach>
                        </p>

                        <!-- Internship Experience -->
                        <p><strong>Internship Experience:</strong> <c:out value="${student.internshipExperience}" /></p>

                        <!-- Achievements -->
                        <p><strong>Achievements:</strong> 
                            <c:forEach var="achievement" items="${student.achievements}">
                                <span class="badge bg-dark"><c:out value="${achievement}" /></span>
                            </c:forEach>
                        </p>

                        <!-- Back to Job Applications button -->
                        <a href="viewJobApplications?jobId=${applicantionId}" class="btn btn-secondary">Back to Applications</a>
                    </div>
                </section>
            </div>
        </div>
    </section>
</section>

<!-- <footer class="site-footer">
    <div class="text-center">
        2024 &copy; Employer Dashboard
        <a href="#" class="go-top">
            <i class="fa fa-angle-up"></i>
        </a>
    </div>
</footer> -->

<script src="js/jquery.js"></script>
<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/jquery.dcjqaccordion.2.7.js"></script>
<script src="js/jquery.scrollTo.min.js"></script>
<script src="js/jquery.nicescroll.js"></script>
<script src="js/common-scripts.js"></script>

</body>
</html>
