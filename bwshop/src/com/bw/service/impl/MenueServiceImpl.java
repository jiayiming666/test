package com.bw.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bw.dao.MenueMapper;
import com.bw.entity.Menue;
import com.bw.service.MenueService;
@Service
public class MenueServiceImpl implements MenueService{
	@Autowired
	private MenueMapper menueMapper;

	@Override
	public List<Menue> getListMenue(int i) {
		// TODO Auto-generated method stub
		return menueMapper.getListMenue(i);
	}
}
