<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="css/bootstrap-reset.css" rel="stylesheet">
    <link href="assets/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/slidebars.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/style-responsive.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
</head>

<%@ include file="admin-header.jsp" %>

<section id="main-content">
    <section class="wrapper">
        <div class="row state-overview">
            <div class="col-lg-3 col-sm-6">
                <section class="card">
                    <div class="symbol terques">
                        <i class="fa fa-users"></i>
                    </div>
                    <div class="value">
                        <h1 class="count">0</h1>
                        <p>Total Users</p>
                    </div>
                </section>
            </div>
            <div class="col-lg-3 col-sm-6">
                <section class="card">
                    <div class="symbol red">
                        <i class="fa fa-briefcase"></i>
                    </div>
                    <div class="value">
                        <h1 class="count2">0</h1>
                        <p>Job Openings</p>
                    </div>
                </section>
            </div>
            <div class="col-lg-3 col-sm-6">
                <section class="card">
                    <div class="symbol yellow">
                        <i class="fa fa-file-text"></i>
                    </div>
                    <div class="value">
                        <h1 class="count3">0</h1>
                        <p>Applications</p>
                    </div>
                </section>
            </div>
            <div class="col-lg-3 col-sm-6">
                <section class="card">
                    <div class="symbol blue">
                        <i class="fa fa-bar-chart-o"></i>
                    </div>
                    <div class="value">
                        <h1 class="count4">0</h1>
                        <p>Reports Generated</p>
                    </div>
                </section>
            </div>
        </div>
    </section>
</section>

<footer class="site-footer">
    <div class="text-center">
        2024 &copy; Admin Dashboard
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
