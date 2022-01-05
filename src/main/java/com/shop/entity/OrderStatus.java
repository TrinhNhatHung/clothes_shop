package com.shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity(name = "tinhtrangdonhang")
@Table(name = "tinhtrangdonhang")
public class OrderStatus {

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
