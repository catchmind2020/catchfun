package com.catchmind.catchfun.main.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchmind.catchfun.main.model.dao.MainDao;
import com.catchmind.catchfun.main.model.vo.Main;

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
	public ArrayList<Main> mainComingsoonList() {
		return maDao.mainComingsoonList(sqlSession);
	}

}
