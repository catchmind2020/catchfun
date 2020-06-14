package com.catchmind.catchfun.member.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

import com.catchmind.catchfun.admin.model.vo.Question;
import com.catchmind.catchfun.common.model.vo.PageInfo;
import com.catchmind.catchfun.member.model.dao.MemberDao;
import com.catchmind.catchfun.member.model.vo.Member;
import com.catchmind.catchfun.member.model.vo.MyWish;

//@Component // 단순한 빈으로 등록하기 위한 어노테이션
@Service("mService") // 구체화 된 빈 (즉, 이 객체는 서비스의 역할을 수행하는 빈으로 등록)
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private MemberDao mDao;
	/*
	@Inject    
    MemberDAO memberdao; //dao를 사용하기 위해 의존성을 주입
    */
    private JavaMailSender mailSender;
	
	
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
	public int deleteMember(Member m) {
		return mDao.deleteMember(sqlSession, m);
	}

	@Override
	public int idCheck(String userId) {
		return mDao.idCheck(sqlSession, userId);
	}

	@Override
	public int sellerMessageRestListCount(String counseling) {
		return mDao.sellerMessageRestListCount(sqlSession, counseling);
	}

	@Override
	public ArrayList<Question> sellerMessageRestList(PageInfo pi, String counseling) {
		return mDao.sellerMessageRestList(sqlSession, pi, counseling);
	}

	@Override
	public int deleteMessage(String qno) {
		return mDao.deleteMessage(sqlSession, qno);
	}


	@Override
	public int sellerMessageView(int qno) {
		// TODO Auto-generated method stub
		return 0;
	}


	public Question selectMessage(String qno) {
		return mDao.selectMessage(sqlSession, qno);
	}

	@Override
	public Question messageView(String qno) {
		return mDao.selectMessage(sqlSession, qno);
	}

	@Override
	public Question sellerMessageAnswer(String qno) {
		return mDao.selectMessage(sqlSession, qno);
	}

	@Override
	public Question updateMessage(String qno) {
		return mDao.selectMessage(sqlSession, qno);
	}

	@Override
	public int MessageRestListCount(String userNo) {
		return mDao.MessageRestListCount(sqlSession, userNo);
	}

	@Override
	public ArrayList<Question> MessageRestList(PageInfo pi, String userNo) {
		return mDao.MessageRestList(sqlSession, pi, userNo);
	}

	@Override
	public int updateMessage(Question q) {
		
		return mDao.updateMessage(sqlSession, q);
	}

	@Override
	public Question messageUpdateForm(String qno) {
		return mDao.messageUpdateForm(sqlSession, qno);
	}

	@Override
//	public ArrayList<Question> selectReplyList(String qno) {
	public Question selectReplyList(String qno) {
		return mDao.selectReplyList(sqlSession, qno);
	}


	@Override
	public int insertReply(Question q) {
		return mDao.insertReply(sqlSession, q);
	}

	@Override
	public int deleteAnswer(String qno) {
		return mDao.deleteAnswer(sqlSession, qno);
	}

	@Override
	public int pwdFind(Member m) {
		return mDao.pwdFind(sqlSession, m);
	}

	@Override
	public int updatePwd(Member m) {
		return mDao.updatePwd(sqlSession, m);
	}
	public ArrayList<Member> idFindMember(Member m) {
		return mDao.idFindMember(sqlSession, m);
	}
	
	@Override
	public ArrayList<MyWish> myWishList(String userNo) {
		return mDao.myWishList(sqlSession, userNo);
	}





	// 이메일 !!
	
	/*
 
    
    
    @Override    //회원가입 메소드, Map과 dto를 갖이 넘김
    public void join(Map<String, Object>map,MemberDTO dto) {
    	mDao.join(map,dto);
 
    }
 
 
    @Override    //로그인 관련 메소드 (세션에 아이디와 비밀번호를 저장)
    public boolean loginCheck(MemberDTO dto, HttpSession session) {
        
        boolean result = mDao.loginCheck(dto);
        if(result) {    //로그인 성공
            session.setAttribute("user_id", dto.getUser_id());
            session.setAttribute("member_pass", dto.getMember_pass());
            System.out.println(session.getAttribute("user_id"));
            System.out.println(session.getAttribute("member_pass"));
        }
        
        return result;
    }
 
    //아이디 찾기
    @Override
    public String find_idCheck(MemberDTO dto) {
        String id = mDao.find_idCheck(dto);
        
        return id;
    }
 
    //비밀번호 찾기
    @Override
    public String find_passCheck(MemberDTO dto) {
        String pass = mDao.find_passCheck(dto);
        return pass;
    }
 
 
    @Override
    public void authentication(MemberDTO dto) {
        
    	mDao.authentication(dto);
    }
 
 
    @Override
    public void pass_change(Map<String, Object> map, MemberDTO dto) throws Exception {
        
        
    	mDao.pass_change(map,dto);
    }
 
 
    //이메일 중복 확인
    @Override
    public boolean email_check(String e_mail) throws Exception{
        
        boolean result = mDao.email_check(e_mail);
        
        return result;
        
    }
 
    //아이디 중복 확인
    @Override
    public boolean join_id_check(String user_id) throws Exception {
    
        boolean result = mDao.join_id_check(user_id);
        
        return result;
    }
 
    //자신의 프로필을 볼 수 있게 하는 메소드
    @Override
    public List<MemberDTO> member_profile(String user_id) throws Exception{
        
        return mDao.member_profile(user_id);
    }

	 */
}
