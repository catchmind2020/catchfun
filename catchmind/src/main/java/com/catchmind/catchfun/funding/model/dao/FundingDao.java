package com.catchmind.catchfun.funding.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.catchmind.catchfun.funding.model.vo.FundingList;
import com.catchmind.catchfun.funding.model.vo.Maker;
import com.catchmind.catchfun.funding.model.vo.News;
import com.catchmind.catchfun.funding.model.vo.Project;
import com.catchmind.catchfun.funding.model.vo.Reply;

@Repository("fDao")
public class FundingDao {

	
	public Project selectProject(SqlSessionTemplate sqlSession, String pno) {
		
		return sqlSession.selectOne("projectMapper.selectProject", pno);
	}
	
	public Maker selectMaker(SqlSessionTemplate sqlSession, String pno) {
		
		return sqlSession.selectOne("projectMapper.selectMaker", pno);
	}
	
	public FundingList selectFunding(SqlSessionTemplate sqlSession, String pno) {
		
		return sqlSession.selectOne("projectMapper.selectFunding", pno);
	}
	
	public ArrayList<News> selectNews(SqlSessionTemplate sqlSession, String pno) {
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectNews", pno);
	}
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, String pno){
		
		return (ArrayList)sqlSession.selectList("projectMapper.selectReplyList", pno);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.insert("projectMapper.insertReply", r);
	}
	
}
