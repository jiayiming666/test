package com.bw.dao;

import java.util.List;

import com.bw.entity.UserAddress;

public interface UserAddressMapper {

	UserAddress getUserAddressByUid(int uid);

	List<UserAddress> listAddressByUid(int uid);

	int editAddress(int id);

	void editUserAddressByUid(int uid);

	int addAddress(UserAddress userAddress);

}
