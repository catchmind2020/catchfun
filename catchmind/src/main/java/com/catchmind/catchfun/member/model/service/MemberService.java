package com.catchmind.catchfun.member.model.service;

import java.util.ArrayList;

import com.catchmind.catchfun.admin.model.vo.Question;
import com.catchmind.catchfun.common.model.vo.PageInfo;
import com.catchmind.catchfun.member.model.vo.Member;
import com.catchmind.catchfun.member.model.vo.MyWish;

public interface MemberService {
	
	// 1. 로그인용 서비스
	Member loginMember(Member m);
	
	// 2. 회원가입용 서비스
	int insertMember(Member m);
	
	// 3. 회원정보 수정용 서비스
	int updateMember(Member m);
	
	// 4. 회원탈퇴용 서비스
	int deleteMember(Member m);
	
	// 5. 아이디 중복체크용 서비스 (AJAX)
	int idCheck(String userId);
	
	// 6. 메세지 리스트(프로젝트 개설자)
	int sellerMessageRestListCount(String counseling);
	
	ArrayList<Question> sellerMessageRestList(PageInfo pi, String counseling);
	
	// 7. 메세지 리스트
	int MessageRestListCount(String userNo);
	
	ArrayList<Question> MessageRestList(PageInfo pi, String userNo);
	
	// (프로젝트개설자의) 메세지 상세조회
	int sellerMessageView(int qno);
	
	// (일반사용자의) 메세지 상세조회
	Question messageView(String qno);
	
	// 메세지 답변달기 상세조회
	// (일반사용자의) 메세지 상세조회
	Question sellerMessageAnswer(String qno);

	// 7. 메세지삭제용 서비스  ///
	int deleteMessage(String pno);


	/*
	 * 게시글 수정용 서비스 int updateMessage(Question q);
	 */

	int updateMessage(Question q);

	Question selectMessage(String qno);

	Question updateMessage(String qno);

	Question messageUpdateForm(String qno);

	
	// 해당 게시글에 딸려있는 댓글 리스트 조회용 서비스
	//ArrayList<Question> selectReplyList(String qno);
	Question selectReplyList(String qno);

	// 댓글 작성용 서비스
	int insertReply(Question q);

	// 답글 삭제 서비스
	int deleteAnswer(String qno);

	int pwdFind(Member m);


	ArrayList<Member> idFindMember(Member m);
	
	ArrayList<MyWish> myWishList(String userNo);

	int updatePwd(Member m);
	


	Member selectId(Member m);


	
	
	// 메세지수정용 서비스
	//int updateMessage(Question q);
	
	
	// 9. 해당 게시글에 있는 댓글리스트 조회용 서비스
	
	// 10. 댓글 작성용 서비스
	
	
	
	
	
	// 이메일 !!
	
	/*
	
    public void join (Map<String, Object>map,MemberDTO dto); //회원가입 관련
    
    
    public boolean loginCheck(MemberDTO dto, HttpSession session);    //로그인 관련
    
    
    public String find_idCheck(MemberDTO dto);    //아이디 찾기 관련
    
    
    public String find_passCheck(MemberDTO dto);    //비밀번호 찾기 관련
    
    
    public void authentication(MemberDTO dto);        //회원 인증관련 메소드
    
    
    public void pass_change(Map<String, Object> map, MemberDTO dto)throws Exception;    //비밀번호 변경
    
    
    public boolean email_check(String e_mail) throws Exception;    //이메일 중복확인을 하는 메소드
    
    
    public boolean join_id_check(String user_id) throws Exception;    //회원가입시 아이디를 체크하는 메소드
    
    
    public List<MemberDTO> member_profile(String user_id) throws Exception;    //회원의 프로필을 볼 수 있는 메소드
	
	*/
}


		
	







