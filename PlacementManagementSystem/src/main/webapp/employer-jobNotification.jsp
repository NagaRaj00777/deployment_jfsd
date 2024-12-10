<%@page import="com.klef.jfsd.springboot.model.Employer"%>
<%@page import="com.klef.jfsd.springboot.model.JobNotification"%>
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
    <title>Employer Dashboard - Job Applications</title>
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
                        <i class="fa fa-users"></i> Applications for: <c:out value="${applications.jobTitle}" />
                    </header>
                    <div class="card-body">
                        <h5>Job Details:</h5>
                        <p><strong>Title:</strong> <c:out value="${applications.jobTitle}" /></p>
                        <p><strong>Job Description:</strong> <c:out value="${applications.jobDescription}" /></p>
                        <p><strong>Location:</strong> <c:out value="${applications.location}" /></p>
                        <p><strong>Job Type:</strong> <c:out value="${applications.jobType}" /></p>
                         <p><strong>Company:</strong> <c:out value="${applications.company}" /></p>
                          <p><strong>COntact Email:</strong> <c:out value="${applications.contactEmail}" /></p>
                        <p><strong>Qualifications:</strong> <c:out value="${applications.qualifications}" /></p>
                        <p><strong>Skills Required:</strong> <c:out value="${applications.skillsRequired}" /></p>
                         <p><strong>Deadline:</strong> <c:out value="${applications.deadline}" /></p>
                        <p><strong>Status:</strong> <c:out value="${applications.status}" /></p>
                        <p><strong>Posted Date:</strong> <c:out value="${applications.postedDate}" /></p>
                        
                        <form action="updateJobStatus" method="post">
					        <input type="hidden" name="jobId" value="${applications.id}" />
					        <label for="newStatus"><strong>Change Status:</strong></label>
					        <select id="newStatus" name="newStatus"  class="form-control" required>
					            <option value="">Select Status</option>
					            <option value="Open">Open</option>
					            <option value="Closed">Closed</option>
					            <option value="On Hold">On Hold</option>
					        </select>
					        <button type="submit" class="btn btn-primary mt-3">Update Status</button>
					    </form>                        
                    </div>
                </section>
            </div>
        </div>
        <div class="row">
    <div class="col-lg-12">
        <c:if test="${not empty message}">
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                ${message}
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        </c:if>
    </div>
</div>
        
        <div class="row">
            <div class="col-lg-12">
                <section class="card">
                    <header class="card-header">
                        <i class="fa fa-envelope"></i> Applications
                    </header>
                    <div class="card-body">
                        <table class="table table-striped">
                            <thead>
                                <tr>
                                    <th>Applicant Name</th>
                                    <th>Email</th>
                                    <th>Resume</th>
                                    <th>Actions</th>
                                </tr>
                            </thead>
                            <tbody>
								<c:forEach var="applicant" items="${applicants}">
								    <tr>
								        <td><c:out value="${applicant.name}" /></td>
								        <td><c:out value="${applicant.email}" /></td>
								        <td>
								            <!-- Check if resume URL exists -->
								            <c:choose>
								                <c:when test="${not empty applicant.resumeUrl}">
								                    <a href="${applicant.resumeUrl }" class="btn btn-link" target="_blank">
								                        Download Resume
								                    </a>
								                </c:when>
								                <c:otherwise>
								                    No resume found
								                </c:otherwise>
								            </c:choose>
								        </td>
								        <td>
								            <!-- Check if selected_companies contains the jobId -->
								            <c:choose>
								                <c:when test="${fn:contains(applicant.selected_companies, applications.id)}">
								                    <button class="btn btn-info btn-sm" disabled>Selected</button>
								                </c:when>
								                <c:otherwise>
								                    <a href="shortlistApplicant?applicantId=${applicant.id}&jobId=${applications.id}" class="btn btn-success btn-sm">
								                        Shortlist
								                    </a>
								                    <a href="rejectApplicant?applicantId=${applicant.id}&jobId=${applications.id}" class="btn btn-danger btn-sm">
								                        Reject
								                    </a>
								                </c:otherwise>
								            </c:choose>
								            <a href="viewStudentDetails?applicantId=${applicant.id}&applicantionId=${applications.id}" class="btn btn-primary btn-sm">View Details</a>
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
        2024 &copy; Employer Dashboard
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
