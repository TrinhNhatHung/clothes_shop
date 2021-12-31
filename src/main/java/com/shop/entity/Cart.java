package com.shop.entity;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.Embeddable;
import javax.persistence.EmbeddedId;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.MapsId;
import javax.persistence.Table;

@Table(name = "giohang")
@Entity
public class Cart {

	@EmbeddedId
	private Id id;

	@Column(name = "soluong")
	private Integer quantity;

	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("itemId")
	@JoinColumn(name = "ma_mh", referencedColumnName = "ma_mh")
	private Item item;

	@ManyToOne(fetch = FetchType.LAZY)
	@MapsId("username")
	@JoinColumn(name = "username", referencedColumnName = "username")
	private User user;

	public Cart() {
	}

	public Cart(Id id, Integer quantity, Item item, User user) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.item = item;
		this.user = user;
	}

	public Id getId() {
		return id;
	}

	public void setId(Id id) {
		this.id = id;
	}

	public Integer getQuantity() {
		return quantity;
	}

	public void setQuantity(Integer quantity) {
		this.quantity = quantity;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	@Embeddable
	public static class Id implements Serializable {

		private static final long serialVersionUID = -1515304920607127242L;

		@Column(name = "username")
		private String username;

		@Column(name = "ma_mh")
		private Integer itemId;

		public Id() {
		}

		public Id(String username, Integer itemId) {
			this.username = username;
			this.itemId = itemId;
		}

		public String getUsername() {
			return username;
		}

		public void setUsername(String username) {
			this.username = username;
		}

		public Integer getItemId() {
			return itemId;
		}

		public void setItemId(Integer itemId) {
			this.itemId = itemId;
		}

		public static long getSerialversionuid() {
			return serialVersionUID;
		}

	}
}
