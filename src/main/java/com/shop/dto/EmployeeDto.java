package com.shop.dto;

public class EmployeeDto {

	private String username;
	private String fullname;
	private Integer orderQuantity;
	private Integer revenue;

	public EmployeeDto() {
	}

	public EmployeeDto(String username, String fullname, Integer orderQuantity, Integer revenue) {
		super();
		this.username = username;
		this.fullname = fullname;
		this.orderQuantity = orderQuantity;
		this.revenue = revenue;
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

	public Integer getOrderQuantity() {
		return orderQuantity;
	}

	public void setOrderQuantity(Integer orderQuantity) {
		this.orderQuantity = orderQuantity;
	}

	public Integer getRevenue() {
		return revenue;
	}

	public void setRevenue(Integer revenue) {
		this.revenue = revenue;
	}

}
