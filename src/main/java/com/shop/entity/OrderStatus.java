package com.shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Table(name = "tinhtrangdonhang")
@Entity(name = "tinhtrangdonhang")
public class OrderStatus {
	public static final String WAITING = "Chờ xác nhận";
	public static final String DELIVERING = "Đang giao";
	public static final String DELIVERED = "Đã giao";
	public static final String CANCLED = "Đã hủy";

	@Id
	@Column(name = "ma_ttdh")
	private Integer id;

	@Column(name = "tinhtrang")
	private String status;

	public OrderStatus() {
		super();
	}

	public OrderStatus(Integer id, String status) {
		super();
		this.id = id;
		this.status = status;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

}
