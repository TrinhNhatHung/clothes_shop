package com.shop.dao;

import java.time.LocalDate;
import java.util.List;

import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.query.NativeQuery;
import org.hibernate.query.Query;
import org.hibernate.type.IntegerType;
import org.springframework.stereotype.Repository;

import com.shop.entity.Item;
import com.shop.util.HqlUtils;

@Repository
public class ItemDao extends EntityDao<Item> {

	private static String HQL_RESEARCH_ITEMS = "";
	private static String HQL_GET_ALL_ITEMS = "";

	public List<Item> getItemsInPage(String sort, Integer page) {
		Session session = getCurrentSession();
		String hql = "From Item i WHERE i.status = true " + HqlUtils.getSort(sort);
		Query<Item> query = session.createQuery(hql);
		query.setFirstResult(page * 6);
		query.setMaxResults(6);
		return query.list();
	}

	public List<Item> getResearchedItems(String from, String to, String itemGroup, String search, String sort,
			Integer page) {
		Session session = getCurrentSession();
		System.out.println("SORT = " + sort);

		String hql = "From Item i WHERE i.status = true and i.outPrice between " + from + " and " + to
				+ " and i.itemGroup.name LIKE '%" + itemGroup + "%'" + " and i.name LIKE '%" + search + "%' "
				+ HqlUtils.getSort(sort);
		Query<Item> query = session.createQuery(hql);
		query.setFirstResult(page * 6);
		query.setMaxResults(6);
		return query.list();
	}

	public int getSizePage(String from, String to, String itemGroup, String search, Integer page, String sort,
			String pageIn) {
		Session session = getCurrentSession();
		String hql = "";
		if (pageIn.equals("search")) {
			hql = "From Item i WHERE i.status = true and i.outPrice between " + from + " and " + to
					+ " and i.itemGroup.name LIKE '%" + itemGroup + "%'" + " and i.name LIKE '%" + search + "%' ";
		} else {
			hql = "FROM Item i ";
		}
		hql += HqlUtils.getSort(sort);
		Query<Item> query = session.createQuery(hql);
		return query.list().size();
	}

	public List<Item> getSoldItemInMonth(LocalDate time) {
		int month = time.getMonthValue();
		int year = time.getYear();

		String sql = "SELECT DISTINCT(i.ma_mh), i.tenmathang, i.giaban, i.giamua, i.mota, i.giamgia, i.hinhanh, i.ma_loai, i.trangthai FROM mathang i\n"
				+ "JOIN chitietdonhang ctdh ON i.ma_mh = ctdh.ma_mh\n" + "JOIN donhang dh ON dh.ma_dh = ctdh.ma_dh\n"
				+ "WHERE month(ngay_tao) = :month AND year(ngay_tao) = :year";
		NativeQuery<Item> query = openSession().createNativeQuery(sql, Item.class);
		query.setParameter("month", month).setParameter("year", year);
		return query.getResultList();
	}

	public int getTotalPage(String name) {
		return (int) getCurrentSession()
				.createNativeQuery(
						"SELECT COUNT(*) counter FROM mathang WHERE trangthai = 1 and tenmathang LIKE '%" + name + "%'")
				.addScalar("counter", IntegerType.INSTANCE).uniqueResult();
	}

	public List<Item> getItems(String name, int offset, int recordsPerPage) {
		return openSession()
				.createNativeQuery("SELECT * FROM mathang WHERE trangthai = 1 and tenmathang LIKE '%" + name
						+ "%' LIMIT :offset, :rowcount", Item.class)
				.setParameter("offset", offset, IntegerType.INSTANCE)
				.setParameter("rowcount", recordsPerPage, IntegerType.INSTANCE).getResultList();
	}

	public void deleteItem(int id) {
		final String sql = "UPDATE mathang SET trangthai = 0 WHERE ma_mh = " + id;
		Session session = openSession();
		Transaction transaction = session.beginTransaction();
		try {
			session.createNativeQuery(sql).executeUpdate();
			transaction.commit();
			System.out.println("SQL: " + sql);
		} catch (Exception e) {
			transaction.rollback();
		}
	}

}
