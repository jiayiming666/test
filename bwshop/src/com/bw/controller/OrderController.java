package com.bw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.bw.dto.GoodsCartBean;
import com.bw.entity.District;
import com.bw.entity.OrderDetail;
import com.bw.entity.UserAddress;
import com.bw.service.GoodsCartService;
import com.bw.service.OrderService;
import com.bw.service.UserAddressService;

@Controller
@SessionAttributes("sum")
public class OrderController {
	@Autowired
	private OrderService orderService;
	@Autowired
	private UserAddressService userAddressService;
	@Autowired
	private GoodsCartService goodsCartService;
	@RequestMapping("toorderdetail")
	public String toorderdetail(Model model){
		int uid = 1;
		UserAddress userAddress = userAddressService.getUserAddressByUid(uid);
		List<GoodsCartBean> list = goodsCartService.GoodsCartByUid(uid);
		model.addAttribute("ad", userAddress);
		model.addAttribute("list", list);
		return "order/order_list";
	}
	@RequestMapping("listdistrict")
	@ResponseBody
	public Object listdistrict(@RequestParam(defaultValue="0") Integer upid){
		List<District> list = orderService.listdistrict(upid);
		return list;
	}
	@RequestMapping("addorderdetail")
	@ResponseBody
	public Object addorderdetail(OrderDetail order,Model model){
		order.setU_id(1);
		model.addAttribute("sum", order.getPayment());
		int i = orderService.addorder(order);
		return i;
	}
	@RequestMapping("finish")
	public String finish(Model model,@ModelAttribute("sum") String sum){
		model.addAttribute("sum", sum);
		model.addAttribute("day", "3");
		return "order/finish";
	}
}
