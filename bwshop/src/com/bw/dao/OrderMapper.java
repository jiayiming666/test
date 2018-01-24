package com.bw.dao;

import java.util.List;

import com.bw.entity.District;
import com.bw.entity.OrderDetail;
import com.bw.entity.OrderItem;
import com.bw.entity.OrderShipping;

public interface OrderMapper {

	List<District> listdistrict(int upid);

	int addorder(OrderDetail order);

	int addItem(List<OrderItem> orderItemList);

	int addOrderShipping(OrderShipping orderShipping);

}
