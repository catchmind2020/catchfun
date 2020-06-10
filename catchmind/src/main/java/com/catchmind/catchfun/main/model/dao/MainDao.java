package com.catchmind.catchfun.main.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.catchmind.catchfun.main.model.vo.Category;
import com.catchmind.catchfun.main.model.vo.Main;
import com.catchmind.catchfun.main.model.vo.Param;

@Repository("maDao")
public class MainDao {

	public ArrayList<Main> mainSpotlightList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("mainMapper.mainSpotlightList");
	}
	

	public ArrayList<Category> mainCategoryList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("mainMapper.mainCategoryList");
	}
	
	public String mainCategoryName(SqlSessionTemplate sqlSession, String cno){
		return sqlSession.selectOne("mainMapper.mainCategoryName", cno);
	}
	
	public ArrayList<Main> mainCategoryProjectList(SqlSessionTemplate sqlSession, String cno, String order){
        HashMap map = new HashMap();
        map.put("cno", cno);
        map.put("order", order);
        return (ArrayList)sqlSession.selectList("mainMapper.mainCategoryProjectList",map); 

 }
	
	public int getListCnt(SqlSessionTemplate sqlSession){
		return sqlSession.selectOne("mainMapper.getListCnt");
	}
	
	public ArrayList<Main> getList(SqlSessionTemplate sqlSession, String cno, String order, Param param){
        HashMap map = new HashMap();
        map.put("cno", cno);
        map.put("order", order);
        map.put("param", param);
        return (ArrayList)sqlSession.selectList("mainMapper.getList",map); 

 }
	
	
	public ArrayList<Main> mainComingsoonList(SqlSessionTemplate sqlSession){
		return (ArrayList)sqlSession.selectList("mainMapper.mainComingsoonList");
	}
}
