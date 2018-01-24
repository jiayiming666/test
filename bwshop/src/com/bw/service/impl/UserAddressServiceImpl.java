package com.bw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.dao.UserAddressMapper;
import com.bw.entity.UserAddress;
import com.bw.service.UserAddressService;
@Service
public class UserAddressServiceImpl implements UserAddressService{
	@Autowired
	private UserAddressMapper userAddressMapper;

	@Override
	public UserAddress getUserAddressByUid(int uid) {
		// TODO Auto-generated method stub
		return userAddressMapper.getUserAddressByUid(uid);
	}

	@Override
	public List<UserAddress> listAddressByUid(int uid) {
		// TODO Auto-generated method stub
		return userAddressMapper.listAddressByUid(uid);
	}

	@Override
	public int editAddress(int id) {
		// TODO Auto-generated method stub
		return userAddressMapper.editAddress(id);
	}

	@Override
	public void editUserAddressByUid(int uid) {
		// TODO Auto-generated method stub
		userAddressMapper.editUserAddressByUid(uid);
	}

	@Override
	public int addAddress(UserAddress userAddress) {
		// TODO Auto-generated method stub
		return userAddressMapper.addAddress(userAddress);
	}
}
