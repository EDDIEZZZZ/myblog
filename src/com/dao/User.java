package com.dao;

public class User {
	private static int u_id;
	private static String u_name;
	private static String u_pass;
	private static String u_question;
	private static String u_answer;


	public User() {
	}

	public User(int u_id) {
		User.u_id = u_id;
	}

	public User(String u_name) {
		User.u_name = u_name;
	}

	public User(String u_name, String u_pass) {
		User.u_name = u_name;
		User.u_pass = u_pass;
	}

	public User(int u_id, String u_name, String u_answer) {
		User.u_id = u_id;
		User.u_name = u_name;
		User.u_answer = u_answer;
	}

	public User(int u_id, String u_question, String u_answer, String u_pass) {
		User.u_id = u_id;
		User.u_question = u_question;
		User.u_answer = u_answer;
		User.u_pass = u_pass;
	}

	public User(String u_name, String u_pass, String u_question, String u_answer) {
		User.u_name = u_name;
		User.u_pass = u_pass;
		User.u_question = u_question;
		User.u_answer = u_answer;
	}

	public User(int u_id, String u_name, String u_pass, String u_question, String u_answer) {
		User.u_id = u_id;
		User.u_name = u_name;
		User.u_pass = u_pass;
		User.u_question = u_question;
		User.u_answer = u_answer;
	}

	public static int getU_id() {
		return u_id;
	}

	public static void setU_id(int u_id) {
		User.u_id = u_id;
	}

	public static String getU_name() {
		return u_name;
	}

	public static void setU_name(String u_name) {
		User.u_name = u_name;
	}

	public static String getU_pass() {
		return u_pass;
	}

	public static void setU_pass(String u_pass) {
		User.u_pass = u_pass;
	}

	public static String getU_question() {
		return u_question;
	}

	public static void setU_question(String u_question) {
		User.u_question = u_question;
	}

	public static String getU_answer() {
		return u_answer;
	}

	public static void setU_answer(String u_answer) {
		User.u_answer = u_answer;
	}
}