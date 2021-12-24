package com.shop.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.springframework.stereotype.Repository;

import com.shop.entity.Item;

@Repository
public class ItemDao extends EntityDao{

	
	public List<Item> getItemsInPage(Integer page) {
		Session session = getCurrentSession();
		Query<Item> query = session.createQuery("From Item");
		query.setFirstResult(page * 5);
		query.setMaxResults(5);
		return query.list();
	}

	public List<Item> getResearchedItems(String from, String to, String itemGroup, String search, Integer page) {
		Session session = getCurrentSession();
		String sql = "SELECT * FROM clothes_shop.mathang m WHERE m.giaban between " + from + " and " + to;
		System.out.println("sql = " + sql);
		String hql = "From Item i WHERE i.outPrice between " + from + " and " + to 
					+ " and i.itemGroup.name LIKE '%" + itemGroup + "%'"
					+ " and i.name LIKE '%" + search + "%'";
		Query<Item> query = session.createQuery(hql);
		query.setFirstResult(page * 5);
		query.setMaxResults(5);
		return query.list();
	}

}
