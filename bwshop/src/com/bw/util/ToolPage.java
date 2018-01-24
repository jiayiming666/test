package com.bw.util;

import java.util.List;

import org.springframework.ui.Model;
/**
  * <p>类名：ToolPage</p>
  * <p>描述： 分页工具类</p>
  * 
  * @author: pk
  * @version: 
  * @date: 2016-12-14
 */
public class ToolPage {
	
	@SuppressWarnings("all")
	public static void page(Model model, int currentPage, int pageSize, String url, int listCount, List list) {
		String firstPage="",precursorPage="",nextPage="",lastPage="";
		//总页数
		int pageCount =  listCount / pageSize + (listCount % pageSize != 0 ? 1 : 0);
		//url传参标记
		//String flag = url.indexOf("?") > -1 ? "&" : "?";
		
		if (currentPage == 0) {
			firstPage = "首页";
		} else {
			//firstPage = "<a href=\"" + path + "/" + url + flag + "currentPage=0\">首页</a>";
			firstPage= "<a href=\"javascript:(0);" + "onclick=oClick('"+url + "currentPage=0"+"')\">首页</a>";
		}
		
		if (currentPage == 0) {
			precursorPage= "上一页";
		} else {
			//precursorPage = "<a href=\"" +path + "/" + url + flag + "currentPage=" + (currentPage - 1) + "\">上一页</a>";
			precursorPage= "<a href=\"javascript:(0);" + "onclick=oClick('"+url+ "currentPage=" + (currentPage - 1) +"')" + "\">上一页</a>";
		}
		
		if (currentPage < pageCount - 1) {
			//nextPage = "<a href=\"" + path + "/" + url + flag + "currentPage=" + (currentPage + 1) + "\">下一页</a>";
			nextPage= "<a href=\"javascript:(0);" + "onclick=oClick('"+url+ "currentPage="+(currentPage + 1)+"')" + "\">下一页</a>";
		} else {
			nextPage = "下一页";
		}
		
		if (currentPage < pageCount - 1) {
			//lastPage= "<a href=\"" + path + "/" + url + flag + "currentPage=" + (pageCount - 1) + "\">末页</a>";
			lastPage= "<a href=\"javascript:(0);" + "onclick=oClick('"+url + "currentPage="+(pageCount - 1)+"')" + "\">末页</a>";
		} else {
			lastPage = "末页";
		}
		//每一页显示记录
		model.addAttribute("list", list);
		model.addAttribute("page","共有"+listCount+"记录,"+"当前是"+(currentPage+1)+"/"+pageCount+"页&nbsp;"+firstPage+"&nbsp;"+precursorPage+"&nbsp;"+nextPage+"&nbsp;"+lastPage);
	}
}