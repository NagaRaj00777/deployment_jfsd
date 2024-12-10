package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.Application;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ApplicationRepository extends JpaRepository<Application, Long> {

}
