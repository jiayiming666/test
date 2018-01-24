package com.bw.service.impl;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.dao.RolesMapper;
import com.bw.service.RolesService;
@Service
public class RolesServiceImpl implements RolesService{
	@Autowired
	private RolesMapper rolesMapper;

	@Override
	public int updateRoles(Map<String, Object> map) {
		int i = rolesMapper.delUserRoles(map);
		if (i>0) {
			return rolesMapper.updateRoles(map);
		}else {
			return 0;
		}
		
	}
}
