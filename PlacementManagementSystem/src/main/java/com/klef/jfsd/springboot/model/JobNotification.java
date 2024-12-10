package com.klef.jfsd.springboot.model;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class JobNotification {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    public Long getEmployerId() {
		return employerId;
	}

	public void setEmployerId(Long employerId) {
		this.employerId = employerId;
	}

	private Long employerId;
    private String jobTitle;
    private String jobDescription;
    private String jobType; 
    private String location;
    private String company;
    private String contactEmail;
    private String qualifications;
    private String skillsRequired;
    private String deadline;
    private String status;
    private String postedDate;

    @ElementCollection
    private List<Long> applicants;
    
    private Boolean deadlinePassed;

    // Getters and Setters

    public Boolean getDeadlinePassed() {
        return deadlinePassed;
    }

    public void setDeadlinePassed(Boolean deadlinePassed) {
        this.deadlinePassed = deadlinePassed;
    }

    public List<Long> getApplicants() {
        return applicants;
    }

    public void setApplicants(List<Long> applicants) {
        this.applicants = applicants;
    }

    public String getPostedDate() {
        return postedDate;
    }

    public void setPostedDate(String postedDate) {
        this.postedDate = postedDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getJobTitle() {
        return jobTitle;
    }

    public void setJobTitle(String jobTitle) {
        this.jobTitle = jobTitle;
    }

    public String getJobDescription() {
        return jobDescription;
    }

    public void setJobDescription(String jobDescription) {
        this.jobDescription = jobDescription;
    }

    public String getJobType() {
        return jobType;
    }

    public void setJobType(String jobType) {
        this.jobType = jobType;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public String getContactEmail() {
        return contactEmail;
    }

    public void setContactEmail(String contactEmail) {
        this.contactEmail = contactEmail;
    }

    public String getQualifications() {
        return qualifications;
    }

    public void setQualifications(String qualifications) {
        this.qualifications = qualifications;
    }

    public String getSkillsRequired() {
        return skillsRequired;
    }

    public void setSkillsRequired(String skillsRequired) {
        this.skillsRequired = skillsRequired;
    }

    public String getDeadline() {
        return deadline;
    }

    public void setDeadline(String deadline) {
        this.deadline = deadline;
    }

    // Override equals and hashCode to eliminate duplicates based on job id

    @Override
    public boolean equals(Object obj) {
        if (this == obj) return true;
        if (obj == null || getClass() != obj.getClass()) return false;
        JobNotification that = (JobNotification) obj;
        return Objects.equals(id, that.id); // Compare by job ID to ensure uniqueness
    }

    @Override
    public int hashCode() {
        return Objects.hash(id); // Use job ID for hash code calculation
    }
}
