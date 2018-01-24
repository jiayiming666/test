package com.bw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.dao.GoodsMapper;
import com.bw.dto.GoodsBean;
import com.bw.entity.Goods;
import com.bw.service.GoodsService;
@Service
public class GoodsServiceImpl implements GoodsService{
	@Autowired
	private GoodsMapper goodsMapper;

	@Override
	public List<GoodsBean> getGoods() {
		// TODO Auto-generated method stub
		return goodsMapper.getGoods();
	}

	@Override
	public int updateGoods(Goods goods) {
		// TODO Auto-generated method stub
		return goodsMapper.updateGoods(goods);
	}

	@Override
	public GoodsBean getGoodsByGid(int gid) {
		// TODO Auto-generated method stub
		return goodsMapper.getGoodsByGid(gid);
	}

	@Override
	public int addGoods(Goods goods) {
		// TODO Auto-generated method stub
		return goodsMapper.addGoods(goods);
	}

	@Override
	public int delGoods(int gid) {
		// TODO Auto-generated method stub
		return goodsMapper.delGoods(gid);
	}

	@Override
	public Goods getGoodsById(int gid) {
		// TODO Auto-generated method stub
		return goodsMapper.getGoodsById(gid);
	}
}
