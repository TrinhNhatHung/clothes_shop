package com.shop.dao;

import java.math.BigInteger;
import java.time.LocalDate;
import java.util.List;

import org.hibernate.query.NativeQuery;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.shop.entity.Role;
import com.shop.entity.User;

@Repository
public class UserDao extends EntityDao<User> {

	@Autowired
	private RoleDao roleDao;

	@SuppressWarnings("unchecked")
	public int getTotalCustomer() {
		Role role = roleDao.findRoleByName("ROLE_CUSTOMER");
		String sql = "SELECT COUNT(*) FROM user WHERE role_id =  :roleId";
		NativeQuery<BigInteger> query = openSession().createNativeQuery(sql);
		query.setParameter("roleId", role.getId());
		return query.uniqueResult().intValue();
	}

	public List<User> getCustomer() {
		Role role = roleDao.findRoleByName("ROLE_CUSTOMER");
		String sql = "SELECT * FROM user WHERE role_id =  :roleId";
		NativeQuery<User> query = openSession().createNativeQuery(sql, User.class);
		query.setParameter("roleId", role.getId());
		return query.getResultList();
	}

	public List<User> getCustomeByPage(int page) {
		Role role = roleDao.findRoleByName("ROLE_CUSTOMER");
		String sql = "SELECT * FROM user WHERE role_id =  :roleId";
		NativeQuery<User> query = openSession().createNativeQuery(sql, User.class);
		query.setParameter("roleId", role.getId());
		int rowPerPage = 10;
		query.setMaxResults(rowPerPage);
		query.setFirstResult(rowPerPage * (page - 1));
		return query.getResultList();
	}

	public List<User> getUserByRoleAndSearchCondition(String roleName, String field, String searchText, int page) {
		Role role = roleDao.findRoleByName(roleName);
		String sql = "SELECT * FROM user WHERE role_id =  :roleId AND " + field + " LIKE :searchText";
		NativeQuery<User> query = openSession().createNativeQuery(sql, User.class);
		query.setParameter("roleId", role.getId()).setParameter("searchText", "%" + searchText + "%");
		int rowPerPage = 10;
		query.setMaxResults(rowPerPage);
		query.setFirstResult(rowPerPage * (page - 1));
		return query.getResultList();
	}

	@SuppressWarnings("unchecked")
	public int getTotalUserByRoleAndSeachCondition(String roleName, String field, String searchText) {
		Role role = roleDao.findRoleByName(roleName);
		String sql = "SELECT COUNT(*) FROM user WHERE role_id =  :roleId AND " + field + " LIKE :searchText";
		NativeQuery<BigInteger> query = openSession().createNativeQuery(sql);
		query.setParameter("roleId", role.getId()).setParameter("searchText", "%" + searchText + "%");
		return query.uniqueResult().intValue();
	}

	@SuppressWarnings("unchecked")
	public int getTotalNewUserByMonth(LocalDate time) {
		int month = time.getMonthValue();
		int year = time.getYear();
		String sql = "SELECT COUNT(*) FROM user WHERE month(createAt) = :month AND year(createAt) = :year ";
		NativeQuery<BigInteger> query = openSession().createNativeQuery(sql);
		query.setParameter("month", month).setParameter("year", year);

		return query.uniqueResult().intValue();
	}

	public List<User> getCustomerOrderedInMonth(LocalDate time) {
		int month = time.getMonthValue();
		int year = time.getYear();

		String sql = "SELECT DISTINCT(u.username), u.fullname, u.phone, u.gender,u.address,u.createAt, u.password, u.role_id FROM user u\n"
				+ "JOIN donhang dh ON dh.khach_hang = u.username\n" + "JOIN role r ON r.role_id = u.role_id \n"
				+ "WHERE r.name = :roleName AND month(ngay_tao) = :month AND year(ngay_tao) = :year";

		NativeQuery<User> query = openSession().createNativeQuery(sql, User.class);
		query.setParameter("roleName", Role.ROLE_CUSTOMER).setParameter("month", month).setParameter("year", year);

		return query.getResultList();
	}
}
