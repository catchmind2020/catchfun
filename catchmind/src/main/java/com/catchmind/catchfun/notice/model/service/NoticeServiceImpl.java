package com.catchmind.catchfun.notice.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchmind.catchfun.common.model.vo.PageInfo;
import com.catchmind.catchfun.notice.model.dao.NoticeDao;
import com.catchmind.catchfun.notice.model.vo.CatchfunQuestion;
import com.catchmind.catchfun.notice.model.vo.Notice;

@Service("ntService")
public class NoticeServiceImpl implements NoticeService{
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private NoticeDao ntDao;
	

	/********************************************************************************
	 * 									Notice
	 ********************************************************************************/
	
	
	
	@Override
	public int selectListCount() {
		return ntDao.selectListCount(sqlSession);
	}

	@Override
	public ArrayList<Notice> selectList(PageInfo pi) {
		return ntDao.selectList(sqlSession, pi);
	}

	@Override
	public int increaseCount(String nno) {
		return ntDao.increaseCount(sqlSession, nno);
	}

	@Override
	public Notice selectNotice(String nno) {
		return ntDao.selectNotice(sqlSession, nno);
	}

	
	
	/********************************************************************************
	 * 								CatchfunQuestion
	 ********************************************************************************/
	
	
	@Override
	public int cqselectListCount(String userNo) {
		return ntDao.cqselectListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<CatchfunQuestion> cqselectList(PageInfo pi, String userNo) {
		return ntDao.cqselectList(sqlSession, pi, userNo);
	}

	@Override
	public CatchfunQuestion selectCatchfunQu(String qno) {
		return ntDao.selectCatchfunQu(sqlSession, qno);
	}

	@Override
	public int insertCatchfunQuestion(CatchfunQuestion q, String userNo) {
		return ntDao.insertCatchfunQuestion(sqlSession, q, userNo);
	}

	@Override
	public int deleteCatchfunQuestion(String qno) {
		return ntDao.deleteCatchfunQuestion(sqlSession, qno);
	}

}
