package com.bw.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.bw.dto.GoodsBean;
import com.bw.entity.Goods;
import com.bw.service.GoodsService;
import com.bw.util.FilesUtils;

@Controller
public class GoodsController {
	@Autowired
	private GoodsService goodsService;
	@RequestMapping("goodslist")
	public String goodslist(Model model){
		List<GoodsBean> list = goodsService.getGoods();
		model.addAttribute("list", list);
		return "goods/goods_list";
	}
	@RequestMapping("addgoods")
	public String addgoods(){
		return "goods/goods_add";
	}
	@RequestMapping("goodsadd")
	@ResponseBody
	public Object goodsadd(HttpServletRequest request,@RequestParam("file") MultipartFile file,Goods goods){
		String path = "";
		if (null!=file.getOriginalFilename()&&!"".equals(file.getOriginalFilename())) {
			path = FilesUtils.FilesUpload_Spring(request, file, "upload");
			path = path.substring(path.indexOf("upload"),path.length());
			goods.setGurl(path);
		}
		int i = goodsService.addGoods(goods);
		return i;
	}
	@RequestMapping("goodstype")
	public String goodstype(){
		return "goods/goods_type";
	}
	@RequestMapping("updategoods")
	public String updategoods(int gid,Model model){
		GoodsBean goods = goodsService.getGoodsByGid(gid);
		model.addAttribute("a", goods);
		return "goods/goods_update";
	}
	@RequestMapping("goodsupdate")
	@ResponseBody
	public Object goodsupdate(@RequestParam(required=false) MultipartFile file,HttpServletRequest request,Goods goods){
		String path ="";
		if (null!=file.getOriginalFilename()&&!"".equals(file.getOriginalFilename())) {
			path = FilesUtils.FilesUpload_Spring(request, file, "upload");
			path = path.substring(path.indexOf("upload"),path.length());
			goods.setGurl(path);
		}
		
		System.out.println(goods.getGurl());
		int i = goodsService.updateGoods(goods);
		return i;
	}
	@RequestMapping("delgoods")
	@ResponseBody
	public Object delgoods(int gid){
		int i = goodsService.delGoods(gid);
		return i;
	}
	
}
