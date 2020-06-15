package com.catchmind.catchfun.funding.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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
import com.catchmind.catchfun.member.model.vo.MyWish;

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
	
	public ArrayList<Reward> selectReward(SqlSessionTemplate sqlSession, String pno) {
		
		ArrayList<Reward> list = (ArrayList)sqlSession.selectList("projectMapper.selectReward", pno);
		
		ArrayList<Reward> list2 = (ArrayList)sqlSession.selectList("projectMapper.selectReward2", pno);
		
		for(int i=0; i<list2.size(); i++) {
			
			list.get(i).setRewardFundingCount(list2.get(i).getRewardFundingCount());
		}
		
		//System.out.println(list);
		
		return list;
	}
	
	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, String pno){
		
		ArrayList<Reply> list = (ArrayList)sqlSession.selectList("projectMapper.selectReplyList", pno);
		return list;

	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		
		return sqlSession.insert("projectMapper.insertReply", r);
	}
	
	public int increasebanReply(SqlSessionTemplate sqlSession, String replyNo) {
		
		return sqlSession.update("projectMapper.increasebanReply", replyNo);
	}
	
	public int insertQuestion(SqlSessionTemplate sqlSession, PersonQuestion pq) {
		
		return sqlSession.insert("projectMapper.insertQuestion", pq);
	}
	
	public int insertReport(SqlSessionTemplate sqlSession, Report r) {
		
		return sqlSession.insert("projectMapper.insertReport", r);
	}
	
	public int selectReport(SqlSessionTemplate sqlSession, Report r) {
		
		return sqlSession.selectOne("projectMapper.selectReport", r);
	}
	
	public int increasebanReport(SqlSessionTemplate sqlSession, Report r) {
		
		return sqlSession.update("projectMapper.increasebanReport", r);
	}
	
	public int deleteReply(SqlSessionTemplate sqlSession, String replyNo) {
		
		return sqlSession.update("projectMapper.deleteReply", replyNo);
	}
	
	public int insertWishlist(SqlSessionTemplate sqlSession, Wishlist w) {
		
		return sqlSession.insert("projectMapper.insertWishlist", w);
	}
	
	public int selectWish(SqlSessionTemplate sqlSession, Wishlist w) {
		
		return sqlSession.selectOne("projectMapper.selectWishlistCount", w);
	}
	
	// 주혁
	public int selectWishlistCount(SqlSessionTemplate sqlSession, Wishlist w) {
		
		return sqlSession.selectOne("projectMapper.selectWishlistCount", w);
		
	}
	
	public int addWishlist(SqlSessionTemplate sqlSession, Wishlist w) {
		
		return sqlSession.insert("projectMapper.addWishlist", w);
	}
	
	public int deleteWishlist(SqlSessionTemplate sqlSession, Wishlist w) {

		return sqlSession.delete("projectMapper.deleteWishlist", w);
	}
	
	public int insertFundingList(SqlSessionTemplate sqlSession, FundingList f) {
		
		return sqlSession.insert("projectMapper.insertFundingList", f);
	}

	public int updatePoint(SqlSessionTemplate sqlSession, FundingList f) {
		
		return sqlSession.update("projectMapper.updatePoint", f);
	}
	
	public int updateItemQuantity(SqlSessionTemplate sqlSession, FundingList f) {
		
		return sqlSession.update("projectMapper.updateItemQuantity", f);
	}
	
	public ArrayList<FundingList> selectConfirmFunding(SqlSessionTemplate sqlSession, FundingList f){
		
		ArrayList<FundingList> list = (ArrayList)sqlSession.selectList("projectMapper.selectConfirmFunding", f);
		return list;

	}
	
	public int updateRewardQuantity(SqlSessionTemplate sqlSession, FundingList f) {
		
		return sqlSession.update("projectMapper.updateRewardQuantity", f);
	}
	
	public int requestCancel(SqlSessionTemplate sqlSession, String fNo) {
		
		return sqlSession.update("projectMapper.requestCancel", fNo);
	}
	
	public int insertbanReply(SqlSessionTemplate sqlSession, Report r) {
		
		return sqlSession.insert("projectMapper.insertbanReply", r);
	}
	
	public int selectBanReply(SqlSessionTemplate sqlSession, Report r) {
		
		return sqlSession.selectOne("projectMapper.selectBanReply", r);
	}
	
	public ArrayList<MyFunding> selectBookingList(SqlSessionTemplate sqlSession, String userNo) {
		
		ArrayList<MyFunding> list = (ArrayList)sqlSession.selectList("projectMapper.selectBookingList", userNo);
		return list;
	}
	
	public ArrayList<MyWish> myWishList(SqlSessionTemplate sqlSession, String userNo) {
		return (ArrayList)sqlSession.selectList("memberMapper.myWishList", userNo);
	}
	
}
