package com.klef.jfsd.springboot.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import com.klef.jfsd.springboot.model.Student;


@Repository
public interface StudentRepository extends JpaRepository<Student, Long>{

	@Query("SELECT s FROM Student s WHERE s.email = :email AND s.password = :password")
    Student findByEmailAndPassword(@Param("email") String email, @Param("password") String password);
}
