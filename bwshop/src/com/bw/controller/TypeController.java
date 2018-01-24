package com.bw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.entity.Types;
import com.bw.service.TypeService;


@Controller
public class TypeController {
	@Autowired
	private TypeService typeService;
	@RequestMapping("typetreeList")
	@ResponseBody
	public List<Types> typetreeList(){
		List<Types> list = typeService.getListtype();
		return list;
	}
}
