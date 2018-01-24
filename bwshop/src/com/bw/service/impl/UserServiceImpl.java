package com.bw.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.dao.UserMapper;
import com.bw.dto.UserBean;
import com.bw.entity.Roles;
import com.bw.entity.User;
import com.bw.service.UserService;
@Service
public class UserServiceImpl implements UserService{
	@Autowired
	private UserMapper userMapper;

	@Override
	public List<User> getUserList(Map<Object, Object> map) {
		// TODO Auto-generated method stub
		return userMapper.getUserList(map);
	}

	@Override
	public int useradd(User user) {
		// TODO Auto-generated method stub
		return userMapper.useradd(user);
	}

	@Override
	public int deluser(int uid) {
		// TODO Auto-generated method stub
		return userMapper.deluser(uid);
	}

	@Override
	public User getuser(int uid) {
		// TODO Auto-generated method stub
		return userMapper.getuser(uid);
	}

	@Override
	public int userUpdate(User user) {
		// TODO Auto-generated method stub
		return userMapper.userUpdate(user);
	}

	@Override
	public List<UserBean> getUserBean() {
		// TODO Auto-generated method stub
		return userMapper.getUserBean();
	}
	//回显全部权限
	@Override
	public List<Roles> getRoles() {
		// TODO Auto-generated method stub
		return userMapper.getRoles();
	}

	@Override
	public List<Roles> getUserRoles(int uid) {
		// TODO Auto-generated method stub
		return userMapper.getUserRoles(uid);
	}

	@Override
	public int listUCount() {
		// TODO Auto-generated method stub
		return userMapper.listUCount();
	}
}
