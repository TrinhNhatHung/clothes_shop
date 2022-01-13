package com.shop.entity;

import java.time.LocalDate;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.hibernate.annotations.CreationTimestamp;

import com.shop.validation.ConfirmMessage;
import com.shop.validation.ValidPhone;

@Entity
@Table(name = "user")
@ConfirmMessage(first = "password", second = "passwordConfirmation", message = "Không giống với mật khẩu đã nhập")
public class User {

	@Id
	@Column(name = "username")
	@NotNull(message = "Bắt buộc")
	@Size(min = 6, message = "Ít nhất 6 kí tự")
	private String username;

	@Column(name = "fullname")
	@NotNull(message = "Bắt buộc")
	private String fullname;

	@Column(name = "phone")
	@NotNull(message = "Bắt buộc")
	@ValidPhone
	private String phone;

	@Column(name = "address")
	@NotNull(message = "Bắt buộc")
	private String address;

	@Column(name = "password")
	@NotNull(message = "Bắt buộc")
	private String password;

	@NotNull(message = "Bắt buộc")
	@Transient
	private String passwordConfirmation;

	@Column(name = "gender")
	@NotNull(message = "Bắt buộc")
	private String gender;
	
	@Column(name = "createAt")
	@CreationTimestamp
	private LocalDate createAt;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "role_id", referencedColumnName = "role_id")
	private Role role;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "user")
	private List<Cart> carts;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "customer")
	private List<Order> customerOrders;

	public User() {

	}

	public User(String username, String fullname, String phone, String address, String password, String gender) {
		super();
		this.username = username;
		this.fullname = fullname;
		this.phone = phone;
		this.address = address;
		this.password = password;
		this.gender = gender;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getFullname() {
		return fullname;
	}

	public void setFullname(String fullname) {
		this.fullname = fullname;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public Role getRole() {
		return role;
	}

	public void setRole(Role role) {
		this.role = role;
	}

	public List<Cart> getCarts() {
		return carts;
	}

	public void setCarts(List<Cart> carts) {
		this.carts = carts;
	}

	public List<Order> getCustomerOrders() {
		return customerOrders;
	}

	public void setCustomerOrders(List<Order> customerOrders) {
		this.customerOrders = customerOrders;
	}

}
