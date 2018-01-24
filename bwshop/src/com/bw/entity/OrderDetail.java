package com.bw.entity;

import java.util.List;

public class OrderDetail extends Order{
	
	private OrderShipping orderShipping;
	
	private List<OrderItem> orderItemList;

	public OrderShipping getOrderShipping() {
		return orderShipping;
	}

	public void setOrderShipping(OrderShipping orderShipping) {
		this.orderShipping = orderShipping;
	}

	public List<OrderItem> getOrderItemList() {
		return orderItemList;
	}

	public void setOrderItemList(List<OrderItem> orderItemList) {
		this.orderItemList = orderItemList;
	}
}
