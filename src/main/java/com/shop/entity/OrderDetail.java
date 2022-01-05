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

@Table(name = "chitietdonhang")
@Entity
public class OrderDetail {

	@EmbeddedId
	private Id id;

	@Column(name = "soluong")
	private Integer quantity;

	@Column(name = "dongia")
	private Integer price;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ma_dh", referencedColumnName = "ma_dh")
	@MapsId("orderId")
	private Order order;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ma_mh", referencedColumnName = "ma_mh")
	@MapsId("itemId")
	private Item item;
	
	public OrderDetail() {
		super();
	}

	public OrderDetail(Id id, Integer quantity, Integer price) {
		super();
		this.id = id;
		this.quantity = quantity;
		this.price = price;
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

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}
	
	public Order getOrder() {
		return order;
	}

	public void setOrder(Order order) {
		this.order = order;
	}

	public Item getItem() {
		return item;
	}

	public void setItem(Item item) {
		this.item = item;
	}

	@Embeddable
	public static class Id implements Serializable {

		private static final long serialVersionUID = -993176722749445296L;

		@Column(name = "ma_mh")
		private Integer itemId;

		@Column(name = "ma_dh")
		private Integer orderId;

		public Id() {
			super();
		}

		public Id(Integer itemId, Integer orderId) {
			super();
			this.itemId = itemId;
			this.orderId = orderId;
		}

		public Integer getItemId() {
			return itemId;
		}

		public void setItemId(Integer itemId) {
			this.itemId = itemId;
		}

		public Integer getOrderId() {
			return orderId;
		}

		public void setOrderId(Integer orderId) {
			this.orderId = orderId;
		}

	}
}
