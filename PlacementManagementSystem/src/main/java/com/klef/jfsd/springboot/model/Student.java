package com.klef.jfsd.springboot.model;

import java.sql.Blob;
import java.util.List;

import jakarta.persistence.CollectionTable;
import jakarta.persistence.Column;
import jakarta.persistence.ElementCollection;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;

@Entity
public class Student {

    @Override
	public String toString() {
		return "Student [id=" + id + ", name=" + name + ", email=" + email + ", phoneNumber=" + phoneNumber
				+ ", address=" + address + ", dateOfBirth=" + dateOfBirth + ", gender=" + gender
				+ ", registrationNumber=" + registrationNumber + ", department=" + department + ", yearOfStudy="
				+ yearOfStudy + ", cgpa=" + cgpa + ", skills=" + skills + ", resumeUrl=" + resumeUrl
				+ ", placementStatus=" + placementStatus + ", appliedCompanies=" + appliedCompanies
				+ ", selectedCompany=" + selectedCompany + ", backlogs=" + backlogs + ", certifications="
				+ certifications + ", projects=" + projects + ", internshipExperience=" + internshipExperience
				+ ", achievements=" + achievements + ", password=" + password + "]";
	}

	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "full_name", nullable = false, length = 100)
    private String name;

    @Column(name = "email", nullable = false, unique = true)
    private String email;

    @Column(name = "phone_number", length = 15)
    private String phoneNumber;

    @Column(name = "address", length = 255)
    private String address;

    @Column(name = "date_of_birth")
    private String dateOfBirth;

    @Column(name = "gender", length = 10)
    private String gender;

    @Column(name = "registration_number", unique = true)
    private String registrationNumber;

    @Column(name = "department", length = 50)
    private String department;

    @Column(name = "year_of_study")
    private int yearOfStudy;

    @Column(name = "cgpa")
    private double cgpa;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "student_skills", joinColumns = @JoinColumn(name = "student_id"))
    @Column(name = "skill")
    private List<String> skills;

    @Column(name = "resume_url", length = 255)
    private String resumeUrl;

    @Column(name = "placement_status", length = 20)
    private String placementStatus;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "applied_companies", joinColumns = @JoinColumn(name = "student_id"))
    @Column(name = "company_name")
    private List<String> appliedCompanies;
    
    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "selected_companies", joinColumns = @JoinColumn(name = "student_id"))
    @Column(name = "selected_companies")
    private List<String> selected_companies;

    public List<String> getSelected_companies() {
		return selected_companies;
	}

	public void setSelected_companies(List<String> selected_companies) {
		this.selected_companies = selected_companies;
	}

	@Column(name = "selected_company", length = 100)
    private String selectedCompany;

    @Column(name = "backlogs")
    private int backlogs;

    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "student_certifications", joinColumns = @JoinColumn(name = "student_id"))
    @Column(name = "certification")
    private List<String> certifications;

    
    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "student_projects", joinColumns = @JoinColumn(name = "student_id"))
    @Column(name = "project_name")
    private List<String> projects;

    @Column(name = "internship_experience", length = 255)
    private String internshipExperience;
    
    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "student_internships", joinColumns = @JoinColumn(name = "student_id"))
    @Column(name = "internship_id")
    private List<Internship> internships;

    public List<Internship> getInternships() {
        return internships;
    }

    public void setInternships(List<Internship> internships) {
        this.internships = internships;
    }


    @ElementCollection(fetch = FetchType.EAGER)
    @CollectionTable(name = "student_achievements", joinColumns = @JoinColumn(name = "student_id"))
    @Column(name = "achievement")
    private List<String> achievements;
    
    @Column(name = "password", nullable = false, length = 255)
    private String password;


    // Getters and Setters

    public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(String dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getRegistrationNumber() {
        return registrationNumber;
    }

    public void setRegistrationNumber(String registrationNumber) {
        this.registrationNumber = registrationNumber;
    }

    public String getDepartment() {
        return department;
    }

    public void setDepartment(String department) {
        this.department = department;
    }

    public int getYearOfStudy() {
        return yearOfStudy;
    }

    public void setYearOfStudy(int yearOfStudy) {
        this.yearOfStudy = yearOfStudy;
    }

    public double getCgpa() {
        return cgpa;
    }

    public void setCgpa(double cgpa) {
        this.cgpa = cgpa;
    }

    public List<String> getSkills() {
        return skills;
    }

    public void setSkills(List<String> skills) {
        this.skills = skills;
    }

    public String getResumeUrl() {
        return resumeUrl;
    }

    public void setResumeUrl(String resumeUrl) {
        this.resumeUrl = resumeUrl;
    }

    public String getPlacementStatus() {
        return placementStatus;
    }

    public void setPlacementStatus(String placementStatus) {
        this.placementStatus = placementStatus;
    }

    public List<String> getAppliedCompanies() {
        return appliedCompanies;
    }

    public void setAppliedCompanies(List<String> appliedCompanies) {
        this.appliedCompanies = appliedCompanies;
    }

    public String getSelectedCompany() {
        return selectedCompany;
    }

    public void setSelectedCompany(String selectedCompany) {
        this.selectedCompany = selectedCompany;
    }

    public int getBacklogs() {
        return backlogs;
    }

    public void setBacklogs(int backlogs) {
        this.backlogs = backlogs;
    }

    public List<String> getCertifications() {
        return certifications;
    }

    public void setCertifications(List<String> certifications) {
        this.certifications = certifications;
    }

    public List<String> getProjects() {
        return projects;
    }

    public void setProjects(List<String> projects) {
        this.projects = projects;
    }

    public String getInternshipExperience() {
        return internshipExperience;
    }

    public void setInternshipExperience(String internshipExperience) {
        this.internshipExperience = internshipExperience;
    }

    public List<String> getAchievements() {
        return achievements;
    }

    public void setAchievements(List<String> achievements) {
        this.achievements = achievements;
    }
}
