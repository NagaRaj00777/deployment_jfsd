package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.klef.jfsd.springboot.model.Admin;
import com.klef.jfsd.springboot.model.Employer;
import com.klef.jfsd.springboot.model.JobNotification;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.AdminRepository;
import com.klef.jfsd.springboot.repository.EmployerRepository;
import com.klef.jfsd.springboot.repository.JobNotificationRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

public class AdminServiceImpl{
	/*@Autowired
	private EmployerRepository employerRepository;
	
	@Autowired
	private JobNotificationRepository jobNotificationRepository;
	
	@Autowired
	private StudentRepository  studentRepository;
	*/
	
	/*@Override
	public void saveAdmin(Admin admin) {
		AdminRepository.save(admin);
	}

	@Override
	public Admin authenticateAdmin(String username, String password) {
		 admin = employerRepository.findByUsername(username)
                .orElseThrow(() -> new IllegalArgumentException("Invalid username or password."));

        // Check if password matches
        if (!admin.getPassword().equals(password)) {
            throw new IllegalArgumentException("Invalid username or password.");
        }

        return admin;
	}

	@Override
	public Employer updateAdmin(Admin admin) {
		return adminRepository.save(admin);
	}

	public List<JobNotification> getJobsByEmployer(Employer employer) {
        return jobNotificationRepository.findByEmployerId(employer.getId());
    }

	@Override
	public String saveJobNotification(JobNotification jobNotification) {
		jobNotificationRepository.save(jobNotification);
		return "Job notification saved";
	}
	@Override
    public JobNotification getApplicationsByJobId(Long jobId) {
        return jobNotificationRepository.findById(jobId).get();
    }

	public boolean updateJobStatus(long jobId, String newStatus) {
        JobNotification job = jobNotificationRepository.findById(jobId).orElse(null);
        if (job != null) {
            job.setStatus(newStatus);
            jobNotificationRepository.save(job);
            return true;
        }
        return false;
    }	
	public void updateJob(JobNotification updatedJob) {
		jobNotificationRepository.save(updatedJob);
	}

	@Override
	public Student getStudentById(Long id) {
		return studentRepository.findById(id).get();
	}
	
	public void shortlistApplicant(Long applicantId, Long jobId) {
	    JobNotification jobNotification=jobNotificationRepository.findById(jobId).get();
	    Student student=studentRepository.findById(applicantId).get();
	    if(student==null)
	    	System.out.println("student null");
	    System.out.println(student.getDepartment());
	    List<String> selectedCompanies=student.getSelected_companies();
	    selectedCompanies.add( Long.toString(jobId));
	    student.setSelected_companies(selectedCompanies);
	    studentRepository.save(student);
	    
	}

	@Override
	public List<JobNotification> viewAllJobNotifications() {
		return jobNotificationRepository.findAll();
	}
	*/
}
