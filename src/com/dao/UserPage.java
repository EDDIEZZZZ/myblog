package com.dao;

import java.util.List;



public class UserPage {
	private static int u_currentPage;
	private static int u_pageSize;
	private static int u_totalCount;
	private static int u_totalPage;
	private static List<User> user;
	public  UserPage() {
	}
	public  UserPage(int u_currentPage ,int u_pageSize, int u_totalCount,int u_totalPage,List<User> user) {
		UserPage.u_currentPage = u_currentPage;
		UserPage.u_pageSize = u_pageSize;
		UserPage.u_totalCount = u_totalCount;
		UserPage.u_totalPage = u_totalPage;
		UserPage.user = user;
	}
	public static int getU_currentPage() {
		return u_currentPage;
	}
	public static void setU_currentPage(int u_currentPage) {
		UserPage.u_currentPage = u_currentPage;
	}
	public static int getU_pageSize() {
		return u_pageSize;
	}
	public static void setU_pageSize(int u_pageSize) {
		UserPage.u_pageSize = u_pageSize;
		UserPage.u_totalPage = UserPage.u_totalCount%UserPage.u_pageSize==0?UserPage.u_totalCount/UserPage.u_pageSize:UserPage.u_totalCount/UserPage.u_pageSize+1;
	}
	public static int getU_totalCount() {
		return u_totalCount;
	}
	public static void setU_totalCount(int u_totalCount) {
		UserPage.u_totalCount = u_totalCount;
	}
	public static int getU_totalPage() {
		return u_totalPage;
	}
	public static void setU_totalPage(int u_totalPage) {
		UserPage.u_totalPage = u_totalPage;
	}
	public static List<User> getUser() {
		return user;
	}
	public static void setUser(List<User> user) {
		UserPage.user = user;
	}
}
