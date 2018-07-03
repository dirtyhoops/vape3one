package com.codingdojo.vape3one.models;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.PrePersist;
import javax.persistence.PreUpdate;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.Email;
import javax.validation.constraints.Size;

//imports removed for brevity
@Entity
@Table(name="users")
public class User {
    @Id
    @GeneratedValue()
    private Long id;
    @Size(min=1, message="First name can't be empty")
    private String firstname;
    @Size(min=1, message="Last name can't be empty")
    private String lastname;
    // NEW
    @Email(message="Email must be valid")
    private String email;
    // NEW
    @Size(min=5, message="Password must be greater than 5 characters")
    private String password;
    @Transient
    private String passwordConfirmation;
    private String adminCode;
    private String isAdmin;
    @Column(updatable=false)
    private Date createdAt;
    private Date updatedAt;
 
 public User() {
 }
 



public User(Long id, @Size(min = 1, message = "First name can't be empty") String firstname,
		@Size(min = 1, message = "Last name can't be empty") String lastname,
		@Email(message = "Email must be valid") String email,
		@Size(min = 5, message = "Password must be greater than 5 characters") String password,
		String passwordConfirmation, String adminCode, String isAdmin, Date createdAt, Date updatedAt) {
	super();
	this.id = id;
	this.firstname = firstname;
	this.lastname = lastname;
	this.email = email;
	this.password = password;
	this.passwordConfirmation = passwordConfirmation;
	this.adminCode = adminCode;
	this.isAdmin = isAdmin;
	this.createdAt = createdAt;
	this.updatedAt = updatedAt;
}




public Long getId() {
	return id;
}


public String getFirstname() {
	return firstname;
}

public void setFirstname(String firstname) {
	this.firstname = firstname;
}

public String getLastname() {
	return lastname;
}

public void setLastname(String lastname) {
	this.lastname = lastname;
}

public void setId(Long id) {
	this.id = id;
}


public String getEmail() {
	return email;
}


public void setEmail(String email) {
	this.email = email;
}


public String getPassword() {
	return password;
}


public void setPassword(String password) {
	this.password = password;
}


public String getPasswordConfirmation() {
	return passwordConfirmation;
}


public void setPasswordConfirmation(String passwordConfirmation) {
	this.passwordConfirmation = passwordConfirmation;
}


public Date getCreatedAt() {
	return createdAt;
}


public void setCreatedAt(Date createdAt) {
	this.createdAt = createdAt;
}


public Date getUpdatedAt() {
	return updatedAt;
}


public void setUpdatedAt(Date updatedAt) {
	this.updatedAt = updatedAt;
}


public String getAdminCode() {
	return adminCode;
}




public void setAdminCode(String adminCode) {
	this.adminCode = adminCode;
}




public String getIsAdmin() {
	return isAdmin;
}




public void setIsAdmin(String isAdmin) {
	this.isAdmin = isAdmin;
}




// other getters and setters removed for brevity
 @PrePersist
 protected void onCreate(){
     this.createdAt = new Date();
 }
 @PreUpdate
 protected void onUpdate(){
     this.updatedAt = new Date();
 }
}

