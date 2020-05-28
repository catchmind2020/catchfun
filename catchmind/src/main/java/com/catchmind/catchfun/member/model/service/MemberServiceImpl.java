package com.catchmind.catchfun.member.model.service;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchmind.catchfun.member.model.dao.MemberDao;
import com.catchmind.catchfun.member.model.vo.Member;


//@Component // 단순한 빈으로 등록하기 위한 어노테이션
@Service("mService") // 구체화 된 빈 (즉, 이 객체는 서비스의 역할을 수행하는 빈으로 등록)
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao mDao;
	
	
	@Override
	public Member loginMember(Member m) {
		
		//Member loginUser = mDao.loginMember(sqlSession, m);
		//return loginUser;
		return mDao.loginMember(sqlSession, m);
	}

	@Override
	public int insertMember(Member m) {
		return mDao.insertMember(sqlSession, m);
	}

	@Override
	public int updateMember(Member m) {
		return mDao.updateMember(sqlSession, m);
	}

	@Override
	public int deleteMember(String userId) {
		return mDao.deleteMember(sqlSession, userId);
	}

	@Override
	public int idCheck(String userId) {
		return mDao.idCheck(sqlSession, userId);
	}

}
