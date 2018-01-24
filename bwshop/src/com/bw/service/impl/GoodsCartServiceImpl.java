package com.bw.service.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.dao.GoodsCartMapper;
import com.bw.dto.GoodsCartBean;
import com.bw.entity.Goods;
import com.bw.entity.GoodsCart;
import com.bw.service.GoodsCartService;
@Service
public class GoodsCartServiceImpl implements GoodsCartService{
	@Autowired
	private GoodsCartMapper goodsCartMapper;

	@Override
	public GoodsCart getGoodsCart(Map<String, Object> map) {
		// TODO Auto-generated method stub
		return goodsCartMapper.getGoodsCart(map);
	}

	@Override
	public int editGoodsCart(Goods goods, GoodsCart goodsCart) {
		goodsCart.setGtotal(goods.getGprice()*goods.getNumber());
		goodsCart.setGnum(goods.getNumber());
		return goodsCartMapper.editGoodsCart(goodsCart);
	}

	@Override
	public int addGoodsCart(Goods goods, int uid) {
		GoodsCart goodsCart = new GoodsCart();
		goodsCart.setGnum(goods.getNumber());
		goodsCart.setGtotal(goods.getGprice()*goods.getNumber());
		goodsCart.setUid(uid);
		goodsCart.setGid(goods.getGid());
		return goodsCartMapper.addGoodsCart(goodsCart);
	}

	@Override
	public List<GoodsCartBean> GoodsCartByUid(int uid) {
		// TODO Auto-generated method stub
		return goodsCartMapper.GoodsCartByUid(uid);
	}
}
