package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Employer;
import com.klef.jfsd.springboot.model.JobNotification;
import com.klef.jfsd.springboot.model.Student;

public interface EmployerService {
	public void saveEmployer(Employer employer);
	public Employer authenticateEmployer(String username, String password);
	public Employer updateEmployer(Employer employer);
	
	public List<JobNotification> getJobsByEmployer(Employer employer) ;
	public String saveJobNotification(JobNotification jobNotification);
    public JobNotification getApplicationsByJobId(Long jobId) ;
    public boolean updateJobStatus(long jobId, String newStatus);
    public void updateJob(JobNotification updatedJob);
    public List<JobNotification> viewAllJobNotifications();
    
    public Student getStudentById(Long id);
    public void shortlistApplicant(Long applicantId, Long jobId);
    
}
