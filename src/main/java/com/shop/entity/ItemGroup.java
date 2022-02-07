package com.shop.entity;

import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

@Entity
@Table(name = "loaihang")
public class ItemGroup {

	@Id
	@Column(name = "ma_loai")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;

	@Column(name = "tenloai")
	private String name;

	@OneToMany(fetch = FetchType.LAZY, mappedBy = "itemGroup")
	private List<Item> items;

	public ItemGroup() {

	}

	public ItemGroup(Integer id, String name) {
		super();
		this.id = id;
		this.name = name;
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

	public List<Item> getItems() {
		return items;
	}

	public void setItems(List<Item> items) {
		this.items = items;
	}

	@Override
	protected ItemGroup clone() throws CloneNotSupportedException {
		ItemGroup itemGroup = new ItemGroup();
		itemGroup.id = this.id;
		itemGroup.name = this.name;
		return itemGroup;
	}

	@Override
	public String toString() {
		return "ItemGroup [id=" + id + ", name=" + name + "]";
	}

}
