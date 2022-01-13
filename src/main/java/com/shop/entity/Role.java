package com.shop.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "role")
public class Role {
	
	public static final String ROLE_CUSTOMER = "ROLE_CUSTOMER";
	public static final String ROLE_STAFF = "ROLE_STAFF";
	public static final String ROLE_ADMIN = "ROLE_ADMIN";

	@Id
	@Column(name = "role_id")
	private Integer roleId;

	@Column(name = "name")
	private String name;
	
	public Role() {

	}

	public Role(Integer id, String name) {
		super();
		this.roleId = id;
		this.name = name;
	}

	public Integer getId() {
		return roleId;
	}

	public void setId(Integer id) {
		this.roleId = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

}
