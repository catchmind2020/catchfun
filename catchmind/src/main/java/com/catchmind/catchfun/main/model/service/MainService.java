package com.catchmind.catchfun.main.model.service;

import java.util.ArrayList;

import com.catchmind.catchfun.main.model.vo.Category;
import com.catchmind.catchfun.main.model.vo.Main;
import com.catchmind.catchfun.main.model.vo.Param;

public interface MainService {


	ArrayList<Main> mainSpotlightList();
	
	ArrayList<Category> mainCategoryList();
	
	String mainCategoryName(String cno);
	
	ArrayList<Main> mainComingsoonList();

	// 모든게시물 카운트
	int getListCnt();
	
	// 카테고리별 list ajax 스크롤페이징 서비스
	ArrayList<Main> getList(String cno, String order, Param param);
	
	// menubar 검색용 서비스 (ajax 스크롤페이징 서비스)
	ArrayList<Main> mainSearchAjax(String keyword, Param param); 
}
