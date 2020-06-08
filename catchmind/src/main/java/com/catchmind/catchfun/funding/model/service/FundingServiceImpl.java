package com.catchmind.catchfun.funding.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchmind.catchfun.funding.model.dao.FundingDao;
import com.catchmind.catchfun.funding.model.vo.FundingList;
import com.catchmind.catchfun.funding.model.vo.Maker;
import com.catchmind.catchfun.funding.model.vo.News;
import com.catchmind.catchfun.funding.model.vo.Project;
import com.catchmind.catchfun.funding.model.vo.Reply;

@Service("fService")
public class FundingServiceImpl implements FundingService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private FundingDao fDao; 
	

	@Override
	public Project selectProject(String pno) {

		return fDao.selectProject(sqlSession, pno);
	}

	@Override
	public Maker selectMaker(String pno) {

		return fDao.selectMaker(sqlSession, pno);
	}

	@Override
	public FundingList selectFunding(String pno) {
		
		return fDao.selectFunding(sqlSession, pno);
	}

	@Override
	public ArrayList<News> selectNews(String pno) {
		
		return fDao.selectNews(sqlSession, pno);
	}

	@Override
	public ArrayList<Reply> selectReplyList(String pno) {

		return fDao.selectReplyList(sqlSession, pno);
	}

	@Override
	public int insertReply(Reply r) {

		return fDao.insertReply(sqlSession, r);
	}
	

}
