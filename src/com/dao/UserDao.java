package com.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;


public class UserDao {
	public boolean zhaohui(User user) {
		String sql = "update user set u_pass=? where u_question=? and u_answer=? and u_id=?";
		Object[] params = {user.getU_pass(),user.getU_question(),user.getU_answer(),user.getU_id()};
		return DBUtil.ExecuteUpdate(sql, params);
	}
	public User queryUserName(User user) {
		User us = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "select * from user where u_name=? and is_used=true";
			Object[] params = {user.getU_name()};
			rs = DBUtil.ExecuteQuery(sql, params);
			while (rs.next()) { 
				int u_id = rs.getInt("u_id");
				String u_name = rs.getString("u_name");
				String u_answer = rs.getString("u_answer");
				us = new User(u_id,u_name,u_answer);
			}
			return us;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.closeAll(rs, pstmt, DBUtil.connection);
		}
	}
	public User queryUserId(User user) {
		User us = null;
		ResultSet rs = null;
		PreparedStatement pstmt = null;
		try {
			String sql = "select * from user where u_id=? and is_used=true";
			Object[] params = {user.getU_id()};
			rs = DBUtil.ExecuteQuery(sql, params);
			while (rs.next()) {
				int u_id = rs.getInt("u_id");
				String u_question = rs.getString("u_question");
				String u_answer = rs.getString("u_answer");
				us = new User(u_id,u_question,u_answer);
			}
			return us;
		} catch (SQLException e) {
			e.printStackTrace();
			return null;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		} finally {
			DBUtil.closeAll(rs, pstmt, DBUtil.connection);
		}
	}

	public boolean UserId(User user) {
		return queryUserId(user)==null? false:true;
	}
//	public boolean UserName(User user) {
//		return queryUserName(user)==null? false:true;
//	}
	
	
	
	
//	public List<User> UserPage(int u_currentPage, int u_pageSize) {
//		List<User> user = new ArrayList<User>();
//		String sql = "select * from user limit ?,?";
//		Object[] params = {u_currentPage*u_pageSize,u_pageSize};
//		ResultSet rs = DBUtil.ExecuteQuery(sql, params);
//		try {
//			while(rs.next()) {
//				int u_id = rs.getInt("u_id");
//				String u_name = rs.getString("u_name");
//				String u_pass = rs.getString("u_pass");
//				String u_a = rs.getString("u_a");
//				String u_b = rs.getString("u_b");
//				User use = new User(u_id,u_name,u_pass,u_a,u_b);
//				user.add(use);
//			}
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}catch (Exception e) {
//			e.printStackTrace();
//		}
//		return user;
//	}
//
//	public List<User> UserPage(int u_currentPage, int u_pageSize) {
//		return UserDao.UserPage(u_currentPage, u_pageSize);
//	}

}
