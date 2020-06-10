package com.catchmind.catchfun.main.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchmind.catchfun.main.model.dao.MainDao;
import com.catchmind.catchfun.main.model.vo.Category;
import com.catchmind.catchfun.main.model.vo.Main;
import com.catchmind.catchfun.main.model.vo.Param;

@Service("maService")
public class MainServiceImpl implements MainService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private MainDao maDao;
	

	@Override
	public ArrayList<Main> mainSpotlightList() {
		return maDao.mainSpotlightList(sqlSession);
	}
	
	
	@Override
	public ArrayList<Category> mainCategoryList() {
		return maDao.mainCategoryList(sqlSession);
	}
	


	@Override
	public String mainCategoryName(String cno) {
		return maDao.mainCategoryName(sqlSession, cno);
		
	}
	
	
	@Override
	public ArrayList<Main> mainComingsoonList() {
		return maDao.mainComingsoonList(sqlSession);
	}
	
	@Override
	public int getListCnt() {
		return maDao.getListCnt(sqlSession);
	}


	@Override
	public ArrayList<Main> getList(String cno, String order, Param param) {
		return maDao.getList(sqlSession, cno, order, param);
	}

}
