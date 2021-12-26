package com.shop.dao;

import org.hibernate.Session;
import org.hibernate.query.NativeQuery;
import org.springframework.stereotype.Repository;

import com.shop.entity.Role;

@Repository
public class RoleDao extends EntityDao<Role> {

	public Role findRoleByName(String roleName) {
		Session session = openSession();
		String sql = "SELECT * FROM role WHERE name = :roleName";
		NativeQuery<Role> query = session.createNativeQuery(sql, Role.class);
		query.setParameter("roleName", roleName);
		return query.uniqueResult();
	}
}
