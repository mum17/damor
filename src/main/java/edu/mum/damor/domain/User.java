package edu.mum.damor.domain;

import java.time.LocalDate;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.persistence.UniqueConstraint;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.multipart.MultipartFile;

import edu.mum.damor.util.Authority;
import edu.mum.damor.util.Gender;

@Entity
@Table(name = "users", uniqueConstraints = @UniqueConstraint(name = "user_email_uk", columnNames = { "email" }))
public class User {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	@Column(name = "user_id")
	private long id;

	@Column(name = "first_name", length = 50, nullable = false)
	@NotEmpty
	private String firstName;

	@Column(name = "last_name", length = 50, nullable = false)
	@NotEmpty
	private String lastName;

	@Column(nullable = false)
	@NotEmpty
	@Email
	private String email;

	@Column(length = 64, nullable = false)
	private String password;

	@Column(length = 5, nullable = false)
	private Authority authority;

	@DateTimeFormat(pattern = "M/d/yyyy")
	private LocalDate birthdate;

	@Column(length = 1, nullable = false)
	private Gender gender;

	@Transient
	private MultipartFile photo;

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
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

	public Authority getAuthority() {
		return authority;
	}

	public void setAuthority(Authority authority) {
		this.authority = authority;
	}

	public LocalDate getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(LocalDate birthdate) {
		this.birthdate = birthdate;
	}

	public Gender getGender() {
		return gender;
	}

	public void setGender(Gender gender) {
		this.gender = gender;
	}

	public String getName() {
		return this.firstName + "  " + this.lastName;
	}

	public MultipartFile getPhoto() {
		return photo;
	}

	public void setPhoto(MultipartFile photo) {
		this.photo = photo;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", firstName=" + firstName + ", email=" + email + "]";
	}

}
