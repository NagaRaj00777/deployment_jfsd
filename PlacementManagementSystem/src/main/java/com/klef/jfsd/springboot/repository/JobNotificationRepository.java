package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.JobNotification;
import java.util.List;


@Repository
public interface JobNotificationRepository extends JpaRepository<JobNotification, Long> {
	List<JobNotification> findByEmployerId(Long employerId);
	
	
}
