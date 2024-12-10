<%@page import="com.klef.jfsd.springboot.model.Employer"%>
<%@page import="com.klef.jfsd.springboot.model.JobNotification"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
    <title>Edit Job - Employer Dashboard</title>
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
    </style></head>

<%@ include file="employer-header.jsp" %>

<section id="main-content">
    <section class="wrapper">
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-edit"></i> Edit Job
                    </header>
                    <div class="card-body">
                        <form action="updateJob" method="post">
                            <input type="hidden" name="id" value="${job.id}" />

                            <div class="mb-3">
                                <label for="jobTitle" class="form-label"><strong>Job Title</strong></label>
                                <input type="text" class="form-control" id="jobTitle" name="jobTitle" value="${job.jobTitle}" required>
                            </div>

                            <div class="mb-3">
                                <label for="jobDescription" class="form-label"><strong>Job Description</strong></label>
                                <textarea class="form-control" id="jobDescription" name="jobDescription" rows="4" required>${job.jobDescription}</textarea>
                            </div>

							<div class="mb-3">
							    <label for="jobType" class="form-label"><strong>Job Type</strong></label>
							    <select class="form-control" id="jobType" name="jobType" required>
							        <option value="fulltime" <c:if test="${job.jobType == 'fulltime'}">selected</c:if>>Full-time</option>
							        <option value="parttime" <c:if test="${job.jobType == 'parttime'}">selected</c:if>>Part-time</option>
							        <option value="internship" <c:if test="${job.jobType == 'internship'}">selected</c:if>>Internship</option>
							    </select>
							</div>


                            <div class="mb-3">
                                <label for="location" class="form-label"><strong>Location</strong></label>
                                <input type="text" class="form-control" id="location" name="location" value="${job.location}" required>
                            </div>

                            <div class="mb-3">
                                <label for="company" class="form-label"><strong>Company</strong></label>
                                <input type="text" class="form-control" id="company" name="company" value="${job.company}" required>
                            </div>

                            <div class="mb-3">
                                <label for="contactEmail" class="form-label"><strong>Contact Email</strong></label>
                                <input type="email" class="form-control" id="contactEmail" name="contactEmail" value="${job.contactEmail}" required>
                            </div>

                            <div class="mb-3">
                                <label for="qualifications" class="form-label"><strong>Qualifications</strong></label>
                                <input type="text" class="form-control" id="qualifications" name="qualifications" value="${job.qualifications}" required>
                            </div>

                            <div class="mb-3">
                                <label for="skillsRequired" class="form-label"><strong>Skills Required</strong></label>
                                <input type="text" class="form-control" id="skillsRequired" name="skillsRequired" value="${job.skillsRequired}" required>
                            </div>

                            <div class="mb-3">
                                <label for="deadline" class="form-label"><strong>Deadline</strong></label>
                                <input type="date" class="form-control" id="deadline" name="deadline" value="${job.deadline}" required>
                            </div>

                            <div class="mb-3">
                                <label for="status" class="form-label"><strong>Status</strong></label>
                                <input type="text" class="form-control" id="status" name="status" value="${job.status}" required>
                            </div>

                            <div class="mb-3">
                                <label for="postedDate" class="form-label"><strong>Posted Date</strong></label>
                                <input type="date" class="form-control" id="postedDate" name="postedDate" value="${job.postedDate}" readonly>
                            </div>

                            <button type="submit" class="btn btn-primary"><i class="fa fa-save"></i> Update Job</button>
                        </form>
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
