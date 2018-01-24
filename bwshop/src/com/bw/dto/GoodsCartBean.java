package com.bw.dto;

import com.bw.entity.Goods;

public class GoodsCartBean extends Goods{
	private double gtotal;

	public double getGtotal() {
		return gtotal;
	}

	public void setGtotal(double gtotal) {
		this.gtotal = gtotal;
	}
}
