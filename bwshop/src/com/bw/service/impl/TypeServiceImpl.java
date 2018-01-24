package com.bw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.dao.TypeMapper;
import com.bw.entity.Types;
import com.bw.service.TypeService;

import aj.org.objectweb.asm.Type;
@Service
public class TypeServiceImpl implements TypeService {
	@Autowired
	private TypeMapper typeMapper;

	@Override
	public List<Types> getListtype() {
		// TODO Auto-generated method stub
		return typeMapper.getListtype();
	}
}
