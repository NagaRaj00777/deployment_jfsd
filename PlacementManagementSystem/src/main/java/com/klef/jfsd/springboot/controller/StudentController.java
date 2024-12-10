package com.klef.jfsd.springboot.controller;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.klef.jfsd.springboot.model.Application;
import com.klef.jfsd.springboot.model.Internship;
import com.klef.jfsd.springboot.model.JobNotification;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.service.EmployerService;
import com.klef.jfsd.springboot.service.StudentService;

import jakarta.mail.internet.MimeMessage;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	@Autowired
	private EmployerService employerService;
	
	
	
	
	
	@GetMapping("studentRegister")
	public String studentRegister() {
		return "student-register";
	}
	@PostMapping("/registerStudent")
	public String registerStudent(HttpServletRequest request, Model model) {
	    try {
	        String name = request.getParameter("name");
	        String email = request.getParameter("email");
	        String password = request.getParameter("password");
	        String address = request.getParameter("address");
	        String phoneNumber = request.getParameter("phoneNumber");
	        String dateOfBirth = request.getParameter("dateOfBirth");
	        String gender = request.getParameter("gender");
	        String registrationNumber = request.getParameter("registrationNumber");
	        String department = request.getParameter("department");
	        String yearOfStudy = request.getParameter("yearOfStudy");
	        String cgpa = request.getParameter("cgpa");
	        String resumeUrl = request.getParameter("resumeUrl");
	        String placementStatus = request.getParameter("placementStatus");
	        String backlogs = request.getParameter("backlogs");

	        // Validate and assign values
	        Student student = new Student();
	        student.setName(name);
	        student.setEmail(email);
	        student.setPassword(password);
	        student.setAddress(address);
	        student.setPhoneNumber(phoneNumber);
	        student.setDateOfBirth(dateOfBirth);
	        student.setGender(gender);
	        student.setRegistrationNumber(registrationNumber);
	        student.setDepartment(department);
	        student.setYearOfStudy(yearOfStudy != null && !yearOfStudy.isEmpty() ? Integer.parseInt(yearOfStudy) : 0);
	        student.setCgpa(cgpa != null && !cgpa.isEmpty() ? Double.parseDouble(cgpa) : 0.0);
	        student.setResumeUrl(resumeUrl);
	        student.setPlacementStatus(placementStatus);
	        student.setBacklogs(backlogs != null && !backlogs.isEmpty() ? Integer.parseInt(backlogs) : 0);

	        // Default empty lists
	        List<String> dummyList = new ArrayList<>();
	        student.setAchievements(dummyList);
	        student.setProjects(dummyList);
	        student.setAppliedCompanies(dummyList);
	        student.setCertifications(dummyList);
	        student.setSelectedCompany("0");
	        student.setInternshipExperience("none");

	        studentService.saveStudent(student);

	        return "redirect:/studentLogin";
	    } catch (Exception e) {
	        e.printStackTrace();
	        model.addAttribute("errorMessage", "An error occurred: " + e.getMessage());
	        return "redirect:/student-register";
	       
	    }
	}
	
	
	
	@GetMapping("studentLogin")
	public String studentLogin() {
		return "student-login";
	}
	
	@PostMapping("/studentLogin")
	public String loginStudent(@RequestParam("email") String email,
	                           @RequestParam("password") String password,
	                           HttpServletRequest request) {
	    try {
	        Student student = studentService.checkLogin(email, password);
	        
	        if (student != null) {
	            request.getSession().setAttribute("student", student);
	            return "redirect:/studentDashboard"; 
	        } else {
	            request.setAttribute("errorMessage", "Invalid email or password");
	            return "student-login"; 
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	        request.setAttribute("errorMessage", "An error occurred during login. Please try again.");
	        return "student-login";
	    }
	}
	@GetMapping("/studentDashboard")
	public String studentDashboard(Model model, HttpSession session) {
	    // Assuming studentId is stored in session
		
		
		
		Student student = (Student) session.getAttribute("student");
		
		if(student==null){
			return "redirect:/studentLogin";
		}
		List<String> companies=student.getAppliedCompanies();
	    
	    List<JobNotification> appliedJobs = studentService.getJobsByCompanies(companies);

	    model.addAttribute("student", student);
	    model.addAttribute("appliedJobs", appliedJobs);

	    return "student-dashboard";
	}
	
	@GetMapping("updateStudent")
	public String updateStudent(Model model, HttpServletRequest request) {
		Student student=(Student)request.getSession().getAttribute("student");
		model.addAttribute("student", student);
		return "student-update";
	}
	
	@PostMapping("/updateStudentProfile")
    public String updateStudentProfile(HttpServletRequest request, HttpSession session) {
        try {
            // Retrieve the current student from the session
            Student currentStudent = (Student) session.getAttribute("student");
            if (currentStudent != null) {
                // Retrieve updated values from the request
                String name = request.getParameter("name");
                String email = request.getParameter("email");
                String phoneNumber = request.getParameter("phoneNumber");
                String department = request.getParameter("department");
                int yearOfStudy = Integer.parseInt(request.getParameter("yearOfStudy"));
                double cgpa = Double.parseDouble(request.getParameter("cgpa"));
                String resumeUrl = request.getParameter("resumeUrl");
                String skills = request.getParameter("skills");
                String internshipExperience = request.getParameter("internshipExperience");
                String password = request.getParameter("password"); // Optional password update

                // Set the updated values to the current student object
                currentStudent.setName(name);
                currentStudent.setEmail(email);
                currentStudent.setPhoneNumber(phoneNumber);
                currentStudent.setDepartment(department);
                currentStudent.setYearOfStudy(yearOfStudy);
                currentStudent.setCgpa(cgpa);
                currentStudent.setResumeUrl(resumeUrl);
                currentStudent.setSkills(Arrays.asList(skills.split(",")));
                currentStudent.setInternshipExperience(internshipExperience);
                if (!password.isEmpty()) {
                    currentStudent.setPassword(password); // Update password only if it's provided
                }

                // Call the service to update the student in the database
                studentService.updateStudentProfile(currentStudent);

                // Update the session with the new student data
                session.setAttribute("student", currentStudent);

                return "redirect:/studentDashboard"; // Redirect to student dashboard
            }
            return "redirect:/studentLogin"; // If session expired, redirect to login
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while updating the profile.");
            return "student-update"; // Show the update page again with an error message
        }
    }
	
	
	@GetMapping("/viewAllJobNotifications")
	public String viewAllJobNotifications(HttpSession session, Model model) {
	    Student currentStudent = (Student) session.getAttribute("student");
	    if (currentStudent == null) {
	        return "redirect:studentLogin";
	    }

	    List<JobNotification> jobNotifications = studentService.getAllJobNotifications();

	    // Get today's date
	    LocalDate today = LocalDate.now();
	    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");

	    for (JobNotification job : jobNotifications) {
	        LocalDate deadlineDate = LocalDate.parse(job.getDeadline(), formatter);
	        job.setDeadlinePassed(deadlineDate.isBefore(today));
	    }

	    model.addAttribute("jobNotifications", jobNotifications);
	    model.addAttribute("id", currentStudent.getId());

	    return "student-viewAllJobNotifications";
	}

	
	@PostMapping("/applyJob")
    public String applyForJob(HttpSession session, Long jobId, Model model, HttpServletRequest request) {
        Student currentStudent = (Student) session.getAttribute("student");
        if (currentStudent == null) {
            return "redirect:studentLogin"; 
        }
        long jobid=Long.parseLong( request.getParameter("jobId"));
        
        JobNotification jobNotification = studentService.getJobById(jobid);
        Application application =new Application();
        application.setJobId(jobId);
        application.setStudentId(currentStudent.getId());
        List<String> appliedCompanied= currentStudent.getAppliedCompanies();
        if(!appliedCompanied.contains(request.getParameter("jobId")))
        	appliedCompanied.add(request.getParameter("jobId"));
        List<Long> applicants=jobNotification.getApplicants();
        applicants.add(currentStudent.getId());
        
        

        String isApplied = studentService.applyForJob(application, currentStudent, jobNotification);
        
        if (isApplied!=null) {
            model.addAttribute("successMessage", "Successfully applied for the job.");
        } else {
            model.addAttribute("errorMessage", "Failed to apply for the job.");
        }
        

        return "redirect:/viewAllJobNotifications"; 
    }
	
	@GetMapping("/viewAppliedJobs")
	public String viewAppliedJobs(HttpSession session, Model model) {
	    Student currentStudent = (Student) session.getAttribute("student");
	    if (currentStudent == null) {
	        return "redirect:studentLogin";
	    }

	    // Get the list of companies the student has applied to
	    List<String> appliedCompanies = currentStudent.getAppliedCompanies();

	    // Fetch applied jobs based on companies
	    List<JobNotification> appliedJobs = studentService.getJobsByCompanies(appliedCompanies);

	    // Remove duplicates by converting the list to a Set
	    Set<JobNotification> appliedJobsSet = new HashSet<>(appliedJobs);
	    appliedJobs = new ArrayList<>(appliedJobsSet);  // Convert back to a list

	    // Add the unique jobs to the model
	    model.addAttribute("appliedJobs", appliedJobs);

	    return "student-viewAppliedJobs"; // Return the view to show applied jobs
	}


	
	@PostMapping("/withdrawJobApplication")
	public String withdrawJobApplication(HttpSession session, @RequestParam("jobId") Long jobId) {
	    Student currentStudent = (Student) session.getAttribute("student");
	    if (currentStudent == null) {
	        return "redirect:studentLogin";
	    }
	    
	    List<String> selectedCompanies=currentStudent.getSelected_companies();
	    selectedCompanies.remove(Long.toString(jobId));
	    
	    JobNotification applications = employerService.getApplicationsByJobId(jobId);
	    List<Long> applicantIds = applications.getApplicants();
	    applicantIds.remove(currentStudent.getId());
	    
	    JobNotification jobNotification = studentService.getJobById(jobId);
	    
	    if (jobNotification != null) {
	        List<String> appliedCompanies = currentStudent.getAppliedCompanies();
	        appliedCompanies.remove(Long.toString(  jobNotification.getId()));

	        currentStudent.setAppliedCompanies(appliedCompanies);
	        studentService.saveStudent(currentStudent);  
	        employerService.saveJobNotification(applications);
	    }

	    return "redirect:/viewAppliedJobs";
	}
	
	@GetMapping("/student-viewCertifications")
    public String viewCertifications(HttpSession session, Model model) {
        // Get the current student from the session
        Student student = (Student) session.getAttribute("student");

        if (student == null) {
            return "redirect:/studentLogin"; // Redirect if student is not logged in
        }

        // Retrieve the list of certifications
        List<String> certifications = student.getCertifications();

        // Add the certifications and student details to the model
        model.addAttribute("certifications", certifications);
        model.addAttribute("currentStudent", student);

        return "student-viewCertifications"; // Return the view to display certifications
    }
	
	@PostMapping("/addCertification")
    public String addCertification(HttpSession session, @RequestParam("certification") String certification) {
        Student student = (Student) session.getAttribute("student");

        if (student != null) {
            List<String> certifications = student.getCertifications();
            if(!certifications.contains(certification))
            	certifications.add(certification);

            student.setCertifications(certifications);
           studentService.saveStudent(student);
        }

        return "redirect:/student-viewCertifications";
    }
	@PostMapping("/removeCertification")
    public String removeCertification(HttpSession session, @RequestParam("certification") String certification) {
        Student student = (Student) session.getAttribute("student");

        if (student != null) {
            List<String> certifications = student.getCertifications();
            certifications.remove(certification);  // Remove the certification
            student.setCertifications(certifications);
            studentService.saveStudent(student);
        }

        return "redirect:/student-viewCertifications";
    }
	
	
	@GetMapping("sendMail")
	public String sendMail() {
		return "student-mail";
	}
	@Autowired
	private JavaMailSender mailSender;

	@PostMapping("sendEmail")
	public ModelAndView sendEmail(HttpServletRequest request) throws Exception {
	    String employerEmail = request.getParameter("employerEmail");
	    String subject = request.getParameter("subject");
	    String message = request.getParameter("message");
	    
	    int otp = (int)(Math.random() * 99999);

	    MimeMessage mimeMessage = mailSender.createMimeMessage();
	    MimeMessageHelper helper = new MimeMessageHelper(mimeMessage, true);
	    helper.setTo(employerEmail);
	    helper.setSubject(subject);
	    helper.setFrom("saisatyapradeep@gmail.com");
	    
	    String htmlContent = 
	        "<h3>Email Details</h3>" +
	        "<p><strong>Subject:</strong> " + subject + "</p>" +
	        "<p><strong>Message:</strong> " + message + "</p>" ;

	    helper.setText(htmlContent, true);
	    
	    mailSender.send(mimeMessage);

	    ModelAndView mv = new ModelAndView("redirect:/sendMail");
	    mv.addObject("message", "Email Sent Successfully");
	    return mv;
	}
	@GetMapping("/student-viewAllInternships")
    public String viewAllInternships(HttpSession session, Model model) {
        Student currentStudent = (Student) session.getAttribute("student");

        if (currentStudent == null) {
            return "redirect:/studentLogin";
        }

        List<Internship> internships = studentService.getAllInternships();
        model.addAttribute("internships", internships);

        return "student-viewAllInternships";
    }
	@PostMapping("/addInternship")
	public String addInternship(HttpServletRequest request, HttpSession session) {
	    Student student = (Student) session.getAttribute("student");

	    if (student == null) {
	        return "redirect:/studentLogin";
	    }

	    Internship newInternship = new Internship();
	    newInternship.setTitle(request.getParameter("title"));
	    newInternship.setRole(request.getParameter("role"));
	    newInternship.setCompanyName(request.getParameter("company"));
	    newInternship.setDuration(request.getParameter("duration"));
	    newInternship.setSkillsLearned(request.getParameter("skillsLearned"));
	    newInternship.setInternshipDescription(request.getParameter("internshipDescription"));
	    newInternship.setLocation(request.getParameter("location"));
	    newInternship.setStudent(student);
	    
	    student.setInternshipExperience("I have done"+student.getInternships().size()+1);
	    studentService.saveStudent(student);
	    studentService.saveInternship(newInternship);

	    return "redirect:/student-viewAllInternships"; // Redirect to the internships view
	}
	@PostMapping("/deleteInternship")
	public String deleteInternship(@RequestParam Long id, HttpSession session) {
	    Student currentStudent = (Student) session.getAttribute("student");
	    
	    if (currentStudent == null) {
	        return "redirect:/studentLogin";
	    }
	    studentService.deleteInternship(id);
	    
	    return "redirect:/student-viewAllInternships";
	}




	
	@GetMapping("logout")
	public String logout(HttpServletRequest request) {
		HttpSession session=request.getSession();
		session.invalidate();
		return "redirect:/";
	}

	

}
