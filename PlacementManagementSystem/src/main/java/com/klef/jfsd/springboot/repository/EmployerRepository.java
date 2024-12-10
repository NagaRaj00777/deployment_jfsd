package com.klef.jfsd.springboot.repository;

import java.util.Optional;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Employer;

@Repository
public interface EmployerRepository extends JpaRepository<Employer, Long>{
    Optional<Employer> findByUsername(String username);
}

