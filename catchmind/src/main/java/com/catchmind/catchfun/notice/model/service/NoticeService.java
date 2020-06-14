package com.catchmind.catchfun.notice.model.service;

import java.util.ArrayList;

import com.catchmind.catchfun.common.model.vo.PageInfo;
import com.catchmind.catchfun.notice.model.vo.CatchfunQuestion;
import com.catchmind.catchfun.notice.model.vo.Notice;

public interface NoticeService {
	
	/********************************************************************************
	 * 									Notice
	 ********************************************************************************/
	 
	// 공지사항 글 총갯수 조회용 서비스
	int selectListCount();
	
	// 공지 리스트 조회용 서비스
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 해당 공지글 조회수 증가용 서비스
	int increaseCount(String nno);
	
	// 해당 공지글 조회용 서비스
	Notice selectNotice(String nno);
	
	
	/********************************************************************************
	 * 								CatchfunQuestion
	 ********************************************************************************/

	
	// 1:1문의 글 총개수 알아오기
	int cqselectListCount(String userNo);	
	
	// 1:1문의  리스트 조회
	ArrayList<CatchfunQuestion> cqselectList(PageInfo pi, String userNo);
	
	// 1:1문의  글 상세조회
	CatchfunQuestion selectCatchfunQu(String qno);
	
	// 1:1문의  글 등록
	int insertCatchfunQuestion(CatchfunQuestion q, String userNo);
	
	// 1:1문의  글 삭제
	int deleteCatchfunQuestion(String qno);

}
