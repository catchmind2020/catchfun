package com.catchmind.catchfun.funding.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchmind.catchfun.funding.model.dao.FundingDao;
import com.catchmind.catchfun.funding.model.vo.FundingList;
import com.catchmind.catchfun.funding.model.vo.Maker;
import com.catchmind.catchfun.funding.model.vo.MyFunding;
import com.catchmind.catchfun.funding.model.vo.News;
import com.catchmind.catchfun.funding.model.vo.PersonQuestion;
import com.catchmind.catchfun.funding.model.vo.Project;
import com.catchmind.catchfun.funding.model.vo.Reply;
import com.catchmind.catchfun.funding.model.vo.Report;
import com.catchmind.catchfun.funding.model.vo.Reward;
import com.catchmind.catchfun.funding.model.vo.Wishlist;

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
	public ArrayList<Reward> selectReward(String pno) {
		
		return fDao.selectReward(sqlSession, pno);
	}
	
	@Override
	public ArrayList<Reply> selectReplyList(String pno) {

		return fDao.selectReplyList(sqlSession, pno);
	}

	@Override
	public int insertReply(Reply r) {

		return fDao.insertReply(sqlSession, r);
	}

	@Override
	public int increasebanReply(String replyNo) {
		
		return fDao.increasebanReply(sqlSession, replyNo);
	}

	@Override
	public int deleteReply(String replyNo) {
		
		return fDao.deleteReply(sqlSession, replyNo);
	}

	@Override
	public int insertQuestion(PersonQuestion pq) {
		
		return fDao.insertQuestion(sqlSession, pq);
	}

	@Override
	public int insertReport(Report r) {

		return fDao.insertReport(sqlSession, r);
	}
	
	@Override
	public int selectReport(Report r) {
		
		return fDao.selectReport(sqlSession, r);
	}
	
	@Override
	public int increasebanReport(Report r) {

		return fDao.increasebanReport(sqlSession, r);
	}


	@Override
	public int insertWishlist(Wishlist w) {
		
		return fDao.insertWishlist(sqlSession, w);
	}

	@Override
	public int selectWish(Wishlist w) {
		
		return fDao.selectWish(sqlSession, w);
	}

	
	// 주혁
	@Override
	public int selectWishlistCount(Wishlist w) {
		return fDao.selectWishlistCount(sqlSession, w);
	}

	@Override
	public int addWishlist(Wishlist w) {
		return fDao.addWishlist(sqlSession, w);
	}

	@Override
	public int deleteWishlist(Wishlist w) {
		
		return fDao.deleteWishlist(sqlSession, w);
	}

	@Override
	public int insertFundingList(FundingList f) {

		return fDao.insertFundingList(sqlSession, f);
	}

	@Override
	public int updatePoint(FundingList f) {

		return fDao.updatePoint(sqlSession, f);
	}

	@Override
	public int updateItemQuantity(FundingList f) {

		return fDao.updateItemQuantity(sqlSession, f);
	}

	@Override
	public ArrayList<FundingList> selectConfirmFunding(FundingList f) {

		return fDao.selectConfirmFunding(sqlSession, f);
	}

	@Override
	public int updateRewardQuantity(FundingList f) {

		return fDao.updateRewardQuantity(sqlSession, f);
	}

	@Override
	public int requestCancel(String fNo) {

		return fDao.requestCancel(sqlSession, fNo);
	}

	@Override
	public int selectBanReply(Report r) {

		return fDao.selectBanReply(sqlSession, r);
	}

	@Override
	public int insertbanReply(Report r) {

		return fDao.insertbanReply(sqlSession, r);
	}

	@Override
	public ArrayList<MyFunding> selectBookingList(String userNo) {
		
		return fDao.selectBookingList(sqlSession, userNo);
	}





	
	
	


}
