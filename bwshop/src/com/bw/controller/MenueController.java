package com.bw.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.bw.entity.Menue;
import com.bw.service.MenueService;

@Controller
public class MenueController {
	@Autowired
	private MenueService menueService;
	@RequestMapping("tree")
	@ResponseBody
	public List<Menue> getMenue(){
		List<Menue> list = menueService.getListMenue(1);
		return list;
	}
	@RequestMapping("index")
	public String index(){
		return "index";
	}
}
