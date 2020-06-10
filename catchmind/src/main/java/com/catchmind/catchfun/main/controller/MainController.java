package com.catchmind.catchfun.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.catchmind.catchfun.main.model.service.MainService;
import com.catchmind.catchfun.main.model.vo.Category;
import com.catchmind.catchfun.main.model.vo.Main;
import com.catchmind.catchfun.main.model.vo.Param;
import com.google.gson.Gson;

@Controller
public class MainController {
	
	@Autowired
	private MainService maService;
	
	
	/**
	 * 메인페이지
	 */
	@RequestMapping("main.mu")
	public String projectMain(Model model) {
		
		ArrayList<Main> list = maService.mainSpotlightList();
		
	
		model.addAttribute("list", list);
		return "main";
	}

	
	/**
	 * 카테고리메뉴
	 */
	@RequestMapping("category.mu")
	public String mainCategoryList(String cno, String order, Model model) {
		
		ArrayList<Category> listCategory = maService.mainCategoryList();
		//ArrayList<Main> listCategoryProject = maService.mainCategoryProjectList(cno, order);
		
		String msg = maService.mainCategoryName(cno);
		

		//model.addAttribute("listCategoryProject", listCategoryProject);
		model.addAttribute("listCategory", listCategory);
		
		if(cno!=null) {
			model.addAttribute("cgmsg", msg);
			model.addAttribute("msgs", cno);
			
		}else {
			model.addAttribute("cgmsg", "전체보기");
		}
		
		return "mainMenu/categoryMenu";
	}
	
	
	/**
	 * 카테고리메뉴 -> ajax(스크롤페이징)
	 */
	@RequestMapping(value="ajax.mu", produces="text/plain;charset=UTF-8")
	@ResponseBody
	public String getList(Param param, HttpServletRequest request, HttpServletResponse response, ModelMap model) {
	    Gson gson = new Gson();
	    try {
			
			 String cno = param.getCno(); 		// 카테고리 번호
			 String order = param.getOrder();	// 정렬값
			 
	    	
	        int totalCnt = maService.getListCnt();  	//데이터의 전체 갯수
	        int page = param.getPage();  				//현재페이지수
	        
	        if (page==1){
	            param.setStartNum(1);
	            param.setEndNum(6);  						// 처음 데이터를 6개 가져옴
	        }else{
	            param.setStartNum(page+(5*(page-1)));  		// 시작번호 1page -> 1, 2page -> 7, 3page -> 13 ...
	            param.setEndNum(page*6);					// 끝번호 1page -> 6, 2page -> 12 ...
	        }
	        
	        
	        //위에서 구한, 데이터를 가져온 startNum 과 endNum 값을 같이  보냄. 이 사이의 데이터를 조회
	        //System.out.println(cno);
	        //System.out.println(order);
	        ArrayList<Main> list = maService.getList(cno, order, param); 
	 
	        param.setRows(list);
	        param.setTotCnt(totalCnt);
	        param.setResultCode(200);
	        
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return gson.toJson(param);
	}
	
	
	
	
	/**
	 * 오픈예정메뉴
	 */
	@RequestMapping("comingsoon.mu")
	public String mainComingsoonList(Model model) { 
		
		ArrayList<Main> list = maService.mainComingsoonList();
	
		model.addAttribute("list", list);
		return "mainMenu/comingsoon";
	}

}
