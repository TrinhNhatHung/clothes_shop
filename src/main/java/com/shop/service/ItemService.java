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
	public List<Item> getItemsInPage(String sort, Integer page) {
		return itemDao.getItemsInPage(sort, page);
	}

	@Transactional
	public List<Item> getSearchedItems(String from, String to, String itemGroup, String search, String sort, Integer page) {
		return itemDao.getResearchedItems(from, to, itemGroup, search, sort, page);
	}

	@Transactional
	public int getSizePage(String from, String to, String itemGroup, String search, Integer page, String sort, String pageIn) {
		int size = itemDao.getSizePage(from, to, itemGroup, search, page, sort, pageIn);
		int n = size / 6;
		if(size % 6 > 0) {
			n = n + 1;
		}
		return n;
	}
	
}
