package com.bw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.dto.GoodsCartBean;
import com.bw.entity.District;
import com.bw.entity.UserAddress;
import com.bw.service.GoodsCartService;
import com.bw.service.OrderService;
import com.bw.service.UserAddressService;

@Controller
public class UserAddressController {
	@Autowired
	private UserAddressService userAddressService;
	@Autowired
	private OrderService orderService;
	@RequestMapping("listusersaddress")
	public String toorderdetail(Model model){
		int uid = 1;
		List<UserAddress> list = userAddressService.listAddressByUid(uid);
		model.addAttribute("list", list);
		return "address/userAddress_list";
	}
	@RequestMapping("editaddressdefault")
	@ResponseBody
	public Object editAddress(int id){
		int uid = 1;
		userAddressService.editUserAddressByUid(uid);
		int i = userAddressService.editAddress(id);
		return i;
	}
	@RequestMapping("toaddusersaddress")
	public String toaddusersaddress(@RequestParam(defaultValue="0") Integer upid,Model model){
		List<District> list = orderService.listdistrict(upid);
		model.addAttribute("list", list);
		return "address/userAddress_add";
	}
	@RequestMapping("addAddress")
	@ResponseBody
	public Object addAddress(UserAddress userAddress){
		int uid = 1;
		String status = "0";
		userAddress.setUid(uid);
		userAddress.setStatus(status);
		int i = userAddressService.addAddress(userAddress);
		return i;
	}
}
