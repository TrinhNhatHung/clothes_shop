package com.shop.entity;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.persistence.Transient;
import javax.validation.constraints.NotNull;

@Entity
@Table(name = "mathang")
public class Item {

	@Id
	@Column(name = "ma_mh")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "tenmathang")
	@NotNull(message = "Bắt buộc")
	private String name;

	@Column(name = "giaban")
	@NotNull(message = "Bắt buộc")
	private Integer outPrice;

	@Column(name = "giamua")
	@NotNull(message = "Bắt buộc")
	private Integer inPrice;

	@Column(name = "mota")
	private String description;

	@Column(name = "giamgia")
	@NotNull(message = "Bắt buộc")
	private Integer discount;

	@Column(name = "hinhanh")
	private String image;
	
	@Column(name = "trangthai")
	private Boolean status;

	@Transient
	private String linkImage;

	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "ma_loai", referencedColumnName = "ma_loai")
	private ItemGroup itemGroup;
	

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "item", cascade = CascadeType.ALL)
	private List<ItemSize> itemSizes;
	
	public Item() {

	}

	public Item(Integer id, String name, Integer outPrice, Integer inPrice, String description, Integer discount,
			String image, Boolean status, ItemGroup itemGroup) {
		super();
		this.id = id;
		this.name = name;
		this.outPrice = outPrice;
		this.inPrice = inPrice;
		this.description = description;
		this.discount = discount;
		this.image = image;
		this.status = status;
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

	public Boolean getStatus() {
		return status;
	}
	
	public void setStatus(Boolean status) {
		this.status = status;
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

	public List<ItemSize> getItemSizes() {
		return itemSizes;
	}

	public void setItemSizes(List<ItemSize> itemSizes) {
		this.itemSizes = itemSizes;
	}
	
	@Override
	public Item clone() throws CloneNotSupportedException {
		Item item = new Item();
		item.id = this.id;
		item.name = this.name;
		item.outPrice = this.outPrice;
		item.inPrice = this.inPrice;
		item.description = this.description;
		item.discount = this.discount;
		item.image = this.image;
		item.itemGroup = this.itemGroup.clone();
		return item;
	}

	@Override
	public String toString() {
		return "Item [id=" + id + ", name=" + name + ", outPrice=" + outPrice + ", inPrice=" + inPrice
				+ ", description=" + description + ", discount=" + discount + ", image=" + image + ", itemGroup="
				+ itemGroup + "]";
	}

}
