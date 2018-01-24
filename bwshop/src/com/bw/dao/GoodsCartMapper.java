package com.bw.dao;

import java.util.List;
import java.util.Map;

import com.bw.dto.GoodsCartBean;
import com.bw.entity.GoodsCart;

public interface GoodsCartMapper {

	GoodsCart getGoodsCart(Map<String, Object> map);

	int editGoodsCart(GoodsCart goodsCart);

	int addGoodsCart(GoodsCart goodsCart);

	List<GoodsCartBean> GoodsCartByUid(int uid);

}
