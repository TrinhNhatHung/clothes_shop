package com.shop.entity;

import java.time.LocalDateTime;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity(name = "donhang")
@Table(name = "donhang")
public class Order {

	@Id
	@Column(name = "ma_dh")
	private Integer id;

	@Column(name = "ngay_tao")
	@CreationTimestamp
	private LocalDateTime createAt;

	@Column(name = "dia_chi_giao_hang")
	private String address;

	@Column(name = "ten_nguoi_nhan")
	private String receiverName;

	@Column(name = "sdt_nguoi_nhan")
	private String receiverPhone;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ma_ttdh", referencedColumnName = "ma_ttdh")
	private OrderStatus status;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "khach_hang", referencedColumnName = "username")
	private User customer;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "nhan_vien", referencedColumnName = "username")
	private User acceptEmployee;
	
	@OneToMany(fetch = FetchType.LAZY, mappedBy = "order")
	private List<OrderDetail> orderDetail;

	

	public Order() {
		super();
	}

	public Order(Integer id, LocalDateTime createAt, String address, String receiverName, String receiverPhone,
			OrderStatus status, User customer, User acceptEmployee) {
		super();
		this.id = id;
		this.createAt = createAt;
		this.address = address;
		this.receiverName = receiverName;
		this.receiverPhone = receiverPhone;
		this.status = status;
		this.customer = customer;
		this.acceptEmployee = acceptEmployee;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public LocalDateTime getCreateAt() {
		return createAt;
	}

	public void setCreateAt(LocalDateTime createAt) {
		this.createAt = createAt;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getReceiverName() {
		return receiverName;
	}

	public void setReceiverName(String receiverName) {
		this.receiverName = receiverName;
	}

	public String getReceiverPhone() {
		return receiverPhone;
	}

	public void setReceiverPhone(String receiverPhone) {
		this.receiverPhone = receiverPhone;
	}

	public OrderStatus getStatus() {
		return status;
	}

	public void setStatus(OrderStatus status) {
		this.status = status;
	}

	public User getCustomer() {
		return customer;
	}

	public void setCustomer(User customer) {
		this.customer = customer;
	}

	public User getAcceptEmployee() {
		return acceptEmployee;
	}

	public void setAcceptEmployee(User acceptEmployee) {
		this.acceptEmployee = acceptEmployee;
	}
	
	public List<OrderDetail> getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(List<OrderDetail> orderDetail) {
		this.orderDetail = orderDetail;
	}

}
