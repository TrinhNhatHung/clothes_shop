package com.shop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.dao.SizeDao;
import com.shop.entity.Size;

@Service
public class SizeService {

	@Autowired
	private SizeDao sizeDao;

	public List<Size> getAll() {
		return sizeDao.getAll(Size.class);
	}
}
