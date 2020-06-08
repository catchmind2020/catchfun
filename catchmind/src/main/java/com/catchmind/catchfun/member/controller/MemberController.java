package com.catchmind.catchfun.member.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.catchmind.catchfun.member.model.service.MemberService;
import com.catchmind.catchfun.member.model.vo.Member;

@Controller // 해당 이 클래스를 Controller 역할을 하는 빈으로 등록시키는 어노테이션
public class MemberController {
	
	@Autowired // DI
	private MemberService mService;
	
	// 암호화
	@Autowired
	private BCryptPasswordEncoder bcryptPasswordEncoder;
	
	
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
		
		if(loginUser != null && bcryptPasswordEncoder.matches(m.getUserPwd(), loginUser.getUserPwd())) {
			session.setAttribute("loginUser", loginUser);
<<<<<<< HEAD
			System.out.println("성공성공");
			
=======
>>>>>>> 9786948eec0581bc1416fc60e1ec369cf5c2764f
			if(loginUser.getUserId().equals("admin")) {
				mv.setViewName("admin/adminCategory");
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
	public String memberEnrollForm() {
		return "member/memberEnrollForm";
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
	
	@RequestMapping("sellerMessageAnswer.me")
	public String sellerMessageAnswer() {
		return "member/sellerMessageAnswer";
	}
	
	@RequestMapping("sellerMessageRest.me")
	public String sellerMessageRest() {
		return "member/sellerMessageRest";
	}
	
	@RequestMapping("message_rest.me")
	public String message_rest() {
		return "member/message_rest";
	}
	
	@RequestMapping("message_view.me")
	public String message_view() {
		return "member/message_view";
	}
	
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
	
	@RequestMapping("sellerMessageView.me")
	public String sellerMessageView() {
		return "member/sellerMessageView";
	}
	

	
	
	
	
// 아이유 끝
	
}





