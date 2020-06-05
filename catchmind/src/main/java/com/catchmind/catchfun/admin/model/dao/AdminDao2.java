package com.catchmind.catchfun.admin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.catchmind.catchfun.admin.model.vo.Member;
import com.catchmind.catchfun.common.model.vo.PageInfo;

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

}













