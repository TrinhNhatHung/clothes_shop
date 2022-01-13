package com.shop.dto;

public class ItemDto {

	private Integer itemId;
	private String name;
	private Integer price;
	private String itemGroup;
	private Integer soldQuantityByTime;

	public ItemDto() {
		super();
	}

	public ItemDto(Integer itemId, String name, Integer price, String itemGroup, Integer soldQuantityByTime) {
		super();
		this.itemId = itemId;
		this.name = name;
		this.price = price;
		this.itemGroup = itemGroup;
		this.soldQuantityByTime = soldQuantityByTime;
	}

	public Integer getItemId() {
		return itemId;
	}

	public void setItemId(Integer itemId) {
		this.itemId = itemId;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPrice() {
		return price;
	}

	public void setPrice(Integer price) {
		this.price = price;
	}

	public String getItemGroup() {
		return itemGroup;
	}

	public void setItemGroup(String itemGroup) {
		this.itemGroup = itemGroup;
	}

	public Integer getSoldQuantityByTime() {
		return soldQuantityByTime;
	}

	public void setSoldQuantityByTime(Integer soldQuantityByTime) {
		this.soldQuantityByTime = soldQuantityByTime;
	}

}
