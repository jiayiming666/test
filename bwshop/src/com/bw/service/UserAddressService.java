package com.bw.service;

import java.util.List;

import com.bw.entity.UserAddress;

public interface UserAddressService {

	UserAddress getUserAddressByUid(int uid);

	List<UserAddress> listAddressByUid(int uid);

	int editAddress(int id);

	void editUserAddressByUid(int uid);

	int addAddress(UserAddress userAddress);

}
