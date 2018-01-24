package com.bw.dao;

import java.util.List;

import com.bw.dto.GoodsBean;
import com.bw.entity.Goods;

public interface GoodsMapper {
	List<GoodsBean> getGoods();

	int updateGoods(Goods goods);

	GoodsBean getGoodsByGid(int gid);

	int addGoods(Goods goods);

	int delGoods(int gid);

	Goods getGoodsById(int gid);
}
