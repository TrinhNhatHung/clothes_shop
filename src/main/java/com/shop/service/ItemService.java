package com.shop.service;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.shop.dao.ItemDao;
import com.shop.dao.ItemGroupDao;
import com.shop.dto.ItemDto;
import com.shop.entity.Item;
import com.shop.entity.ItemGroup;
import com.shop.entity.OrderDetail;
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
	
	public ItemGroup getItemGroupById (Integer itemGroupId) {
		return itemGroupDao.getById(ItemGroup.class, itemGroupId);
	}
	
	@Transactional
	public void insertOrUpdateItGr(ItemGroup itemGroup) {
		itemGroupDao.insertOrUpdate(itemGroup);
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

	public List<ItemDto> getSoldItemInMonth(LocalDate time) {
		int month = time.getMonthValue();
		int year = time.getYear();
		List<ItemDto> result = new ArrayList<>();
		List<Item> items = itemDao.getSoldItemInMonth(time);
		for (Item item : items) {
			ItemDto itemDto = new ItemDto();
			itemDto.setItemId(item.getId());
			itemDto.setItemGroup(item.getItemGroup().getName());
			itemDto.setName(item.getName());
			itemDto.setPrice(item.getOutPrice());

			List<OrderDetail> orderDetails = item.getOrderDetails();
			int quantity = orderDetails.stream()
					.filter(orderDetail -> orderDetail.getOrder().getCreateAt().getMonthValue() == month
							&& orderDetail.getOrder().getCreateAt().getYear() == year)
					.mapToInt(OrderDetail::getQuantity).sum();
			itemDto.setSoldQuantityByTime(quantity);
			result.add(itemDto);
		}

		return result;
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
