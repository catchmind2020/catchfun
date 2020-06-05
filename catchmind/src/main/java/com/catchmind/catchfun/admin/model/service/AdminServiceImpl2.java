package com.catchmind.catchfun.admin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchmind.catchfun.admin.model.dao.AdminDao2;
import com.catchmind.catchfun.admin.model.vo.Member;
import com.catchmind.catchfun.common.model.vo.PageInfo;

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




