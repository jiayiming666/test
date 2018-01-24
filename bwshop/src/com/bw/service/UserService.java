package com.bw.service;

import java.util.List;
import java.util.Map;

import com.bw.dto.UserBean;
import com.bw.entity.Roles;
import com.bw.entity.User;

public interface UserService {
	List<User> getUserList(Map<Object, Object> map);

	int useradd(User user);

	int deluser(int uid);

	User getuser(int uid);

	int userUpdate(User user);
	
	List<UserBean> getUserBean();
	//回显所有权限
	List<Roles> getRoles();
	//根据用户ID回显权限
	List<Roles> getUserRoles(int uid);

	int listUCount();
}
