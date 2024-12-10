<%@page import="com.klef.jfsd.springboot.model.Student"%>
<%@page import="com.klef.jfsd.springboot.model.JobNotification"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html lang="en">

<%
    Student currentStudent = (Student) session.getAttribute("student");
	long id;
    if (currentStudent == null) {
        response.sendRedirect("studentLogin");
    }
    else{
    	id=currentStudent.getId();
    }
%>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>All Job Notifications</title>
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
        <!-- Filter Form (Frontend) -->
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-filter"></i> Filter Job Notifications
                    </header>
                    <div class="card-body">
                        <form class="form-inline filter-form" onsubmit="return false;">
                            <div class="form-group mb-2">
                                <label for="company" class="mr-2">Company:</label>
                                <input type="text" id="company" class="form-control" placeholder="Enter company name" />
                            </div>
                            <div class="form-group mb-2">
                                <label for="skillsRequired" class="mr-2">Skills Required:</label>
                                <input type="text" id="skillsRequired" class="form-control" placeholder="Enter skills" />
                            </div>
                            <div class="form-group mb-2">
                                <label for="jobTitle" class="mr-2">Job Title:</label>
                                <input type="text" id="jobTitle" class="form-control" placeholder="Enter job title" />
                            </div>
							<div class="form-group mb-2">
							    <label for="status" class="mr-2">Status:</label>
							    <select id="status" class="form-control">
							        <option value="">All Status</option>
							        <option value="Open">Open</option>
							        <option value="Closed">Closed</option>
							        <option value="On Hold">On Hold</option>
							    </select>
							</div> &nbsp;&nbsp;&nbsp;&nbsp;
                            <button type="button" class="btn btn-primary mb-2" onclick="filterJobs()">Apply Filters</button>

                            
                        </form>
                    </div>
                </section>
            </div>
        </div>

        <!-- Job Notifications Section -->
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-bell"></i> All Job Notifications
                    </header>
                    <div class="card-body">
                        <table class="table table-striped" id="jobTable">
                            <thead>
                                <tr>
                                    <th>Job Title</th>
                                    <th>Company</th>
                                    <th>Location</th>
                                    <th>Job Type</th>
                                    <th>Qualifications</th>
                                    <th>Skills Required</th>
                                    <th>Deadline</th>
                                    <th>Status</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            
								<tbody>
								    <c:forEach var="job" items="${jobNotifications}">
								        <tr class="jobRow">
								            <td><c:out value="${job.jobTitle}" /></td>
								            <td><c:out value="${job.company}" /></td>
								            <td><c:out value="${job.location}" /></td>
								            <td><c:out value="${job.jobType}" /></td>
								            <td><c:out value="${job.qualifications}" /></td>
								            <td><c:out value="${job.skillsRequired}" /></td>
								            <td><c:out value="${job.deadline}" /></td>
								            <td><c:out value="${job.status}" /></td>
								            <td>
								                <c:choose>
												    <%-- Check if the student's ID is in the applicants list --%>
												    <c:when test="${fn:contains(job.applicants,id)}">
												        <button type="button" class="btn btn-secondary btn-sm" disabled>
												            <i class="fa fa-check"></i> Applied
												        </button>
												    </c:when>
												    <%-- Check if the job is open and the deadline has not passed --%>
												    <c:when test="${job.status == 'Open' && !job.deadlinePassed}">
												        <form action="applyJob" method="post" style="display: inline;">
												            <input type="hidden" name="jobId" value="${job.id}" />
												            <button type="submit" class="btn btn-primary btn-sm">
												                <i class="fa fa-check"></i> Apply
												            </button>
												        </form>
												    </c:when>
												    <%-- Other cases (e.g., closed jobs or passed deadlines) --%>
												    <c:otherwise>
												        <button type="button" class="btn btn-danger btn-sm" disabled>
												            <i class="fa fa-ban"></i> Closed
												        </button>
												    </c:otherwise>
												</c:choose>
								            </td>
								        </tr>
								    </c:forEach>
								</tbody>
                        </table>
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

<script>
//Updated function to filter jobs, now includes the status filter
function filterJobs() {
    var companyFilter = document.getElementById("company").value.toLowerCase();
    var skillsFilter = document.getElementById("skillsRequired").value.toLowerCase();
    var jobTitleFilter = document.getElementById("jobTitle").value.toLowerCase();
    var statusFilter = document.getElementById("status").value.toLowerCase(); // Get status filter

    var jobRows = document.querySelectorAll(".jobRow");

    jobRows.forEach(function(row) {
        var jobTitle = row.cells[0].textContent.toLowerCase();
        var company = row.cells[1].textContent.toLowerCase();
        var skillsRequired = row.cells[5].textContent.toLowerCase();
        var status = row.cells[7].textContent.toLowerCase(); // Get the status from the row

        // Show or hide the job row based on all filter conditions
        if ((jobTitle.includes(jobTitleFilter) || jobTitleFilter === "") &&
            (company.includes(companyFilter) || companyFilter === "") &&
            (skillsRequired.includes(skillsFilter) || skillsFilter === "") &&
            (status.includes(statusFilter) || statusFilter === "")) {
            row.style.display = "";
        } else {
            row.style.display = "none";
        }
    });
}

</script>

</body>
</html>
