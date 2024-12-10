package com.klef.jfsd.springboot.controller;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.klef.jfsd.springboot.model.Employer;
import com.klef.jfsd.springboot.model.JobNotification;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.EmployerService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class EmployerController {
	@Autowired
	private EmployerService employerService;
	
	
	
	
	@GetMapping("employerRegister")
	public String employerRegister() {
		
        
		return "employer-register";
	}

	@PostMapping("employerRegister")
	public String handleEmployerRegister(HttpServletRequest request, Model model) {
	    try {
	        String companyName = request.getParameter("companyName");
	        String contactPerson = request.getParameter("contactPerson");
	        String contactEmail = request.getParameter("contactEmail");
	        String contactPhone = request.getParameter("contactPhone");
	        String address = request.getParameter("address");
	        String website = request.getParameter("website");
	        String industryType = request.getParameter("industryType");
	        String username = request.getParameter("username");
	        String password = request.getParameter("password");
	       

	        Employer employer = new Employer();
	        employer.setCompanyName(companyName);
	        employer.setContactPerson(contactPerson);
	        employer.setContactEmail(contactEmail);
	        employer.setContactPhone(contactPhone);
	        employer.setAddress(address);
	        employer.setWebsite(website);
	        employer.setIndustryType(industryType);
	        employer.setUsername(username);
	        employer.setPassword(password);
	        employer.setVerified(false);

	        employerService.saveEmployer(employer);

	        model.addAttribute("successMessage", "Registration successful! Please log in.");
	        return "redirect:employerLogin";
	    } catch (Exception e) {
	        model.addAttribute("errorMessage", "Registration failed. Please try again.");
	        return "employer-register";
	    }
	}

	@GetMapping("employerLogin")
	public String employerLogin() {
		return "employer-login";
	}
	@PostMapping("employerLogin")
	public String handleEmployerLogin(HttpServletRequest request, Model model) {
	    String username = request.getParameter("username");
	    String password = request.getParameter("password");

	    try {
	        Employer employer = employerService.authenticateEmployer(username, password);
	        request.getSession().setAttribute("employer", employer);
	        return "redirect:employerDashboard"; 
	    } catch (Exception e) {
	        model.addAttribute("errorMessage", "Invalid username or password.");
	        return "employer-login"; 
	    }
	}
	
	@GetMapping("employerDashboard")
	public String employerDashboard(HttpServletRequest request, Model model) {
		Employer currentEmployer = (Employer) request.getSession().getAttribute("employer");

        if (currentEmployer == null) {
            return "redirect:/employerLogin";  
        }

        List<JobNotification> postedJobs = employerService.getJobsByEmployer(currentEmployer);
		
		model.addAttribute("postedJobs", postedJobs);
		return "employer-dashboard";
	}
	
	@GetMapping("/updateEmployerProfile")
    public String showUpdateEmployerProfileForm(Model model) {
        Employer currentEmployer = (Employer) model.getAttribute("employer");
//        if (currentEmployer == null) {
//            return "redirect:/employerLogin"; // Redirect to login if not logged in
//        }
        model.addAttribute("employer", currentEmployer);
        return "employer-update"; // JSP page for the employer update
    }
	
	@PostMapping("/updateEmployerProfile")
	public String updateEmployerProfile(HttpServletRequest request) {
	    String companyName = request.getParameter("companyName");
	    String contactPerson = request.getParameter("contactPerson");
	    String email = request.getParameter("email");
	    String phoneNumber = request.getParameter("phoneNumber");
	    String industryType = request.getParameter("industryType");
	    String companyAddress = request.getParameter("companyAddress");
	    String websiteUrl = request.getParameter("websiteUrl");
	    String password = request.getParameter("password");

	    Employer currentEmployer = (Employer) request.getSession().getAttribute("employer");

	    if (currentEmployer != null) {
	        currentEmployer.setCompanyName(companyName);
	        currentEmployer.setContactPerson(contactPerson);
	        currentEmployer.setContactEmail(email);
	        currentEmployer.setContactPhone(phoneNumber);
	        currentEmployer.setIndustryType(industryType);
	        currentEmployer.setAddress(companyAddress);
	        currentEmployer.setWebsite(websiteUrl);

	        if (password != null && !password.isEmpty()) {
	            currentEmployer.setPassword(password); 
	        }

	        employerService.updateEmployer(currentEmployer); 
	    }

	    return "redirect:/updateEmployerProfile";
	}
	@GetMapping("/jobPosting")
    public String showJobPostingPage(HttpServletRequest request, Model model) {
        Employer currentEmployer = (Employer) request.getSession().getAttribute("employer");

        if (currentEmployer == null) {
            return "redirect:/employerLogin";  
        }

        List<JobNotification> postedJobs = employerService.getJobsByEmployer(currentEmployer);
        if(postedJobs.size()==0) {
        	System.out.println("Null");
        }
        for(JobNotification j:postedJobs) {
        	System.out.println(j.getJobTitle());
        }

        model.addAttribute("employer", currentEmployer);
        model.addAttribute("postedJobs", postedJobs);

        return "employer-jobPosting";  // Return the JSP view name
    }
	@PostMapping("/createJobNotification")
	public String createJobNotification(HttpServletRequest request, HttpSession session, RedirectAttributes redirectAttributes) {
	    Employer currentEmployer = (Employer) session.getAttribute("employer");

	    if (currentEmployer == null) {
	        return "redirect:/employerLogin";
	    }

	    try {
	        // Retrieve form data from HttpServletRequest
	        String jobTitle = request.getParameter("jobTitle");
	        String jobDescription = request.getParameter("jobDescription");
	        String jobType = request.getParameter("jobType");
	        String location = request.getParameter("location");
	        String contactEmail = request.getParameter("contactEmail");
	        String qualifications = request.getParameter("qualifications");
	        String skillsRequired = request.getParameter("skillsRequired");
	        String deadline = request.getParameter("deadline"); // String deadline

	        // Create and populate a new JobNotification object
	        JobNotification jobNotification = new JobNotification();
	        jobNotification.setEmployerId(currentEmployer.getId()); // Set Employer ID
	        jobNotification.setJobTitle(jobTitle);
	        jobNotification.setJobDescription(jobDescription);
	        jobNotification.setJobType(jobType);
	        jobNotification.setLocation(location);
	        jobNotification.setCompany(currentEmployer.getCompanyName());
	        jobNotification.setContactEmail(contactEmail);
	        jobNotification.setQualifications(qualifications);
	        jobNotification.setSkillsRequired(skillsRequired);
	        jobNotification.setDeadline(deadline); // Directly set the string deadline
	        jobNotification.setPostedDate(LocalDate.now().toString()); // Convert LocalDate to String
	        jobNotification.setStatus("Open");

	        employerService.saveJobNotification(jobNotification);

	        redirectAttributes.addFlashAttribute("successMessage", "Job posted successfully!");
	    } catch (Exception e) {
	        redirectAttributes.addFlashAttribute("errorMessage", "Failed to post job. Please try again.");
	    }

	    return "redirect:/jobPosting";
	}
	
	@GetMapping("/viewJobApplications")
	public String viewJobApplications(@RequestParam("jobId") Long jobId, Model model) {
	    JobNotification applications = employerService.getApplicationsByJobId(jobId);

	    List<Long> applicantIds = applications.getApplicants();
	    
	    List<Student> applicants=new ArrayList<Student>();
	    for(Long a:applicantIds) {
	    	if(!applicants.contains(employerService.getStudentById(a)))
	    	applicants.add( employerService.getStudentById(a) );
	    }
	    
	    model.addAttribute("applications", applications);
	    model.addAttribute("applicants", applicants); // Add applicants separately

	    return "employer-jobNotification";
	}
	@GetMapping("/viewStudentDetails")
	public String viewStudentDetails(@RequestParam("applicantId") Long applicantId,@RequestParam("applicantionId") Long applicantionId ,Model model) {
	    Student student = employerService.getStudentById(applicantId);
	    model.addAttribute("student", student);
	    model.addAttribute("applicantionId", applicantionId);
	    
	    return "employer-viewStudentDetails";  
	}



	@PostMapping("/updateJobStatus")
    public String updateJobStatus(
            @RequestParam("jobId") long jobId,
            @RequestParam("newStatus") String newStatus,
            RedirectAttributes redirectAttributes) {

        boolean isUpdated = employerService.updateJobStatus(jobId, newStatus);

        if (isUpdated) {
            redirectAttributes.addFlashAttribute("message", "Job status updated successfully.");
        } else {
            redirectAttributes.addFlashAttribute("error", "Failed to update job status.");
        }

        return "redirect:/jobPosting"; 
    }

	
	@GetMapping("/editJob")
    public String editJob(@RequestParam("jobId") Long jobId, Model model) {
        JobNotification job = employerService.getApplicationsByJobId(jobId);
        model.addAttribute("job", job);
        return "employer-editJob";
    }
	@PostMapping("/updateJob")
	public String updateJob(HttpServletRequest request) {
		HttpSession session=request.getSession();
		Employer  employer= (Employer) session.getAttribute("employer");
		

		if (employer == null) {
		    return "employerLogin";
		}
	    Long id = Long.parseLong(request.getParameter("id"));
	    String jobTitle = request.getParameter("jobTitle");
	    String jobDescription = request.getParameter("jobDescription");
	    String jobType = request.getParameter("jobType");
	    String location = request.getParameter("location");
	    String company = request.getParameter("company");
	    String contactEmail = request.getParameter("contactEmail");
	    String qualifications = request.getParameter("qualifications");
	    String skillsRequired = request.getParameter("skillsRequired");
	    String deadline = request.getParameter("deadline");
	    String status = request.getParameter("status");
	    

	    JobNotification updatedJob = employerService.getApplicationsByJobId(id);
	    updatedJob.setId(id);
	    updatedJob.setJobTitle(jobTitle);
	    updatedJob.setJobDescription(jobDescription);
	    updatedJob.setJobType(jobType);
	    updatedJob.setLocation(location);
	    updatedJob.setCompany(company);
	    updatedJob.setContactEmail(contactEmail);
	    updatedJob.setQualifications(qualifications);
	    updatedJob.setSkillsRequired(skillsRequired);
	    updatedJob.setDeadline(deadline);
	    updatedJob.setEmployerId(employer.getId());
	    updatedJob.setStatus(status);

	    employerService.updateJob(updatedJob);

	    return "redirect:/employerDashboard"; 
	}

	@GetMapping("/shortlistApplicant")
	public String shortlistApplicant(@RequestParam("applicantId") Long applicantId,
	                                 @RequestParam("jobId") Long jobId, Model model, RedirectAttributes redirectAttributes) throws Exception {
		System.out.println("short list started");
	    employerService.shortlistApplicant(applicantId, jobId);
	    
	    Student student= employerService.getStudentById(applicantId);
	    JobNotification jobNotification=employerService.getApplicationsByJobId(jobId);
	    
	    redirectAttributes.addFlashAttribute("message", "Email sent to " + student.getName() + " successfully!");

	    
	    sendShortlistEmail(student, jobNotification);
	    return "redirect:/viewJobApplications?jobId=" + jobId; 
	 }
	
	@GetMapping("/rejectApplicant")
	public String rejectApplicant(@RequestParam("applicantId") Long applicantId,@RequestParam("jobId") Long jobId, Model model) {
	    Student student = employerService.getStudentById(applicantId); 

	    try {
	        sendRejectionEmail(student);
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("error", "Error sending email notification.");
	    }
	    
	    return "redirect:/viewJobApplications?jobId=" + jobId;
	}


	
	
	@Autowired
	private JavaMailSender mailSender;

	public void sendShortlistEmail(Student student, JobNotification jobNotification) throws Exception {
	    // Prepare the subject and message for the email
	    String subject = "Congratulations! You have been shortlisted";
	    String message = "Dear " + student.getName() + ",\n\n" +
	                     "We are pleased to inform you that you have been shortlisted for the job application with our company.\n" +
	                     "Job Title: " + jobNotification.getJobTitle() + "\n" + // Ensure you have the job title field in your Student object
	                     "We will get back to you soon with further details.\n\n" +
	                     "Best regards,\n" +
	                     "The Employer Team";

	    // Send email to the student
	    sendEmail(student.getEmail(), subject, message);
	}
	public void sendRejectionEmail(Student student) throws Exception {
	    String subject = "Job Application Status: Rejected";
	    String message = "Dear " + student.getName() + ",\n\n" +
	                     "We regret to inform you that your application for the job position at our company has been rejected.\n" +
	                     "We appreciate your interest in the role and encourage you to apply for future openings that match your skills.\n\n" +
	                     "Best regards,\n" +
	                     "The Employer Team";

	    // Send the email to the student
	    sendEmail(student.getEmail(), subject, message);
	}


	public void sendEmail(String toEmail, String subject, String message) throws Exception {
	    MimeMessage mimeMessage = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
	    
	    helper.setTo(toEmail);
	    helper.setSubject(subject);
	    helper.setFrom("saisatyapradeep@gmail.com");  // Change this to your sender email address
	    
	    String htmlContent = 
	        "<h3>Email Notification</h3>" +
	        "<p><strong>Subject:</strong> " + subject + "</p>" +
	        "<p><strong>Message:</strong><br/>" + message.replace("\n", "<br/>") + "</p>";

	    helper.setText(htmlContent, true);
	    
	    // Send the email
	    mailSender.send(mimeMessage);
	}

	


	

}
