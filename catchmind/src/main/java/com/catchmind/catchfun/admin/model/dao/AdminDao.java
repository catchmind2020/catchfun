package com.catchmind.catchfun.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.catchmind.catchfun.admin.model.vo.Category;
import com.catchmind.catchfun.admin.model.vo.Notice;
import com.catchmind.catchfun.admin.model.vo.PayTotal;
import com.catchmind.catchfun.admin.model.vo.Question;
import com.catchmind.catchfun.common.model.vo.PageInfo;

@Repository("aDao")
public class AdminDao {
	
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
	
	// 주혁시작
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.selectListCount");
	}
	
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.selectList", null, rowBounds);
		
	}
	
	public Notice noticeDetail(SqlSessionTemplate sqlSession, String nno){
		return sqlSession.selectOne("adminMapper.noticeDetail", nno);
	}
	
	public int insertNotice(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.insert("adminMapper.insertNotice", n);
	}
	
	public int noticeDelete(SqlSessionTemplate sqlSession, String nno) {
		return sqlSession.update("adminMapper.noticeDelete", nno);
	}
	
	public int noticeUpdatInsert(SqlSessionTemplate sqlSession, Notice n) {
		return sqlSession.update("adminMapper.noticeUpdatInsert", n);
	}
	
	// Question
	
	public int questionSelectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.questionSelectListCount");
	}
	
	public ArrayList<Question> questionSelectList(SqlSessionTemplate sqlSession, PageInfo pi){
		
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		
		return (ArrayList)sqlSession.selectList("adminMapper.questionSelectList", null, rowBounds);
		
	}
	
	public Question qnaDetail(SqlSessionTemplate sqlSession, String qno){
		return sqlSession.selectOne("adminMapper.qnaDetail", qno);
	}
	
	public int qnaAnsUpdate(SqlSessionTemplate sqlSession, Question q) {
		return sqlSession.update("adminMapper.qnaAnsUpdate", q);
	}
	
	public int qnaDelete(SqlSessionTemplate sqlSession, String qno) {
		return sqlSession.update("adminMapper.qnaDelete", qno);
	}
	
	// 3. Category
	// 등록
	public int insertCategory(SqlSessionTemplate sqlSession, Category c) {
		return sqlSession.insert("adminMapper.insertCategory", c);
	}
	
	public int insertAttachment(SqlSessionTemplate sqlSession, Category c) {
		return sqlSession.insert("adminMapper.insertAttachment", c);
	}
	
	public String refNoCategory(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("adminMapper.refNoCategory");
	}
	
	// 디테일
	public Category categoryDetail(SqlSessionTemplate sqlSession, String cno){
		return sqlSession.selectOne("adminMapper.categoryDetail", cno);
	}
	
	// 수정
	public int updateCategory(SqlSessionTemplate sqlSession, Category c) {
		return sqlSession.update("adminMapper.updateCatrgory", c);
	}
	public int updateCategory2(SqlSessionTemplate sqlSession, Category c) {
		return sqlSession.update("adminMapper.updateCatrgory2", c);
	}
	
	// 삭제
	public int deleteCategory(SqlSessionTemplate sqlSession, String cno) {
		return sqlSession.update("adminMapper.deleteCatrgory", cno);
	}
	
	public String deleteCategoryFile(SqlSessionTemplate sqlSession, String cno) {
		return sqlSession.selectOne("adminMapper.deleteCategoryFile", cno);
	}
	
	// 리스트조회
	public ArrayList<Category> categoryList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.categoryList");
	}
	
	
	public PayTotal payList(SqlSessionTemplate sqlSession, String pr) {
		System.out.println("pr dao : " + pr);
		return sqlSession.selectOne("adminMapper.payList", pr);
	}
	
	public ArrayList<String> prList(SqlSessionTemplate sqlSession) {
		return (ArrayList)sqlSession.selectList("adminMapper.prList");
	}

	public int updateProjectPay(SqlSessionTemplate sqlSession, PayTotal p) {
		return sqlSession.update("adminMapper.updateProjectPay", p);
	}

	public int updateAdminPay(SqlSessionTemplate sqlSession, int adminPay) {
		return sqlSession.update("adminMapper.updateAdminPay", adminPay);
	}

	public int updateProjectStatus(SqlSessionTemplate sqlSession, PayTotal p) {
		return sqlSession.update("adminMapper.updateProjectStatus", p);
	}
	
	// 주혁 끝
}













