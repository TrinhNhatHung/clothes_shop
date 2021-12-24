package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.ItemDao;
import com.shop.entity.Item;

@Service
public class ItemService extends EntityService{
	
	@Autowired
	private ItemDao itemDao;

	@Transactional
	public List<Item> getItemsInPage(Integer page) {
		return itemDao.getItemsInPage(page);
	}

	@Transactional
	public List<Item> getSearchedItems(String from, String to, String itemGroup, String search, Integer page) {
		return itemDao.getResearchedItems(from, to, itemGroup, search, page);
	}
	
}
