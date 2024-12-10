<%@ include file="header.jsp" %>

<!-- Custom CSS for Styling -->
<style>
    /* General Card Styling */
    .card {
        border-radius: 12px;
        transition: transform 0.2s, box-shadow 0.2s;
    }

    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    }

    /* Button Styling */
    .btn-lg {
        padding: 12px 24px;
        font-size: 18px;
        border-radius: 8px;
    }

    /* Icon Styling */
    .fa {
        transition: color 0.2s;
    }

    .card:hover .fa {
        color: #343a40;
    }

    /* Responsive Margins */
    @media (max-width: 768px) {
        .mt-5 {
            margin-top: 2rem;
        }
    }
</style>

<section id="main-content">
    <section class="wrapper">
        <div class="container mt-5">
            <!-- Login Options Section -->
            <div class="row justify-content-center text-center mb-5">
                <!-- Student Login Card -->
                <div class="col-lg-4 col-sm-6 mb-4">
                    <div class="card shadow-sm border-0 h-100">
                        <div class="card-body">
                            <i class="fa fa-user mb-3" style="font-size: 60px; color: #007bff;"></i>
                            <h3 class="mb-3">Student Login</h3>
                            <p class="text-muted">Access the student portal for managing profiles and applications.</p>
                            <a href="studentLogin" class="btn btn-primary btn-lg mt-2">Login</a>
                        </div>
                    </div>
                </div>

                <!-- Admin Login Card -->
                <div class="col-lg-4 col-sm-6 mb-4">
                    <div class="card shadow-sm border-0 h-100">
                        <div class="card-body">
                            <i class="fa fa-building mb-3" style="font-size: 60px; color: #28a745;"></i>
                            <h3 class="mb-3">Admin Login</h3>
                            <p class="text-muted">Access the admin portal to post job openings and view applications.</p>
                            <a href="employerLogin" class="btn btn-success btn-lg mt-2">Login</a>
                        </div>
                    </div>
                </div>
            </div>

            <!-- About and Contact Section -->
            <div class="row">
                <!-- About Us Card -->
                <div class="col-lg-6 mb-4">
                    <div class="card shadow-sm border-0 h-100">
                        <div class="card-body text-center">
                            <h3 class="mb-3">About Us</h3>
                            <p class="text-muted">We are a platform connecting students with employers for job opportunities.</p>
                            <a href="about.jsp" class="btn btn-info btn-lg mt-2">Learn More</a>
                        </div>
                    </div>
                </div>

                <!-- Contact Us Card -->
                <div class="col-lg-6 mb-4">
                    <div class="card shadow-sm border-0 h-100">
                        <div class="card-body text-center">
                            <h3 class="mb-3">Contact Us</h3>
                            <p class="text-muted">Have any questions? Get in touch with us for support and inquiries.</p>
                            <a href="about.jsp" class="btn btn-info btn-lg mt-2">Contact Us</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
</section>

