package com.catchmind.catchfun.main.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.catchmind.catchfun.main.model.vo.Main;

@Repository("maDao")
public class MainDao {

	public ArrayList<Main> mainSpotlightList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("mainMapper.mainSpotlightList");
	}
	

	public ArrayList<Main> mainComingsoonList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("mainMapper.mainComingsoonList");
	}
}
