package com.shop.util;

public class HqlUtils {
	private HqlUtils() {
		
	}
	
	public static String getSort(String sort) {
		if(sort == null) {
			sort = "";
		} else if(sort.equals("asc")) {
			sort = "ORDER BY i.outPrice ASC";
		} else {
			sort = "ORDER BY i.outPrice DESC";
		}
		return sort;
	}
}
