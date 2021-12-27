package com.shop.entity;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.persistence.Transient;

@Entity
@Table(name = "mathang")
public class Item {

	@Id
	@Column(name = "ma_mh")
	private Integer id;

	@Column(name = "tenmathang")
	private String name;

	@Column(name = "giaban")
	private Integer outPrice;

	@Column(name = "giamua")
	private Integer inPrice;

	@Column(name = "mota")
	private String description;

	@Column(name = "giamgia")
	private Integer discount;

	@Column(name = "hinhanh")
	private String image;

	@Transient
	private String linkImage;

	@ManyToOne(cascade = CascadeType.ALL, fetch = FetchType.LAZY)
	@JoinColumn(name = "ma_loai", referencedColumnName = "ma_loai")
	private ItemGroup itemGroup;

	public Item() {

	}

	public Item(Integer id, String name, Integer outPrice, Integer inPrice, String description, Integer discount,
			String image, ItemGroup itemGroup) {
		super();
		this.id = id;
		this.name = name;
		this.outPrice = outPrice;
		this.inPrice = inPrice;
		this.description = description;
		this.discount = discount;
		this.image = image;
		this.itemGroup = itemGroup;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getOutPrice() {
		return outPrice;
	}

	public void setOutPrice(Integer outPrice) {
		this.outPrice = outPrice;
	}

	public Integer getInPrice() {
		return inPrice;
	}

	public void setInPrice(Integer inPrice) {
		this.inPrice = inPrice;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public Integer getDiscount() {
		return discount;
	}

	public void setDiscount(Integer discount) {
		this.discount = discount;
	}

	public String getImage() {
		return image;
	}

	public void setImage(String image) {
		this.image = image;
	}

	public ItemGroup getItemGroup() {
		return itemGroup;
	}

	public void setItemGroup(ItemGroup itemGroup) {
		this.itemGroup = itemGroup;
	}

	public String getLinkImage() {
		return linkImage;
	}

	public void setLinkImage(String linkImage) {
		this.linkImage = linkImage;
	}

	@Override
	public String toString() {
		return "Item [id=" + id + ", name=" + name + ", outPrice=" + outPrice + ", inPrice=" + inPrice
				+ ", description=" + description + ", discount=" + discount + ", image=" + image + ", itemGroup="
				+ itemGroup + "]";
	}

}
