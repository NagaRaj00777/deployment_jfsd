package com.klef.jfsd.springboot.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.klef.jfsd.springboot.model.Application;
import com.klef.jfsd.springboot.model.Internship;
import com.klef.jfsd.springboot.model.JobNotification;
import com.klef.jfsd.springboot.model.Student;
import com.klef.jfsd.springboot.repository.ApplicationRepository;
import com.klef.jfsd.springboot.repository.InternshipRepository;
import com.klef.jfsd.springboot.repository.JobNotificationRepository;
import com.klef.jfsd.springboot.repository.StudentRepository;

import jakarta.transaction.Transactional;

@Service
public class StudentServiceImpl implements StudentService{
	
	@Autowired
	private StudentRepository studentRepository;
	
	@Autowired
	private JobNotificationRepository jobNotificationRepository;
	
	@Autowired
    private ApplicationRepository applicationRepository;
	
	@Autowired
	private InternshipRepository internshipRepository;
	

	@Override
	public void saveStudent(Student student) {
		studentRepository.save(student);
	}


	@Override
	public Student checkLogin(String email, String password) {
	    if (studentRepository.findByEmailAndPassword(email, password)!=null) {
	        return studentRepository.findByEmailAndPassword(email, password); 
	    }
	    return null;
	}


	@Override
	@Transactional
	public void updateStudentProfile(Student updatedStudent) {
	    studentRepository.save(updatedStudent);
	}
	
	public List<JobNotification> getAllJobNotifications() {
        return jobNotificationRepository.findAll();
    }


	@Override
	public JobNotification getJobById(long jobid) {
		return jobNotificationRepository.findById(jobid).get();
		
	}
	
	public String applyForJob(Application application, Student currentStudent, JobNotification jobNotification) {
		applicationRepository.save(application);
		studentRepository.save(currentStudent);
		jobNotificationRepository.save(jobNotification);
        return "Job added successfully";
    }
	
	
	public List<JobNotification> getJobsByCompanies(List<String> appliedCompanies) {
		List<JobNotification> jobNotifications=new ArrayList<JobNotification>();
		for(String id:appliedCompanies) {
			long jobid=Long.parseLong(id);
			jobNotifications.add(jobNotificationRepository.findById(jobid).get());
		}
		
		return jobNotifications;
	}


	@Override
	public List<Internship> getAllInternships() {
		return internshipRepository.findAll();
	}


	@Override
	public String saveInternship(Internship internship) {
		 internshipRepository.save(internship);
		 return "";
	}


	@Override
	public String deleteInternship(long id) {
		 internshipRepository.deleteById(id);
		 return "";
	}

	
}
