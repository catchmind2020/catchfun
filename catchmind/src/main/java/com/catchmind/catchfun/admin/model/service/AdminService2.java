package com.catchmind.catchfun.admin.model.service;

import java.util.ArrayList;

import com.catchmind.catchfun.admin.model.vo.Member;
import com.catchmind.catchfun.admin.model.vo.Project;
import com.catchmind.catchfun.admin.model.vo.ProjectDetail;
import com.catchmind.catchfun.admin.model.vo.ProjectReturn;
import com.catchmind.catchfun.admin.model.vo.Reply;
import com.catchmind.catchfun.common.model.vo.PageInfo;
import com.catchmind.catchfun.funding.model.vo.FundingList;
import com.catchmind.catchfun.funding.model.vo.Maker;
import com.catchmind.catchfun.funding.model.vo.News;
import com.catchmind.catchfun.funding.model.vo.Reward;

/**
 * @author 도현
 *
 */
public interface AdminService2 {
	
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
	/*
	 * int selectListCount(); // 1_2. 요청한 페이지에 보여질 게시글 리스트 조회용 서비스 ArrayList<Notice>
	 * selectList(PageInfo pi);
	 * 
	 * // 1_3. 공지 수정하기 버튼 디테일 Notice noticeDetail(String nno);
	 * 
	 * // 1_4. 공지 등록 int insertNotice(Notice n);
	 * 
	 * // 1_5. 공지 삭제 int noticeDelete(String nno);
	 * 
	 * // 1_6. 공지 업데이트 int noticeUpdatInsert(Notice n); // 주혁 끝
	 */	
	
	int memberListCount();
	
	ArrayList<Member> memberList(PageInfo pi);
	
	int blackListCount();
	
	ArrayList<Member> blackList(PageInfo pi);
	
	int memberSearchCount(String keyword);
	
	ArrayList<Member> memberSearch(PageInfo pi, String keyword);
	
	int blackSearchCount(String keyword);
	
	ArrayList<Member> blackSearch(PageInfo pi, String keyword);
	
	int memberSelect(Member m);
	
	int blackUpdate(Member m);
	
	int reportListCount();
	
	ArrayList<Reply> reportList(PageInfo pi);
	
	int reportSearchCount(String keyword);
	
	ArrayList<Reply> reportSearch(PageInfo pi, String keyword);
	
	int proReportListCount();
	
	ArrayList<Project> proReportList(PageInfo pi);
	
	int proReportSearchCount(String keyword);
	
	ArrayList<Project> proReportSearch(PageInfo pi, String keyword);
	
	Reply rpReportDetail(String rd);
	
	int reportBlack(String userNo);
	
	Project pjReportDetail(String rd);
	
	int pjDelete(String projectNumber);
	
	int projectListCount();
	
	ArrayList<Project> projectList(PageInfo pi);
	
	int projectSearchCount(String proCategory);
	
	ArrayList<Project> projectSearch(PageInfo pi, String proCategory);

	// 프로젝트 정보 조회
	ProjectDetail selectProject(String pno);
	
	// 메이커 정보 조회
	Maker selectMaker(String pno);
	
	// 펀딩 내역 정보 조회 (현재 펀딩금액, 수량 파악)
	FundingList selectFunding(String pno);
	
	// 새소식 리스트 조회
	ArrayList<News> selectNews(String pno);
	
	// 리워드 리스트 조회
	ArrayList<Reward> selectReward(String pno);
	
	int updateProject(String pno); // 프로젝트 정보
	int updateMaker(String pno); // 메이커 정보
	int updateFunding(String pno); // 펀딩 내역 정보 (현재 펀딩금액, 수량 파악)
	int updateReward(String pno); // 리워드 정보
	int updateNews(String pno); // 새소식 정보
	
	int sales1(String sDate);
	int sales2(String sDate);
	int sales3(String sDate);
	int sales4(String sDate);
	int sales5(String sDate);
	
	int sales6();
	int sales7();
	int sales8();
	int sales9();
	int sales10();
	
	int returnProject(String pno); // 프로젝트 정보
	int returnMaker(String pno); // 메이커 정보
	int returnFunding(String pno); // 펀딩 내역 정보 (현재 펀딩금액, 수량 파악)
	int returnReward(String pno); // 리워드 정보
	int returnNews(String pno); // 새소식 정보
	
	int insertReturn(ProjectReturn p);
	
	
}







