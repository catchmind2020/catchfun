package com.catchmind.catchfun.funding.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.catchmind.catchfun.funding.model.vo.FundingList;
import com.catchmind.catchfun.funding.model.vo.Maker;
import com.catchmind.catchfun.funding.model.vo.News;
import com.catchmind.catchfun.funding.model.vo.PersonQuestion;
import com.catchmind.catchfun.funding.model.vo.Project;
import com.catchmind.catchfun.funding.model.vo.Reply;
import com.catchmind.catchfun.funding.model.vo.Report;
import com.catchmind.catchfun.funding.model.vo.Reward;
import com.catchmind.catchfun.funding.model.vo.Wishlist;

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
		//System.out.println("dkd");
		//System.out.println(w);
		return sqlSession.delete("projectMapper.deleteWishlist", w);
	}
	
	

	
}
