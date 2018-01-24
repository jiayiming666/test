package com.bw.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.dto.GoodsBean;
import com.bw.dto.GoodsCartBean;
import com.bw.entity.Goods;
import com.bw.entity.GoodsCart;
import com.bw.service.GoodsCartService;
import com.bw.service.GoodsService;
import com.bw.service.JedisService;
import com.bw.util.JsonUtils;

@Controller
public class GoodsCartController {
	@Autowired
	private GoodsCartService goodsCartService;
	@Autowired
	private GoodsService goodsService;
	@Autowired
	private JedisService jedisService;
	@RequestMapping("cartdetail")
	public String cartdetail(Model model){
		List<GoodsBean> list = goodsService.getGoods();
		model.addAttribute("list", list);
		return "cart/goodscart_list";
	}
	//添加购物车
	@RequestMapping("addshopcart")
	@ResponseBody
	public Object addshopcart(int gid,int gnum){
		int uid = 1;
		long i = 0;
		//根据商品ID查商品
		Goods goods = goodsService.getGoodsById(gid);
		goods.setNumber(gnum);
		//根据商品ID与用户ID查购物车
		String ogoods = jedisService.hGet(uid+"", goods.getGid()+"");
		if (!"".equals(ogoods)&&null!=ogoods) {
			GoodsCart goodsCart = JsonUtils.jsonToPojo(ogoods, GoodsCart.class);
			//增加购物车中的商品数量
			goodsCart.setGnum(goodsCart.getGnum()+gnum);
			goodsCart.setGtotal((goodsCart.getGnum())*goods.getGprice());
			jedisService.hDel(uid+"", goods.getGid()+"");
			String json = JsonUtils.objectToJson(goodsCart);
			//修改购物车数据
			i = jedisService.hSet(uid+"", goods.getGid()+"", json);
		}else {
			String json = JsonUtils.objectToJson(getGoodsCart(goods,uid));
			i = jedisService.hSet(uid+"", goods.getGid()+"", json);
		}
		return i;
	}
	private GoodsCart getGoodsCart(Goods goods, int uid) {
		GoodsCart goodsCart = new GoodsCart();
		BeanUtils.copyProperties(goods, goodsCart);
		goodsCart.setGid(goods.getGid());
		goodsCart.setGnum(goods.getNumber());
		goodsCart.setGtotal(goods.getGnum()*goods.getGprice());
		goodsCart.setUid(uid);
		return goodsCart;
	}
	//查询购物车的内容
	@RequestMapping("goodscartlist")
	public String goodscartlist(int uid,Model model){
		
		List<GoodsCart> list = new ArrayList<GoodsCart>();
		Map<String , String > map = jedisService.hGetAll("1");
		for(String key:map.keySet()){
			GoodsCart goodsCart = JsonUtils.jsonToPojo(map.get(key), GoodsCart.class);
			list.add(goodsCart);
		}
		model.addAttribute("list", list);
		return "cart/cart_list";
	}
}
