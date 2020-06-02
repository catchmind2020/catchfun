package com.catchmind.catchfun.admin.model.service;

import java.util.ArrayList;

import com.catchmind.catchfun.admin.model.vo.Notice;
import com.catchmind.catchfun.admin.model.vo.Question;
import com.catchmind.catchfun.common.model.vo.PageInfo;

public interface AdminService {
	
	/*
	// 1. 게시판 리스트 조회용 서비스
	// 1_1. 게시판 총갯수 조회용 서비스
	int selectListCount();
	// 1_2. 요청한 페이지에 보여질 게시글 리스트 조회용 서비스
	ArrayList<Board> selectList(PageInfo pi);
	
	// 2. 게시판 작성용 서비스
	int insertBoard(Board b);
	
	// 3. 게시판 상세조회용 서비스
	// 3_1. 해당 게시글 조회수 증가용 서비스
	int increaseCount(int bno);
	// 3_2. 해당 게시글 조회용 서비스
	Board selectBoard(int bno);
	
	// 4. 게시글 삭제용 서비스
	int deleteBoard(int bno);
	
	// 5. 게시글 수정용 서비스
	int updateBoard(Board b);
	
	
	// ----- ajax 후 ----
	// 6. 해당 게시글에 딸려있는 댓글 리스트 조회용 서비스
	ArrayList<Reply> selectReplyList(int bno);
	
	// 7. 댓글 작성용 서비스
	int insertReply(Reply r);
	*/
	
	// 여기부터 Admin 시작 (위에 참고용)
	
	// 주혁시작
	
	// 1. 게시판 리스트 조회용 서비스
	// 1_1. 공지게시판 총갯수 조회용 서비스
	int selectListCount();
	// 1_2. 요청한 페이지에 보여질 게시글 리스트 조회용 서비스
	ArrayList<Notice> selectList(PageInfo pi);
	
	// 1_3. 공지 수정하기 버튼 디테일
	Notice noticeDetail(String nno);
	
	// 1_4. 공지 등록
	int insertNotice(Notice n);
	
	// 1_5. 공지 삭제
	int noticeDelete(String nno); 
	
	// 1_6. 공지 업데이트
	int noticeUpdatInsert(Notice n);
	
	// 2. Question
	
	// 1_1. 질문게시판 총갯수 조회용 서비스
	int questionSelectListCount();
	// 1_2. 요청한 페이지에 보여질 게시글 리스트 조회용 서비스
	ArrayList<Question> questionSelectList(PageInfo pi);
	
	// 주혁 끝
	
}







