package com.catchmind.catchfun.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchmind.catchfun.admin.model.dao.AdminDao;

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

}





