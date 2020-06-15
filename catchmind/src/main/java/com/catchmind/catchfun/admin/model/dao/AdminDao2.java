package com.catchmind.catchfun.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

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

@Repository("aDao2")
public class AdminDao2 {
	
	/*
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("boardMapper.selectListCount");
	}
	
	public ArrayList<Board> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("boardMapper.selectList", null, rowBounds);
		
	}
	
	public int insertBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.insert("boardMapper.insertBoard", b);
	}
	
	public int increaseCount(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("boardMapper.increaseCount", bno);
	}
	
	public Board selectBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.selectOne("boardMapper.selectBoard", bno);
	}
	
	public int deleteBoard(SqlSessionTemplate sqlSession, int bno) {
		return sqlSession.update("boardMapper.deleteBoard", bno);
	}
	
	public int updateBoard(SqlSessionTemplate sqlSession, Board b) {
		return sqlSession.update("boardMapper.updateBoard", b);
	}

	public ArrayList<Reply> selectReplyList(SqlSessionTemplate sqlSession, int bno){
		return (ArrayList)sqlSession.selectList("boardMapper.selectReplyList", bno);
	}
	
	public int insertReply(SqlSessionTemplate sqlSession, Reply r) {
		return sqlSession.insert("boardMapper.insertReply", r);
	}
	*/
	
	// 여기부터 Admin 시작 (위에 참고용)
	/*
	 * // 주혁시작
	 * 
	 * public int selectListCount(SqlSessionTemplate sqlSession) { return
	 * sqlSession.selectOne("adminMapper.selectListCount"); }
	 * 
	 * public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo
	 * pi){
	 * 
	 * int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
	 * 
	 * RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
	 * 
	 * return (ArrayList)sqlSession.selectList("adminMapper.selectList", null,
	 * rowBounds);
	 * 
	 * }
	 * 
	 * public Notice noticeDetail(SqlSessionTemplate sqlSession, String nno){ return
	 * sqlSession.selectOne("adminMapper.noticeDetail", nno); }
	 * 
	 * public int insertNotice(SqlSessionTemplate sqlSession, Notice n) { return
	 * sqlSession.insert("adminMapper.insertNotice", n); }
	 * 
	 * public int noticeDelete(SqlSessionTemplate sqlSession, String nno) { return
	 * sqlSession.update("adminMapper.noticeDelete", nno); }
	 * 
	 * public int noticeUpdatInsert(SqlSessionTemplate sqlSession, Notice n) {
	 * return sqlSession.update("adminMapper.noticeUpdatInsert", n); } // 주혁 끝
	 */
	public int memberListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper2.memberListCount");
	}
	
	public ArrayList<Member> memberList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper2.memberList", null, rowBounds);
	}
	
	public int blackListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper2.blackListCount");
	}
	
	public ArrayList<Member> blackList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper2.blackList", null, rowBounds);
	}
	
	public int memberSearchCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("adminMapper2.memberSearchCount",keyword);
	}
	
	public ArrayList<Member> memberSearch(SqlSessionTemplate sqlSession, PageInfo pi, String keyword){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper2.memberSearch", keyword, rowBounds);
	}
	
	public int blackSearchCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("adminMapper2.blackSearchCount", keyword);
	}
	
	public ArrayList<Member> blackSearch(SqlSessionTemplate sqlSession, PageInfo pi, String keyword){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper2.blackSearch", keyword, rowBounds);
	}
	
	public int memberSelect(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("adminMapper2.memberSelect",m);
	}
	
	public int blackUpdate(SqlSessionTemplate sqlSession, Member m) {
		return sqlSession.update("adminMapper2.blackUpdate", m);
	}
	
	
	public int reportListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper2.reportListCount");
	}
	
	public ArrayList<Reply> reportList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper2.reportList", null, rowBounds);
	}
	
	public int reportSearchCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("adminMapper2.reportSearchCount",keyword);
	}
	
	public ArrayList<Reply> reportSearch(SqlSessionTemplate sqlSession, PageInfo pi, String keyword){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper2.reportSearch", keyword, rowBounds);
	}
	
	public int proReportListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper2.proReportListCount");
	}
	
	public ArrayList<Project> proReportList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper2.proReportList", null, rowBounds);
	}
	
	public int proReportSearchCount(SqlSessionTemplate sqlSession, String keyword) {
		return sqlSession.selectOne("adminMapper2.proReportSearchCount",keyword);
	}
	
	public ArrayList<Project> proReportSearch(SqlSessionTemplate sqlSession, PageInfo pi, String keyword){
		
		int offset = (pi.getCurrentPage() -1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper2.proReportSearch", keyword, rowBounds);
	}
	
	public Reply rpReportDetail(SqlSessionTemplate sqlSession, String rd) {
		return sqlSession.selectOne("adminMapper2.rpReportDetail", rd);
	}

	public int reportBlack(SqlSessionTemplate sqlSession, String userNo) {
		return sqlSession.update("adminMapper2.reportBlack", userNo);
	}
	
	public Project pjReportDetail(SqlSessionTemplate sqlSession, String rd) {
		return sqlSession.selectOne("adminMapper2.pjReportDetail", rd);
	}
	
	public int pjDelete(SqlSessionTemplate sqlSession, String projectNumber) {
		return sqlSession.update("adminMapper2.pjDelete", projectNumber);
	}
	
	public int projectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper2.projectListCount");
	}
	
	public ArrayList<Project> projectList(SqlSessionTemplate sqlSession, PageInfo pi) {
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper2.projectList", null, rowBounds);
	}
	
	public int projectSearchCount(SqlSessionTemplate sqlSession, String proCategory) {
		return sqlSession.selectOne("adminMapper2.projectSearchCount", proCategory);
	}
	
	public ArrayList<Project> projectSearch(SqlSessionTemplate sqlSession, PageInfo pi, String proCategory){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper2.projectSearch", proCategory, rowBounds);
	}
	
	public ProjectDetail selectProject(SqlSessionTemplate sqlSession, String pno) {
		
		return sqlSession.selectOne("adminMapper2.selectProject", pno);
	}
	
	public Maker selectMaker(SqlSessionTemplate sqlSession, String pno) {
		
		return sqlSession.selectOne("adminMapper2.selectMaker", pno);
	}
	
	public FundingList selectFunding(SqlSessionTemplate sqlSession, String pno) {
		
		return sqlSession.selectOne("adminMapper2.selectFunding", pno);
	}
	
	public ArrayList<News> selectNews(SqlSessionTemplate sqlSession, String pno) {
		
		return (ArrayList)sqlSession.selectList("adminMapper2.selectNews", pno);
	}
	
	public ArrayList<Reward> selectReward(SqlSessionTemplate sqlSession, String pno) {
		
		ArrayList<Reward> list = (ArrayList)sqlSession.selectList("adminMapper2.selectReward", pno);
		
		ArrayList<Reward> list2 = (ArrayList)sqlSession.selectList("adminMapper2.selectReward2", pno);
		
		for(int i=0; i<list2.size(); i++) {
			
			list.get(i).setRewardFundingCount(list2.get(i).getRewardFundingCount());
		}
		
		//System.out.println(list);
		
		return list;
	}
	
	public int updateProject(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.update("adminMapper2.updateProject", pno);
	}
	
	public int updateMaker(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.update("adminMapper2.updateMaker", pno);
	}
	
	public int updateFunding(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.update("adminMapper2.updateFunding", pno);
	}
	
	public int updateReward(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.update("adminMapper2.updateReward", pno);
	}
	
	public int updateNews(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.update("adminMapper2.updateNews", pno);
	}
	
	public int updateMember(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.update("adminMapper2.updateMember", pno);
	}
	
	public int sales1(SqlSessionTemplate sqlSession, String sDate) {
		return sqlSession.selectOne("adminMapper2.sales1", sDate);
	
	}
	
	public int sales2(SqlSessionTemplate sqlSession, String sDate) {
		return sqlSession.selectOne("adminMapper2.sales2", sDate);
	}
	
	public int sales3(SqlSessionTemplate sqlSession, String sDate) {
		return sqlSession.selectOne("adminMapper2.sales3", sDate);
	}
	
	public int sales4(SqlSessionTemplate sqlSession, String sDate) {
		return sqlSession.selectOne("adminMapper2.sales4", sDate);
	}
	
	public int sales5(SqlSessionTemplate sqlSession, String sDate) {
		return sqlSession.selectOne("adminMapper2.sales5", sDate);
	}
	
	public int sales6(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper2.sales6");
	}
	public int sales7(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper2.sales7");
	}
	public int sales8(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper2.sales8");
	}
	public int sales9(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper2.sales9");
	}
	public int sales10(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper2.sales10");
	}
	
	public int returnProject(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.update("adminMapper2.returnProject", pno);
	}
	
	public int returnMaker(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.update("adminMapper2.returnMaker", pno);
	}
	
	public int returnFunding(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.update("adminMapper2.returnFunding", pno);
	}
	
	public int returnReward(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.update("adminMapper2.returnReward", pno);
	}
	
	public int returnNews(SqlSessionTemplate sqlSession, String pno) {
		return sqlSession.update("adminMapper2.returnNews", pno);
	}
	
	public int insertReturn(SqlSessionTemplate sqlSession, ProjectReturn p) {
		return sqlSession.insert("adminMapper2.insertReturn", p);
	}
	
}













