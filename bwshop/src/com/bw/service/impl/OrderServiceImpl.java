package com.bw.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.bw.dao.OrderMapper;
import com.bw.entity.District;
import com.bw.entity.OrderDetail;
import com.bw.entity.OrderItem;
import com.bw.service.OrderService;
@Service
@Transactional
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderMapper orderMapper;

	@Override
	public List<District> listdistrict(int upid) {
		// TODO Auto-generated method stub
		return orderMapper.listdistrict(upid);
	}

	@Override
	public int addorder(OrderDetail order) {
		UUID uuid = UUID.randomUUID();
		String order_code = uuid.toString().replace("-", "");
		order.setOrder_code(order_code);
		order.setStatus(1);
		orderMapper.addorder(order);
		//给OrderItem赋值
		for (OrderItem orderItem:order.getOrderItemList()) {
			orderItem.setOrder_code(order_code);
		}
		//保存订单商品信息
		orderMapper.addItem(order.getOrderItemList());
		//保存订单物流信息
		order.getOrderShipping().setOrder_code(order_code);
		int i = orderMapper.addOrderShipping(order.getOrderShipping());
		return i;
	}
}
