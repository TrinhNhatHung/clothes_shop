package com.shop.dto;

public class UserDto {

	private String username;
	private String fullname;
	private String gender;
	private String phone;
	private Integer orderQuantityByTime;
	private Integer totalMoneyByTime;

	public UserDto(String username, String fullname, String gender, String phone, Integer orderQuantityByTime,
			Integer totalMoneyByTime) {
		super();
		this.username = username;
		this.fullname = fullname;
		this.gender = gender;
		this.phone = phone;
		this.orderQuantityByTime = orderQuantityByTime;
		this.totalMoneyByTime = totalMoneyByTime;
	}

	public UserDto() {
		super();
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

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public Integer getOrderQuantityByTime() {
		return orderQuantityByTime;
	}

	public void setOrderQuantityByTime(Integer orderQuantityByTime) {
		this.orderQuantityByTime = orderQuantityByTime;
	}

	public Integer getTotalMoneyByTime() {
		return totalMoneyByTime;
	}

	public void setTotalMoneyByTime(Integer totalMoneyByTime) {
		this.totalMoneyByTime = totalMoneyByTime;
	}

}
