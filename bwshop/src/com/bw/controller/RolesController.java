package com.bw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.entity.Roles;
import com.bw.entity.User;
import com.bw.service.RolesService;
import com.bw.service.UserService;

@Controller
public class RolesController {
	@Autowired
	private RolesService rolesService;
	@Autowired
	private UserService userService;
	@RequestMapping("toRolesUpdate")
	@ResponseBody
	public Object toRolesUpdate(int uid){
		User user = userService.getuser(uid);
		List<Roles> roles = userService.getRoles();
		List<Roles> rolebyid = userService.getUserRoles(uid);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("user", user);
		map.put("roles", roles);
		map.put("rolebyid", rolebyid);
		return map;
	}
	
	@RequestMapping("RolesUpdate")
	@ResponseBody
	public Object RolesUpdate(int uid,int rid){
		User user = userService.getuser(uid);
		List<Roles> roles = userService.getRoles();
		List<Roles> rolebyid = userService.getUserRoles(uid);
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("user", user);
		map.put("roles", roles);
		map.put("rolebyid", rolebyid);
		return map;
	}
	@RequestMapping("UpdateRolesByUid")
	@ResponseBody
	public Object UpdateRolesByUid(int uid,String rids){
		String[] rid = rids.split(",");
		Map<String, Object> map = new HashMap<String,Object>();
		map.put("uid", uid);
		map.put("rids", rid);
		int i = rolesService.updateRoles(map);
		return i;
	}
}
