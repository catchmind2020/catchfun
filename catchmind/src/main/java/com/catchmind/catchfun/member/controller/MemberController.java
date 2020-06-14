package com.catchmind.catchfun.member.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.catchmind.catchfun.admin.model.vo.Category;
import com.catchmind.catchfun.admin.model.vo.Question;
import com.catchmind.catchfun.common.model.vo.PageInfo;
import com.catchmind.catchfun.common.template.Pagination;
import com.catchmind.catchfun.member.model.service.MailService;
import com.catchmind.catchfun.member.model.service.MemberService;
import com.catchmind.catchfun.member.model.vo.Member;
import com.google.gson.GsonBuilder;

@Controller // 해당 이 클래스를 Controller 역할을 하는 빈으로 등록시키는 어노테이션
public class MemberController {
	
	@Autowired // DI
	private MemberService mService;
	
	@Autowired
	MailService ms;
	
	// 암호화
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	// 이메일 인증 !
	
	@Inject    //서비스를 호출하기 위해서 의존성을 주입
    JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
    MemberService memberservice; //서비스를 호출하기 위해 의존성을 주입
    
    //로깅을 위한 변수
	/*
	 * private static final Logger logger=
	 * LoggerFactory.getLogger(MemberController.class); private static final String
	 * String = null;
	 */
	
	/*
	 * ** 파라미터(요청시 전달값)를 전송받는 방법
	 */
	
	/*
	 * 1. HttpServletRequest를 통해 전송받기(jsp/servlet 때 방식)
	 */
	/*
	@RequestMapping(value="login.me") // HandlerMapping을 등록하는 어노테이션
	public String loginMember(HttpServletRequest request) {
		
		String userId = request.getParameter("id");
		String userPwd = request.getParameter("pwd");
		
		System.out.println("ID : " + userId);
		System.out.println("PWD : " + userPwd);
		
		// 요청처리 다 했다는 가정하에 그다음에 사용자가 보게될 응답페이지 포워딩
		//request.getRequestDispatcher("/WEB-INF/views/main.jsp").forward(request, response);
	
		return "main";
	
	}
	*/
	
	/*
	 * 2. @RequestParam 어노테이션 방식으로 바로 매핑시키는 방법
	 */
	/*
	@RequestMapping("login.me")
	public String loginMember(@RequestParam("id") String userId, 
							  @RequestParam("pwd") String userPwd) {
		
		System.out.println("ID : " + userId);
		System.out.println("PWD : " + userPwd);
		
		return "main";
	}
	*/
	
	/*
	 * 3. @RequestParam 어노테이션을 생략하는 방법
	 * 
	 *    주의할점!! : 요청시 전달값의 key값을 내가 담고자하는 매개변수명과 일치시켜야됨!!
	 */
	/*
	@RequestMapping("login.me")
	public String loginMember(String userId, String userPwd) {
		
		System.out.println("ID : " + userId);
		System.out.println("PWD : " + userPwd);
		
		Member m = new Member();
		m.setUserId(userId);
		m.setUserPwd(userPwd);
		
		return "main";
	}
	*/
	
	/*
	 * 4. @ModelAttribute 어노테이션 방법을 이용해 vo에 바로 매핑
	 *    == 커맨드 객체 방식
	 *    
	 *    	주의할점!! 
	 *    	- 요청시 전달값의 키값이 내가 담고자하는 vo의 필드명과 일치해야됨!!
	 *      
	 *      내부적인 흐름 
	 *      - 기본생성자로 생성 후 setter를 통해 값이 주입됨!
	 *      --> Member 클래스 구성시 기본생성자, setter반드시 필수!!
	 *      
	 */
	/*
	@RequestMapping("login.me")
	public String loginMember(@ModelAttribute Member m) {
		
		System.out.println("ID : " + m.getUserId());
		System.out.println("PWD : " + m.getUserPwd());
		
		return "main";
	}
	*/
	
	/*
	 * 5. @ModelAttribute 어노테이션 생략하는 방법
	 */
	/*
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session) {
		
		//System.out.println("ID : " + m.getUserId());
		//System.out.println("PWD : " + m.getUserPwd());
		
		//MemberService mService = new MemberServiceImpl();
		
		// 직접 객체 생성 == 결합도가 굉장히 높음
		// 따라서 발생하는 문제!!
		// 1. 클래스명이 바뀌었을 경우 --> 에러발생 --> 일일히 찾아가서 코드수정해야됨
		// 2. 주소값 출력시 매 요청때마다 주소값이 다르게 출력
		//	  --> 사용자가 요청을 할 때 마다 매번 객체생성후 소멸/ 생성 후 소멸 ...
		
		// 결합도를 낮춰주기 위해 스프링의 특징 DI(Dependency Injection)를 통해서 의존성 주입 하겠음!!
		
		// 해결 1. 클래스명을 수정해도 코드를 수정할 필요가 없다!
		// 해결 2. 매 요청마다 같은 주소값 확인 가능 (즉, 한개의 객체만 생성 후 재사용의 개념 == 싱글톤)
		//		  10000개의 요청이 들어와도 Service 객체는 1로 재사용하게 됨 (매번 생성 후 소멸 하는게 아님!!)
		//		  ==> 메모리의 효율이 올라감
		
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null) { // 로그인 성공!!
			
			// 로그인한 회원 객체 --> session 에 담기
			session.setAttribute("loginUser", loginUser);
			
			// main페이지 보여져야됨
			//return "main"; // request.getRequestDispatcher("뷰경로").forward(..); == 포워딩 방식
			// /WEB-INF/views/main.jsp
			
			return "redirect:/"; // url 재요청하는 방식 == sendRedirect
			
		}else { // 로그인 실패!!
			
			// 에러메세지 담기 --> request에 담기
			
			// 에러페이지(/WEB-INF/views/common/errorPage.jsp)로 포워딩 
			return "common/errorPage";
		}
		
		
	}
	*/
	
	
	// 요청 처리 후 응답페이지에 전달하고자 하는 데이터가 있을 경우
	/*
	 * 1. Model 이라는 객체를 사용하는 방법
	 * 
	 *    Model이라는 객체를 사용하게 되면 응답할 화면에 전달하고자 하는 데이터를
	 *    맵 형식 (key, value)로 담을 수 있음
	 *    (단, setAttribute가 아닌 addAttribute로!)
	 *    
	 *    Model 객체 영역 == requestScope
	 */
	/*
	@RequestMapping("login.me")
	public String loginMember(Member m, HttpSession session, Model model) {
		
		Member loginUser = mService.loginMember(m);
		
		if(loginUser != null) {
			session.setAttribute("loginUser", loginUser);
			return "redirect:/";
		}else {
			model.addAttribute("msg", "로그인 실패!!");
			return "common/errorPage";
		}
		
	}
	*/
	
	/*
	 * 2. ModelAndView 객체를 사용하는 방법
	 * 
	 *    Model은 응답 데이터를 담는 공간이라고 한다면
	 *    View는 뷰에 대한 정보를 담는 공간
	 */
	// 암호화
	/*
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m); // 아이디만을 가지고 조회한 결과
		
		// loginUser에 userPwd : 암호문
		// 		m 에 userPwd : 로그인 시 입력한 비밀번호(평문)
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
			mv.setViewName("redirect:/");
		}else {
			//mv.addObject("msg", "로그인 실패!!");
			//mv.setViewName("common/errorPage");
			mv.addObject("msg", "로그인실패!!").setViewName("common/errorPage");
		}
		
		return mv;
	}
	*/
	/*
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("enrollForm.me")
	public String enrollForm() {
		return "member/memberEnrollForm";
	}
	*/
	/*
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {
		
		//System.out.println(m);
		
		 * 1. 한글이 깨짐 -> web.xml에 인코딩 필터 달기
		 * 2. 나이값 같은 값을 입력하지 않으면 빈문자열로 값이 넘어가는데 int형 값을 주입할 수 없는 400에러발생
		 *    --> Member 클래스에 age 필드의 자료형을 String으로 바꿈
		 * 
		 * 3. 비밀번호값이 사용자가 입력한 그대로의 평문값!!
		 *    --> 암호화를 거쳐서 암호문으로 DB에 저장시킬것!!
		 *    
		 *    기존의 SHA 암호화 방식(단방향 암호화)
		 *    --> 사용자가 매번 같은 평문을 입력했을 때 같은 암호문이 나옴!!
		 *    --> 다양한 샘플이 확보되면 규칙을 찾아낼 수 있음 --> 암호문을 통해 평문을 유추할 수 있음
		 *    
		 *    => 솔팅(salting) 기법이 추가된 BCrypt 암호화 방식 사용할 거임
		 *    평문+랜덤값  ------ 암호화 -----> 암호문
		 *    
		 *    아무리 같은 평문을 입력해도 뒤에 붙는 랜덤값(salt값)이 달라지기 때문에 매번 암호문이 달라짐
		 */
		
		//System.out.println("암호화전 : " + m.getUserPwd());
		
		// 암호화작업
	// 암호화
		/*
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		//System.out.println("암호화후 : " + encPwd);
		
		m.setUserPwd(encPwd);
		
		int result = mService.insertMember(m);
		
		if(result > 0) { // 회원가입 성공
			
			session.setAttribute("msg", "회원가입 성공!!");
			return "redirect:/";
			
		}else { // 회원가입 실패
			
			model.addAttribute("msg", "회원가입 실패!!");
			return "common/errorPage";
		}
		
	}
	*/
	
	
	
	/*
	@RequestMapping("myPage.me")
	public String myPage() {
		return "member/myPage";
	}
	
	
	@RequestMapping("update.me")
	public String updateMember(Member m, Model model, HttpSession session) {
		
		int result = mService.updateMember(m);
		
		if(result > 0) { // 회원정보 수정 성공 --> 마이페이지 요청
			
			session.setAttribute("loginUser", mService.loginMember(m));
			session.setAttribute("msg", "회원정보 수정 성공!");
			
			return "redirect:myPage.me";
			
		}else { // 회원정보 수정 실패 --> 에러페이지로 포워딩
			
			model.addAttribute("msg", "회원 정보 수정 실패!");
			return "common/errorPage";
		}
		
	}
	
	
	@RequestMapping("delete.me")
	public String deleteMember(String userId, Model model) {
		
		int result = mService.deleteMember(userId);
		
		if(result > 0) {
			
			return "redirect:logout.me";
			
		}else {
			
			model.addAttribute("msg", "회원탈퇴 실패!");
			return "common/errorPage";
			
		}
	}
		*/
	@ResponseBody
	@RequestMapping(value="idCheck.me")
	public String idCheck(String userId) {
		
		int count = mService.idCheck(userId);
		
		if(count > 0) { // 중복된 아이디있음!! => 사용불가능!!
			return "fail";
		}else { // 중복된 아이디가 없음!! => 사용가능!!
			return "success";
		}
		
	}
	

	
	
//	아이유 시작
	
	@RequestMapping("main")
	public String main() {
		return "redirect:/";
	}
	
	@RequestMapping("loginGo.me")
	public String login() {
		return "member/login";
	}
	
	@RequestMapping("login.me")
	public ModelAndView loginMember(Member m, HttpSession session, ModelAndView mv) {
		
		Member loginUser = mService.loginMember(m); // 아이디만을 가지고 조회한 결과
		
		// loginUser에 userPwd : 암호문
		// 		m 에 userPwd : 로그인 시 입력한 비밀번호(평문)
		System.out.println(loginUser);
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);

			System.out.println("성공성공");
		

			if(loginUser.getUserId().equals("admin")) {
				mv.setViewName("redirect:member.ad?currentPage=1");
				//mv.setViewName("common/admin");
			}else {
				mv.setViewName("redirect:/");
			}
		}else {
			//mv.addObject("msg", "로그인 실패!!");
			//mv.setViewName("common/errorPage");
			mv.addObject("msg", "로그인실패!!").setViewName("common/errorPage");
		}
		
		return mv;
	}
	
	@RequestMapping("logout.me")
	public String logoutMember(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	@RequestMapping("mypage.me")
	public String mypage() {
		return "member/mypage";
	}
	
	@RequestMapping("idFindSuccess.me")
	public String idFindSuccess() {
		return "member/idFindSuccess";
	}
	
	@RequestMapping("memberEnrollForm.me")
	public ModelAndView memberEnrollForm() {
		
		ModelAndView mv = new ModelAndView();
		int ran = new Random().nextInt(900000) + 100000;
		
		System.out.println(ran);
		mv.setViewName("member/memberEnrollForm");
		mv.addObject("random", ran);
		return mv;
		
		//return "member/memberEnrollForm";
	}
	
	@RequestMapping("insert.me")
	public String insertMember(Member m, Model model, HttpSession session) {
		
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd); // 암호문으로 받아서 insert 요청
		
		int result = mService.insertMember(m);
		
		if(result > 0) { // 회원가입성공
			
			session.setAttribute("msg", "회원가입 성공!");
			return "redirect:/";
			
		}else {	// 회원가입실패
			
			model.addAttribute("msg", "회원가입 실패");
			return "common/errorPage";
		}
	
		
	}
	
	@RequestMapping("update.me")
	public String updateMember(Member m, Model model, HttpSession session) {
		
		int result = mService.updateMember(m);
		
		if(result > 0) { // 회원정보 수정 성공 --> 마이페이지 요청
			
			session.setAttribute("loginUser", mService.loginMember(m));
			session.setAttribute("msg", "회원정보 수정 성공!");
			
			return "redirect:/"; //myPage.me
			
		}else { // 회원정보 수정 실패 --> 에러페이지로 포워딩
			
			model.addAttribute("msg", "회원 정보 수정 실패!");
			return "common/errorPage";
		}
		
	}
	
	@RequestMapping("updatePwd.me")
	public String updatePwd(String pass1, Model model, HttpSession session) {
		
		
		
		
		
		Member loginUser = (Member)session.getAttribute("loginUser");
		
		
		Member member = mService.loginMember(loginUser); // 아이디만을 가지고 조회한 결과
		
		// loginUser에 userPwd : 암호문
		// 		m 에 userPwd : 로그인 시 입력한 비밀번호(평문)
		System.out.println(loginUser);
		if(loginUser != null && bcryptPasswordEncoder.matches(pass1, member.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);

			System.out.println("성공성공");
		
		
		
		
		String encPwd = bcryptPasswordEncoder.encode(pass1);
	
		
		loginUser.setChangePwd(encPwd);
		
		
		int result = mService.updatePwd(loginUser);
		
		
		return "member/login"; //myPage.me
		
		}else { // 회원정보 수정 실패 --> 에러페이지로 포워딩
			
			model.addAttribute("msg", "현재비밀번호를 잘못 입력하셨습니다.");
			return "member/passwordChange";
		}
		
		
	}
	
	
	
	@RequestMapping("idpwdFind.me")
	public String idpwdFind() {
		return "member/idpwdFind";
	}

	@RequestMapping("passwordChange.me")
	public String passwordChange() {
		return "member/passwordChange";
	}
	
	@RequestMapping("pointList.me")
	public String pointList() {
		return "member/pointList";
	}
	

	
	// 프로젝트개설자의 메세지 리스트

	@RequestMapping("sellerMessageRest.me")
	public String sellerMessageRest(int currentPage, Model model, String counseling) {
		
		int listCount = mService.sellerMessageRestListCount(counseling);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Question> list = mService.sellerMessageRestList(pi, counseling);
		
		System.out.println(listCount);
		System.out.println(list);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "member/sellerMessageRest";
	}
	
	// 일반회원의 메세지 리스트 
	@RequestMapping("messageRest.me")
	public String messageRest(int currentPage, Model model, String userNo) {
		
		int listCount = mService.MessageRestListCount(userNo);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Question> list = mService.MessageRestList(pi, userNo);
		
		System.out.println(listCount);
		System.out.println(list);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "member/messageRest";
	}
	
	// 메세지 상세조회
	@RequestMapping("sellerMessageView.me")
	public ModelAndView selectMessage(String qno, ModelAndView mv) {
		
		//int result = mService.increaseCount(qno);
		
			Question q = mService.messageView(qno);
			mv.addObject("q", q);
			mv.setViewName("member/sellerMessageView");

		
		return mv;
		
	}
	
	// 메세지 상세조회
	@RequestMapping("messageView2.me")
	public ModelAndView selectMessage2(String qno, ModelAndView mv) {
		
		//int result = mService.increaseCount(qno);
		
			Question q = mService.messageView(qno);
			mv.addObject("q", q);
			mv.setViewName("member/messageView");
		
		return mv;
	}
	
	// 메세지 답변달기
	@RequestMapping("sellerMessageAnswer.me")
	public ModelAndView sellerMessageAnswer(String qno, ModelAndView mv) {
		
		Question q = mService.messageView(qno);
		mv.addObject("q", q);
		mv.setViewName("member/sellerMessageAnswer");

	return mv;
		
	}
	// 메세지(질문) 삭제하기
	@RequestMapping("delete.qu")
	public String deleteMessage(String qno, Question q, Model model) { 
		
		int result = mService.deleteMessage(qno);
		
		
		if(result > 0) {// 게시글 삭제 성공 

			return "redirect:messageRest.me?userNo=" + q.getUserNo()
			;//"redirect:messageRest.me?userNo=M3&currentPage=1";
			
		}else {	// 게시글 삭제 실패
			
			model.addAttribute("msg", "게시글 삭제 실패!!");
			return "common/errorPage";
		}
	}
	
	// (프로젝트관리자)답글 삭제하기
	@ResponseBody
	@RequestMapping("deleteAnswer.qu")
	public String deleteAnswer(String qno, Model model) { 
		
		int result = mService.deleteAnswer(qno);
		
		if(result > 0) {// 게시글 삭제 성공 

			//return "redirect:alist.qu?qno=" + qno;
			return "success";
		}else {	// 게시글 삭제 실패
			
			model.addAttribute("msg", "답변 삭제 실패!!");
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("messageUpdateForm.qu")
	public String messageUpdateForm(String qno, Model model) { 
		//System.out.println("gg : " + qno);
		Question qd = mService.messageUpdateForm(qno);
		//System.out.println("테스트 : " + qno);
		model.addAttribute("q", qd);
		
		return "member/messageUpdateForm";
		
	}
	
	// 메세지(질문) 수정하기
	@RequestMapping("updateForm.qu")
	public String updateForm(Question q, Model model) {
		
		//model.addAttribute("q", mService.selectMessage(qno));
		
		int result = mService.updateMessage(q);
		
		if(result > 0) {
			
			return "redirect:messageView2.me?qno=" + q.getQuestionNo();
			
		}else {
			model.addAttribute("msg", "메세지 수정 실패!!");
			return "common/errorPage";
		}
	
		
	}
	
	
	// 회원탈퇴
	@RequestMapping("membershipDelete.me")
	public String deleteMember(Member m) {
		
		int result = mService.deleteMember(m);
		
		if(result > 0) {
			return "redirect:logout.me";
		}else {
			return "member/membershipDelete";
		}
	}
	
	/*
	 * public String insertReply(Reply r) {
	 * 
	 * int result = bService.insertReply(r);
	 * 
	 * if(result > 0) { return "success"; }else { return "fail"; }
	 * 
	 * }
	 */
	
	@RequestMapping("mypageModify.me")
	public String mypageModify() {
		return "member/mypageModify";
	}
	
	// 비밀번호찾기
	@ResponseBody
	@RequestMapping(value="pwdFind.me")
	public String pwdFind(Member m, Model model, @RequestParam String userId, HttpServletRequest req) {
		
		/*
		String encPwd = bcryptPasswordEncoder.encode(m.getUserPwd());
		m.setUserPwd(encPwd); // 암호문으로 받아서 insert 요청
		
		int result = mService.insertMember(m);
		*/
		
		System.out.println("객체 테스트1(객체) : " + m);
		
		int pwdFind = mService.pwdFind(m);
		System.out.println("객체 테스트2(1) : " + pwdFind);
		
		
		if(pwdFind > 0) {
			
			//이메일 인증
			int ran = new Random().nextInt(900000) + 100000;
			
			HttpSession session = req.getSession(true);
			String authCode = String.valueOf(ran);
			String subject = "캐치펀 회원가입 인증 코드 발급 안내 입니다.";
			StringBuilder sb = new StringBuilder();
			sb.append("귀하의 인증 코드는 " + authCode + "입니다.");
			
			session.setAttribute("pw", authCode);
			
			System.out.println(authCode);
			
			if(ms.send(subject, sb.toString(), "캐치마인드", userId, null)) {
				// 메일 발송 성공
				
//				int updatePwd = mService.updatePwd(authCode);
				
				return "success";
			}else {
				// 메일 발송 실패
				return "fail";
			}
			
		}else {
			return "fail";
		}
			
	}
	
	
	
	
	
	
	
	@RequestMapping(value="pwdFind2.me")
	public String pwdFind(Member m, Model model, HttpSession session) {
		
		System.out.println("인증번호 테스트 : " + m.getCerti());
		
		String pw = (String)session.getAttribute("pw");
		
		session.setAttribute("loginUser", m);
		
	
		
		if(pw.equals(m.getCerti())) {
//			int updatePwd = mService.updatePwd(certi);
			
			model.addAttribute(m);
			return "member/messageUpdateForm";
			
		}else {
			return "fail";
		}
			
	}
			

	@ResponseBody
	@RequestMapping(value="alist.qu", produces="application/json; charset=utf-8")
	public String selectReplyList(String qno) {
		
		System.out.println("화긴화긴1 : " + qno);
		//ArrayList<Question> list1 = mService.selectReplyList(qno);
		Question list1 = mService.selectReplyList(qno);
		System.out.println("화긴화긴 : " + list1);
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create().toJson(list1);
		//return new Gson().toJson(list1);
	}
	
	@ResponseBody
	@RequestMapping(value="ainsert.qu")
	public String insertReply(Question q, Model model) {
		System.out.println(q + "ㅇㅇㅇ");
		int result = mService.insertReply(q);
		System.out.println("asdasdsada : " + result);
		
		if(result > 0){
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	
	

	// 이메일 인증 시작!
	
	/*
	 * // mailSending 코드
	 * 
	 * @RequestMapping( value = "/member/auth.do" , method=RequestMethod.POST )
	 * public ModelAndView mailSending(HttpServletRequest request, String e_mail,
	 * HttpServletResponse response_email) throws IOException {
	 * 
	 * Random r = new Random(); int dice = r.nextInt(4589362) + 49311; //이메일로 받는
	 * 인증코드 부분 (난수)
	 * 
	 * String setfrom = "dlgkstjq623@gamil.com"; String tomail =
	 * request.getParameter("e_mail"); // 받는 사람 이메일 String title =
	 * "회원가입 인증 이메일 입니다."; // 제목 String content =
	 * 
	 * System.getProperty("line.separator")+ //한줄씩 줄간격을 두기위해 작성
	 * 
	 * System.getProperty("line.separator")+
	 * 
	 * "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다"
	 * 
	 * +System.getProperty("line.separator")+
	 * 
	 * System.getProperty("line.separator")+
	 * 
	 * " 인증번호는 " +dice+ " 입니다. "
	 * 
	 * +System.getProperty("line.separator")+
	 * 
	 * System.getProperty("line.separator")+
	 * 
	 * "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다."; // 내용
	 * 
	 * 
	 * try { MimeMessage message = mailSender.createMimeMessage(); MimeMessageHelper
	 * messageHelper = new MimeMessageHelper(message, true, "UTF-8");
	 * 
	 * messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
	 * messageHelper.setTo(tomail); // 받는사람 이메일 messageHelper.setSubject(title); //
	 * 메일제목은 생략이 가능하다 messageHelper.setText(content); // 메일 내용
	 * 
	 * mailSender.send(message); } catch (Exception e) { System.out.println(e); }
	 * 
	 * ModelAndView mv = new ModelAndView(); //ModelAndView로 보낼 페이지를 지정하고, 보낼 값을
	 * 지정한다. mv.setViewName("/member/email_injeung"); //뷰의이름 mv.addObject("dice",
	 * dice);
	 * 
	 * System.out.println("mv : "+mv);
	 * 
	 * response_email.setContentType("text/html; charset=UTF-8"); PrintWriter
	 * out_email = response_email.getWriter();
	 * out_email.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
	 * out_email.flush();
	 * 
	 * 
	 * return mv;
	 * 
	 * }
	 */
	//이메일 인증 페이지 맵핑 메소드
	@RequestMapping("/member/email.do")
	public String email() {
	    return "member/email";
	}
	
	
	
	
	//이메일로 받은 인증번호를 입력하고 전송 버튼을 누르면 맵핑되는 메소드.
	//내가 입력한 인증번호와 메일로 입력한 인증번호가 맞는지 확인해서 맞으면 회원가입 페이지로 넘어가고,
	//틀리면 다시 원래 페이지로 돌아오는 메소드
	@RequestMapping(value = "/member/join_injeung.do{dice}", method = RequestMethod.POST)
	public ModelAndView join_injeung(String email_injeung, @PathVariable String dice, HttpServletResponse response_equals) throws IOException {
	
	    System.out.println("마지막 : email_injeung : "+email_injeung);
	    
	    System.out.println("마지막 : dice : "+dice);
	    
	    
	    //페이지이동과 자료를 동시에 하기위해 ModelAndView를 사용해서 이동할 페이지와 자료를 담음
	     
	    ModelAndView mv = new ModelAndView();
	    
	    mv.setViewName("/member/join.do");
	    
	    mv.addObject("e_mail",email_injeung);
	    
	    if (email_injeung.equals(dice)) {
	        
	        //인증번호가 일치할 경우 인증번호가 맞다는 창을 출력하고 회원가입창으로 이동함
	        
	        
	        
	        mv.setViewName("member/join");
	        
	        mv.addObject("e_mail",email_injeung);
	        
	        //만약 인증번호가 같다면 이메일을 회원가입 페이지로 같이 넘겨서 이메일을
	        //한번더 입력할 필요가 없게 한다.
	        
	        response_equals.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_equals = response_equals.getWriter();
	        out_equals.println("<script>alert('인증번호가 일치하였습니다. 회원가입창으로 이동합니다.');</script>");
	        out_equals.flush();
	
	        return mv;
	        
	        
	    }else if (email_injeung != dice) {
	        
	        
	        ModelAndView mv2 = new ModelAndView(); 
	        
	        mv2.setViewName("member/email_injeung");
	        
	        response_equals.setContentType("text/html; charset=UTF-8");
	        PrintWriter out_equals = response_equals.getWriter();
	        out_equals.println("<script>alert('인증번호가 일치하지않습니다. 인증번호를 다시 입력해주세요.'); history.go(-1);</script>");
	        out_equals.flush();
	        
	
	        return mv2;
	        
	    }    
	
	    return mv;
		
	}
	
	
// 아이유 끝
	
}





