package com.bw.service;

import java.util.List;
import java.util.Map;

import com.bw.dto.GoodsCartBean;
import com.bw.entity.Goods;
import com.bw.entity.GoodsCart;

public interface GoodsCartService {

	GoodsCart getGoodsCart(Map<String, Object> map);

	int editGoodsCart(Goods goods, GoodsCart goodsCart);

	int addGoodsCart(Goods goods, int uid);

	List<GoodsCartBean> GoodsCartByUid(int uid);

}
