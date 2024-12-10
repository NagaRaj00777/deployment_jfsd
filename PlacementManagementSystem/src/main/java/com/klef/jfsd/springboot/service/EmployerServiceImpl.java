package com.klef.jfsd.springboot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Employer;
import com.klef.jfsd.springboot.model.JobNotification;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.EmployerRepository;
import com.klef.jfsd.springboot.repository.JobNotificationRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

@Service
public class EmployerServiceImpl implements EmployerService{
	@Autowired
	private EmployerRepository employerRepository;
	
	@Autowired
	private JobNotificationRepository jobNotificationRepository;
	
	@Autowired
	private StudentRepository  studentRepository;
	
	@Override
	public void saveEmployer(Employer employer) {
		employerRepository.save(employer);
	}

	@Override
	public Employer authenticateEmployer(String username, String password) {
		Employer employer = employerRepository.findByUsername(username)
                .orElseThrow(() -> new IllegalArgumentException("Invalid username or password."));

        // Check if password matches
        if (!employer.getPassword().equals(password)) {
            throw new IllegalArgumentException("Invalid username or password.");
        }

        return employer;
	}

	@Override
	public Employer updateEmployer(Employer employer) {
		return employerRepository.save(employer);
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

}
