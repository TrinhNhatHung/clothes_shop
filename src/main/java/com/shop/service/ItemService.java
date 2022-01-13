package com.shop.service;

import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.ItemDao;
import com.shop.dao.ItemGroupDao;
import com.shop.entity.Item;
import com.shop.entity.ItemGroup;
import com.shop.entity.Size;
import com.shop.util.FirebaseUtil;

@Service
public class ItemService {

	@Autowired
	private ItemDao itemDao;

	@Autowired
	private ItemGroupDao itemGroupDao;

	@Autowired
	private FirebaseUtil firebaseUtil;

	public List<ItemGroup> getAllItemGroup() {
		return itemGroupDao.getAll(ItemGroup.class);
	}

	@Transactional
	public List<Item> getItemsInPage(String sort, Integer page) {
		List<Item> items = itemDao.getItemsInPage(sort, page);
		return items.stream().map(item -> {
			item.setLinkImage(firebaseUtil.getFileUrl(item.getImage()));
			return item;
		}).collect(Collectors.toList());
	}

	@Transactional
	public List<Item> getSearchedItems(String from, String to, String itemGroup, String search, String sort,
			Integer page) {
		List<Item> items = itemDao.getResearchedItems(from, to, itemGroup, search, sort, page);
		return items.stream().map(item -> {
			item.setLinkImage(firebaseUtil.getFileUrl(item.getImage()));
			return item;
		}).collect(Collectors.toList());
	}

	@Transactional
	public int getSizePage(String from, String to, String itemGroup, String search, Integer page, String sort,
			String pageIn) {
		int size = itemDao.getSizePage(from, to, itemGroup, search, page, sort, pageIn);
		int n = size / 6;
		if (size % 6 > 0) {
			n = n + 1;
		}
		return n;
	}

	@Transactional
	public Item getById(int id) {
		Item item = itemDao.getById(Item.class, id);
		item.setLinkImage(firebaseUtil.getFileUrl(item.getImage()));
		return item;
	}

	@Transactional
	public List<Size> getSizes(int id) {
		return itemDao.getSizes(id);
	}

	@Transactional
	public int getTotalPage(String name) {
		return itemDao.getTotalPage(name);
	}

	@Transactional
	public List<Item> getItems(String name, int offset, int recordsPerPage) {
		return itemDao.getItems(name, offset, recordsPerPage);
	}
	
	@Transactional
	public void insertAndUpdate(Item item) {
		itemDao.insertOrUpdate(item);
	}

	@Transactional
	public void deleteItem(int id) {
		itemDao.deleteItem(id);
	}
}
