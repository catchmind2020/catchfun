package com.catchmind.catchfun.funding.model.service;

import java.util.ArrayList;

import com.catchmind.catchfun.funding.model.vo.FundingList;
import com.catchmind.catchfun.funding.model.vo.Maker;
import com.catchmind.catchfun.funding.model.vo.News;
import com.catchmind.catchfun.funding.model.vo.Project;
import com.catchmind.catchfun.funding.model.vo.Reply;

public interface FundingService {
	
	Project selectProject(String pno);
	
	Maker selectMaker(String pno);
	
	FundingList selectFunding(String pno);
	
	ArrayList<News> selectNews(String pno);
	
	// 6. 해당 게시글에 딸려있는 댓글 리스트 조회용 서비스
	ArrayList<Reply> selectReplyList(String pno);
	
	// 7. 댓글 작성용 서비스
	int insertReply(Reply r);
}
