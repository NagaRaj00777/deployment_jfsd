package com.klef.jfsd.springboot.service;

import java.util.List;

import com.klef.jfsd.springboot.model.Application;
import com.klef.jfsd.springboot.model.Internship;
import com.klef.jfsd.springboot.model.JobNotification;
import com.klef.jfsd.springboot.model.Student;

public interface StudentService {
	public void saveStudent(Student student);
	public Student checkLogin(String email, String password);
	public void updateStudentProfile(Student updatedStudent);
	
	public List<JobNotification> getAllJobNotifications();
	public JobNotification getJobById(long jobid);
	public String applyForJob(Application application, Student currentStudent, JobNotification jobNotification) ;
	public List<JobNotification> getJobsByCompanies(List<String> appliedCompanies) ;
	
	
	public List<Internship> getAllInternships();
	public String saveInternship(Internship internship); 
	public String deleteInternship(long id);
}
