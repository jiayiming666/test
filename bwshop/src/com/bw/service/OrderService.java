package com.bw.service;

import java.util.List;

import com.bw.entity.District;
import com.bw.entity.OrderDetail;

public interface OrderService {

	List<District> listdistrict(int upid);

	int addorder(OrderDetail order);

}
