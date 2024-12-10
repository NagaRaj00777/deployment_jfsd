package com.klef.jfsd.springboot.repository;

import com.klef.jfsd.springboot.model.Internship;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface InternshipRepository extends JpaRepository<Internship, Long> {
}
