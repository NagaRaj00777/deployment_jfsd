<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<body class="light-sidebar-nav">
    <section id="container">
        <!-- Header -->
        <header class="header white-bg">
            <div class="sidebar-toggle-box">
                <i class="fa fa-bars"></i>
            </div>
            <a href="employerDashboard" class="logo">Admin<span>Dashboard</span></a>
            <div class="top-nav">
                <ul class="nav pull-right top-menu">
                    <li>
                        <input type="text" class="form-control search" placeholder="Search">
                    </li>
                    <li class="dropdown">
                        <a data-toggle="dropdown" class="dropdown-toggle" href="#">
                            <img alt="Student Avatar" src="img/avatar1_small.jpg">
                            <span class="username"><c:out value="${employer.contactPerson}" /></span>
                            <b class="caret"></b>
                        </a>
                        <ul class="dropdown-menu extended logout dropdown-menu-right">
                            <li><a href="updateEmployerProfile"><i class="fa fa-suitcase"></i>Update Profile</a></li>
                            <li><a href="logout"><i class="fa fa-key"></i> Log Out</a></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </header>

        <!-- Sidebar -->
        <aside>
            <div id="sidebar" class="nav-collapse">
                <ul class="sidebar-menu" id="nav-accordion">
                    <li>
                        <a class="active" href="employerDashboard">
                            <i class="fa fa-dashboard"></i>
                            <span>Dashboard</span>
                        </a>
                    </li>
                    <li>
                        <a href="jobPosting">
                            <i class="fa fa-briefcase"></i>
                            <span>Manage Jobs</span>
                        </a>
                    </li>
                   <!--  <li>
                        <a href="employerApplicants">
                            <i class="fa fa-users"></i>
                            <span>Applicants</span>
                        </a>
                    </li> -->
                    
                    
                    <li>
                        <a href="updateEmployerProfile">
                            <i class="fa fa-cog"></i>
                            <span>Settings</span>
                        </a>
                    </li>
                  <!--    <li>
                          <a href="index">
                            <i class="fa fa-sign-out"></i>
                            <span>Log Out</span>
                        </a>
                    </li>  -->
                </ul>
            </div>
        </aside>
    </section>
</body>
