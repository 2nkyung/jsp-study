package test.jsp.study.service.impl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import test.jsp.study.dao.UserDAO;
import test.jsp.study.dao.Impl.UserDAOImpl;
import test.jsp.study.service.UserService;

public class UserServiceImpl implements UserService {

	UserDAO udao = new UserDAOImpl();
	@Override
	public List<Map<String, String>> selectUserList(Map<String, String> user) {
	
		return udao.selectUserList(user);
	}

	@Override
	public Map<String, String> selectUser(Map<String, String> user) {
	
		return udao.selectUser(user);
	}

	@Override
	public int insertUser(Map<String, String> user) {
		
		return udao.insertUser(user);
	}

	@Override
	public int updateUser(Map<String, String> user) {
	
		return udao.updateUser(user);
	}

	@Override
	public int deleteUser(Map<String, String> user) {
	
		return udao.deleteUser(user);
	}

	public static void main(String[]args) {
		UserService us = new UserServiceImpl();
		System.out.println(us.selectUserList(null));
		Map<String,String> m = new HashMap<>();
		m.put("ui_num", "61");
		System.out.println(us.selectUser(m));
		m.put("ui_name", "크크");
		m.put("ui_age", "55");
		m.put("ui_etc", "ㅇㅇ");
		m.put("ui_id", "ooi");
		System.out.println(us.insertUser(m));
		
		
	}
}
