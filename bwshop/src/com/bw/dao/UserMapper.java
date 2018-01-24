package com.bw.dao;

import java.util.List;
import java.util.Map;

import com.bw.dto.UserBean;
import com.bw.entity.Roles;
import com.bw.entity.User;

public interface UserMapper {
	List<User> getUserList(Map<Object, Object> map);

	int useradd(User user);

	int deluser(int uid);

	User getuser(int uid);

	int userUpdate(User user);
	
	List<UserBean> getUserBean();

	List<Roles> getRoles();

	List<Roles> getUserRoles(int uid);

	int listUCount();
}
