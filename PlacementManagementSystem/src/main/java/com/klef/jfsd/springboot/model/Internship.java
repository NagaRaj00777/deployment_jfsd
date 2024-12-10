package com.klef.jfsd.springboot.model;

import jakarta.persistence.*;

@Entity
public class Internship {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "student_id", nullable = false)
    private Student student;

    @Column(name="title")
    private String title;
    
    public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	@Column(name = "company_name", nullable = false)
    private String companyName;

    @Column(name = "role", nullable = false)
    private String role;

    @Column(name = "duration", nullable = false)
    private String duration;

    @Column(name = "skills_learned", nullable = false)
    private String skillsLearned;

    @Column(name = "internship_description")
    private String internshipDescription;
    
    @Column(name="location")
    private String location;

    public String getLocation() {
		return location;
	}

	public void setLocation(String location) {
		this.location = location;
	}

	public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Student getStudent() {
        return student;
    }

    public void setStudent(Student student) {
        this.student = student;
    }

    public String getCompanyName() {
        return companyName;
    }

    public void setCompanyName(String companyName) {
        this.companyName = companyName;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getSkillsLearned() {
        return skillsLearned;
    }

    public void setSkillsLearned(String skillsLearned) {
        this.skillsLearned = skillsLearned;
    }

    public String getInternshipDescription() {
        return internshipDescription;
    }

    public void setInternshipDescription(String internshipDescription) {
        this.internshipDescription = internshipDescription;
    }
}
