package com.catchmind.catchfun.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchmind.catchfun.admin.model.dao.AdminDao;
import com.catchmind.catchfun.admin.model.vo.Category;
import com.catchmind.catchfun.admin.model.vo.Notice;
import com.catchmind.catchfun.admin.model.vo.PayTotal;
import com.catchmind.catchfun.admin.model.vo.Question;
import com.catchmind.catchfun.common.model.vo.PageInfo;

@Service("aService")
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDao aDao;

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

	
	// 주혁시작
	
	@Override
	public int selectListCount() {
		return aDao.selectListCount(sqlSession);
	}
	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return aDao.selectList(sqlSession, pi);
	}
	@Override
	public Notice noticeDetail(String nno) {
		return aDao.noticeDetail(sqlSession, nno);
	}
	@Override
	public int insertNotice(Notice n) {
		return aDao.insertNotice(sqlSession, n);
	}
	@Override
	public int noticeDelete(String nno) {
		return aDao.noticeDelete(sqlSession, nno);
	}
	@Override
	public int noticeUpdatInsert(Notice n) {
		return aDao.noticeUpdatInsert(sqlSession, n);
	}
	
	// Question
	
	@Override
	public int questionSelectListCount() {
		return aDao.questionSelectListCount(sqlSession);
	}
	@Override
	public ArrayList<Question> questionSelectList(PageInfo pi) {
		return aDao.questionSelectList(sqlSession, pi);
	}
	@Override
	public Question qnaDetail(String qno) {
		return aDao.qnaDetail(sqlSession, qno);
	}
	@Override
	public int qnaAnsUpdate(Question q) {
		return aDao.qnaAnsUpdate(sqlSession, q);
	}
	@Override
	public int qnaDelete(String qno) {
		return aDao.qnaDelete(sqlSession, qno);
	}
	@Override
	public int insertCategory(Category c) {
		return aDao.insertCategory(sqlSession, c);
	}
	@Override
	public String refNoCategory() {
		return aDao.refNoCategory(sqlSession);
	}
	@Override
	public int insertAttachment(Category c) {
		return aDao.insertAttachment(sqlSession, c);
	}

	@Override
	public Category categoryDetail(String cno) {
		return aDao.categoryDetail(sqlSession, cno);
	}
	
	@Override
	public int updateCategory(Category c) {
		return aDao.updateCategory(sqlSession, c);
	}
	
	@Override
	public int updateCategory2(Category c) {
		return aDao.updateCategory2(sqlSession, c);
	}
	
	@Override
	public int deleteCategory(String cno) {
		return aDao.deleteCategory(sqlSession, cno);
	}
	
	@Override
	public String deleteCategoryFile(String cno) {
		return aDao.deleteCategoryFile(sqlSession, cno);
	}
	
	@Override
	public ArrayList<Category> categoryList() {
		return aDao.categoryList(sqlSession);
	}
	@Override
	public PayTotal payList(String pr) {
		return aDao.payList(sqlSession, pr);
	}
	@Override
	public ArrayList<String> prList() {
		return aDao.prList(sqlSession);
	}
	
	// 3. Category
	
	// 주혁 끝
}





