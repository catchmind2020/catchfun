package com.catchmind.catchfun.notice.model.dao;

import java.util.ArrayList;
import java.util.HashMap;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.catchmind.catchfun.common.model.vo.PageInfo;
import com.catchmind.catchfun.notice.model.vo.CatchfunQuestion;
import com.catchmind.catchfun.notice.model.vo.Notice;

@Repository("ntDao")
public class NoticeDao {
	
	
	
	/********************************************************************************
	 * 									Notice
	 ********************************************************************************/
	
	public int selectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mainNoticeMapper.selectListCount");
	}
	
	public ArrayList<Notice> selectList(SqlSessionTemplate sqlSession, PageInfo pi){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mainNoticeMapper.selectList", null, rowBounds);
		
	}

	public int increaseCount(SqlSessionTemplate sqlSession, String nno) {
		return sqlSession.update("mainNoticeMapper.increaseCount", nno);
	}
	
	public Notice selectNotice(SqlSessionTemplate sqlSession, String nno) {
		return sqlSession.selectOne("mainNoticeMapper.selectNotice", nno);
	}
	
	
	
	/********************************************************************************
	 * 								CatchfunQuestion
	 ********************************************************************************/
	
	
	public int cqselectListCount(SqlSessionTemplate sqlSession) {
		return sqlSession.selectOne("mainNoticeMapper.cqselectListCount");
	}
	
	public ArrayList<CatchfunQuestion> cqselectList(SqlSessionTemplate sqlSession, PageInfo pi, String userNo){
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("mainNoticeMapper.cqselectList", userNo, rowBounds);
	}
	
	public CatchfunQuestion selectCatchfunQu(SqlSessionTemplate sqlSession, String qno) {
		return sqlSession.selectOne("mainNoticeMapper.selectCatchfunQu", qno);
	}
	
	public int insertCatchfunQuestion(SqlSessionTemplate sqlSession, CatchfunQuestion q, String userNo) {
        HashMap map = new HashMap();
        map.put("q", q);
        map.put("userNo", userNo);
		return sqlSession.update("mainNoticeMapper.insertCatchfunQuestion",map);
	}	
	
	
	public int deleteCatchfunQuestion(SqlSessionTemplate sqlSession, String qno) {
		return sqlSession.update("mainNoticeMapper.deleteCatchfunQuestion", qno);
	}

}
