package com.bw.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.dto.UserBean;
import com.bw.entity.Roles;
import com.bw.entity.User;
import com.bw.service.UserService;
import com.bw.util.ToolPage;

@Controller
public class UserController {
	@Autowired
	private UserService userService;
	@RequestMapping("userlist")
	public String userlist(Model model,HttpServletRequest request,@RequestParam(defaultValue="0") Integer currentPage){
		int pageSize = 5;
		String url = "userlist.do?";
		Map<Object,Object> map=new HashMap<Object,Object>();
		map.put("rows", pageSize);
		map.put("index",pageSize*currentPage);
		List<User> list = userService.getUserList(map);
		int listCount=userService.listUCount();
		model.addAttribute("list", list);
		ToolPage.page(model, currentPage, pageSize, url, listCount, list);
		return "user/user_list";
	}
	//添加用户页面
	@RequestMapping("adduser")
	public String adduser(){
		return "user/user_add";
	}
	//添加用户
	@RequestMapping("useradd")
	@ResponseBody
	public Object useradd(User user){
		int i = userService.useradd(user);
		return i;
	}
	//删除用户
	@RequestMapping("deluser")
	@ResponseBody
	public Object deluser(int uid){
		int i = userService.deluser(uid);
		return i;
	}
	//修改用户页面
	@RequestMapping("updateuser")
	public String updateuser(int uid,Model model){
		User user = userService.getuser(uid);
		model.addAttribute("u", user);
		return "user/user_update";
	}
	//修改用户
	@RequestMapping("userupdate")
	@ResponseBody
	public Object userupdate(User user){
		int i = userService.userUpdate(user);
		return i;
	}
	//查询用户权限
	@RequestMapping("roleslist")
	public String userRoles(Model model){
		List<UserBean> list=userService.getUserBean();
		model.addAttribute("list", list);
		return "user/user_roles";
	}
	//根据用户ID查询权限
	@RequestMapping("updateRoles")
	public String updateRoles(int uid){
		return "user/roles_update";
	}
	
}
