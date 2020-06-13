package com.catchmind.catchfun.admin.model.service;

import java.sql.Date;
import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchmind.catchfun.admin.model.dao.AdminDao2;
import com.catchmind.catchfun.admin.model.vo.Member;
import com.catchmind.catchfun.admin.model.vo.Project;
import com.catchmind.catchfun.admin.model.vo.Reply;
import com.catchmind.catchfun.common.model.vo.PageInfo;
import com.catchmind.catchfun.funding.model.vo.FundingList;
import com.catchmind.catchfun.funding.model.vo.Maker;
import com.catchmind.catchfun.funding.model.vo.News;
import com.catchmind.catchfun.funding.model.vo.Reward;

@Service("aService2")
public class AdminServiceImpl2 implements AdminService2 {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDao2 aDao2;
	
	@Override
	public int memberListCount() {
		return aDao2.memberListCount(sqlSession);
	}
	@Override
	public ArrayList<Member> memberList(PageInfo pi) {
		return aDao2.memberList(sqlSession, pi);
	}
	@Override
	public int blackListCount() {
		return aDao2.blackListCount(sqlSession);
	}
	@Override
	public ArrayList<Member> blackList(PageInfo pi) {
		return aDao2.blackList(sqlSession, pi);
	}
	@Override
	public int memberSearchCount(String keyword) {
		return aDao2.memberSearchCount(sqlSession, keyword);
	}
	@Override
	public ArrayList<Member> memberSearch(PageInfo pi, String keyword) {
		return aDao2.memberSearch(sqlSession, pi, keyword);
	}
	@Override
	public int blackSearchCount(String keyword) {
		return aDao2.blackSearchCount(sqlSession, keyword);
	}
	@Override
	public ArrayList<Member> blackSearch(PageInfo pi, String keyword) {
		return aDao2.blackSearch(sqlSession, pi, keyword);
	}
	@Override
	public int memberSelect(Member m) {
		return aDao2.memberSelect(sqlSession,m);
	}
	@Override
	public int blackUpdate(Member m) {
		return aDao2.blackUpdate(sqlSession, m);
	}
	@Override
	public int reportListCount() {
		return aDao2.reportListCount(sqlSession);
	}
	@Override
	public ArrayList<Reply> reportList(PageInfo pi) {
		return aDao2.reportList(sqlSession, pi);
	}
	@Override
	public int reportSearchCount(String keyword) {
		return aDao2.reportSearchCount(sqlSession, keyword);
	}
	@Override
	public ArrayList<Reply> reportSearch(PageInfo pi, String keyword) {
		return aDao2.reportSearch(sqlSession, pi, keyword);
	}
	@Override
	public int proReportListCount() {
		return aDao2.proReportListCount(sqlSession);
	}
	@Override
	public ArrayList<Project> proReportList(PageInfo pi) {
		return aDao2.proReportList(sqlSession, pi);
	}
	@Override
	public int proReportSearchCount(String keyword) {
		return aDao2.proReportSearchCount(sqlSession,keyword);
	}
	@Override
	public ArrayList<Project> proReportSearch(PageInfo pi, String keyword) {
		return aDao2.proReportSearch(sqlSession, pi, keyword);
	}
	@Override
	public Reply rpReportDetail(String rd) {
		return aDao2.rpReportDetail(sqlSession, rd);
	}
	@Override
	public int reportBlack(String userNo) {
		return aDao2.reportBlack(sqlSession, userNo);
	}
	@Override
	public Project pjReportDetail(String rd) {
		return aDao2.pjReportDetail(sqlSession, rd);
	}
	@Override
	public int pjDelete(String projectNumber) {
		return aDao2.pjDelete(sqlSession, projectNumber);
	}
	@Override
	public int projectListCount() {
		return aDao2.projectListCount(sqlSession);
	}
	@Override
	public ArrayList<Project> projectList(PageInfo pi) {
		return aDao2.projectList(sqlSession, pi);
	}
	@Override
	public int projectSearchCount(String proCategory) {
		return aDao2.projectSearchCount(sqlSession, proCategory);
	}
	@Override
	public ArrayList<Project> projectSearch(PageInfo pi, String proCategory) {
		return aDao2.projectSearch(sqlSession, pi, proCategory);
	}
	@Override
	public Project selectProject(String pno) {
		return aDao2.selectProject(sqlSession, pno);
	}
	@Override
	public Maker selectMaker(String pno) {
		return aDao2.selectMaker(sqlSession, pno);
	}
	@Override
	public FundingList selectFunding(String pno) {
		return aDao2.selectFunding(sqlSession, pno);
	}
	@Override
	public ArrayList<News> selectNews(String pno) {
		return aDao2.selectNews(sqlSession, pno);
	}
	@Override
	public ArrayList<Reward> selectReward(String pno) {
		return aDao2.selectReward(sqlSession, pno);
	}
	@Override
	public int updateProject(String pno) {
		return aDao2.updateProject(sqlSession, pno);
	}
	@Override
	public int updateMaker(String pno) {
		return aDao2.updateMaker(sqlSession, pno);
	}
	@Override
	public int updateFunding(String pno) {
		return aDao2.updateFunding(sqlSession, pno);
	}
	@Override
	public int updateReward(String pno) {
		return aDao2.updateReward(sqlSession, pno);
	}
	@Override
	public int updateNews(String pno) {
		return aDao2.updateNews(sqlSession, pno);
	}
	@Override
	public int sales1(Date sDate) {
		return aDao2.sales1(sqlSession, sDate);
	}
	@Override
	public int sales2(Date sDate) {
		return aDao2.sales2(sqlSession, sDate);
	}
	@Override
	public int sales3(Date sDate) {
		return aDao2.sales3(sqlSession, sDate);
	}
	@Override
	public int sales4(Date sDate) {
		return aDao2.sales4(sqlSession, sDate);
	}
	@Override
	public int sales5(Date sDate) {
		return aDao2.sales5(sqlSession, sDate);
	}

	/*
	@Override
	public int selectListCount() {
		return bDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Board> selectList(PageInfo pi) {
		return bDao.selectList(sqlSession, pi);
	}

	@Override
	public int insertBoard(Board b) {
		return bDao.insertBoard(sqlSession, b);
	}

	@Override
	public int increaseCount(int bno) {
		return bDao.increaseCount(sqlSession, bno);
	}

	@Override
	public Board selectBoard(int bno) {
		return bDao.selectBoard(sqlSession, bno);
	}

	@Override
	public int deleteBoard(int bno) {
		return bDao.deleteBoard(sqlSession, bno);
	}

	@Override
	public int updateBoard(Board b) {
		return bDao.updateBoard(sqlSession, b);
	}

	@Override
	public ArrayList<Reply> selectReplyList(int bno) {
		return bDao.selectReplyList(sqlSession, bno);
	}

	@Override
	public int insertReply(Reply r) {
		return bDao.insertReply(sqlSession, r);
	}
	*/
	
	// 여기부터 Admin 시작 (위에 참고용)

	
	/*
	 * // 주혁시작
	 * 
	 * @Override public int selectListCount() { return
	 * aDao.selectListCount(sqlSession); }
	 * 
	 * @Override public ArrayList<Notice> selectList(PageInfo pi) { return
	 * aDao.selectList(sqlSession, pi); }
	 * 
	 * @Override public Notice noticeDetail(String nno) { return
	 * aDao.noticeDetail(sqlSession, nno); }
	 * 
	 * @Override public int insertNotice(Notice n) { return
	 * aDao.insertNotice(sqlSession, n); }
	 * 
	 * @Override public int noticeDelete(String nno) { return
	 * aDao.noticeDelete(sqlSession, nno); }
	 * 
	 * @Override public int noticeUpdatInsert(Notice n) { return
	 * aDao.noticeUpdatInsert(sqlSession, n); }
	 * 
	 * // 주혁 끝
	 */
	
}





