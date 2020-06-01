package com.catchmind.catchfun.admin.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchmind.catchfun.admin.model.dao.AdminDao2;

@Service("aService2")
public class AdminServiceImpl2 implements AdminService2 {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	@Autowired
	private AdminDao2 aDao2;

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





