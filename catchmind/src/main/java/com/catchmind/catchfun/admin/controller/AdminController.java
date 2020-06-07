package com.catchmind.catchfun.admin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.catchmind.catchfun.admin.model.service.AdminService;
import com.catchmind.catchfun.admin.model.vo.Category;
import com.catchmind.catchfun.admin.model.vo.Notice;
import com.catchmind.catchfun.admin.model.vo.PayTotal;
import com.catchmind.catchfun.admin.model.vo.Question;
import com.catchmind.catchfun.common.model.vo.PageInfo;
import com.catchmind.catchfun.common.template.Pagination;
import com.google.gson.GsonBuilder;

@Controller
public class AdminController {
	
	@Autowired
	private AdminService aService;
	
	/*
	@RequestMapping("list.bo")
	public String selectList1(int currentPage, Model model) {
		
		int listCount = bService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Board> list = bService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "board/boardListView";
	}
	
	@RequestMapping("enrollForm.bo")
	public String enrollForm() {
		return "board/boardEnrollForm";
	}
	
	@RequestMapping("insert.bo")
	public String insertBoard(Board b, HttpServletRequest request,
							  @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		//System.out.println(b);
		//System.out.println(file.getOriginalFilename()); // 첨부파일 있을 경우 원본명 / 첨부파일 없을 경우 빈문자열
		
		// 파일업로드 관련된 라이브러리 추가해야만 잘 담김!!
		
		// 현재 넘어온 파일이 있을 경우 서버에 업로드 후 원본명, 수정명 뽑아서 b 주섬주섬 담기
		if(!file.getOriginalFilename().equals("")) {
			
			// 서버에 파일 업로드 --> saveFile 메소드로 따로 빼서 정의할 것
			String changeName = saveFile(file, request);
			
			b.setOriginName(file.getOriginalFilename());
			b.setChangeName(changeName);
			
		}
		
		int result = bService.insertBoard(b);
		
		if(result > 0) { // 게시글 작성 성공 --> 갱신된 리스트가 보여지는 게시글 리스트 페이지 
			
			
			return "redirect:list.bo?currentPage=1";
			
		}else { // 게시글 작성 실패
			// 메세지 
			return "common/errorPage";
		}
		
		
	}
	
	
	@RequestMapping("detail.bo")
	public ModelAndView selectBoard(int bno, ModelAndView mv) {
		
		int result = bService.increaseCount(bno);
		
		if(result > 0) {
			
			Board b = bService.selectBoard(bno);
			mv.addObject("b", b);
			mv.setViewName("board/boardDetailView");
			
		}else { // 게시글 상세조회 실패
			
			mv.addObject("msg", "게시글 상세조회 실패!");
			mv.setViewName("common/errorPage");
			
		}
		
		return mv;
		
	}
	
	@RequestMapping("delete.bo")
	public String deleteBoard(int bno, String fileName, HttpServletRequest request, Model model) {
		
		int result = bService.deleteBoard(bno);
		
		if(result > 0) { // 게시글 삭제 성공 --> 기존의 첨부파일이 있었을 경우 서버에 삭제
			
			// 기존의 첨부파일이 있었을 경우(fileName에 빈문자열이 아닐꺼임)만 서버에 업로드된 파일 삭제
			if(!fileName.equals("")) {
				deleteFile(fileName, request);
			}
			
			return "redirect:list.bo?currentPage=1";
			
		}else { // 게시글 삭제 실패
			
			model.addAttribute("msg", "게시글 삭제 실패!!");
			return "common/errorPage";
			
		}		
		
	}
	
	
	@RequestMapping("updateForm.bo")
	public String updateForm(int bno, Model model) {
		
		model.addAttribute("b", bService.selectBoard(bno));
		return "board/boardUpdateForm";
		
	}
	
	@RequestMapping("update.bo")
	public String updateBoard(Board b, HttpServletRequest request, Model model,
							  @RequestParam(name="reUploadFile", required=false) MultipartFile file) {
		
		// 새로 넘어온 첨부파일이 있을 경우 --> 서버에 업로드 해야됨
		if(!file.getOriginalFilename().equals("")) {
			
			// 기존의 첨부파일의 있었을 경우 --> 업로드 된 파일 지워야 됨
			if(b.getChangeName() != null) {
				// 새로 넘어온 첨부파일도 있고 기존의 첨부파일도 있었을 경우
				deleteFile(b.getChangeName(), request);	
			}
			
			String changeName = saveFile(file, request);
			
			b.setChangeName(changeName);
			b.setOriginName(file.getOriginalFilename());
			
		}
		
		/*
		 * b = 게시글번호, 게시글제목, 게시글내용 
		 * 
		 * 1. 기존의 첨부파일 X, 새로 첨부된 파일 X
		 *    --> originName : null, changeName : null
		 * 
		 * 2. 기존의 첨부파일 X, 새로 첨부된 파일 O
		 *    --> 서버에 업로드 처리 후
		 *    --> originName : 새로첨부된파일원본명, changeName : 새로첨부된파일수정명
		 * 
		 * 3. 기존의 첨부파일 O, 새로 첨부된 파일 X
		 *    --> originName : 기존첨부파일원본명, changeName : 기존첨부파일수정명
		 * 
		 * 4. 기존의 첨부파일 O, 새로 첨부된 파일 O
		 *    --> 기존의 첨부파일 삭제 후
		 *    --> 새로첨부된 파일 서버에 업로드 후
		 *    --> originName : 새로첨부된파일원본명, changeName : 새로첨부된파일수정명
		 */
		
	/*
		int result = bService.updateBoard(b);
		
		if(result > 0) {
			
			return "redirect:detail.bo?bno=" + b.getBoardNo();
			
		}else {
			model.addAttribute("msg", "게시글 수정 실패!!");
			return "common/errorPage";
		}
		
	}
	
	
	
	// 전달받은 파일명을 가지고 서버로 부터 삭제하는 메소드
	public void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\uploadFiles\\";
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}
	
	
	// 공유해서 쓸수 있게끔 따로 정의 해놓은 메소드
	// 전달받은 파일을 서버에 업로드 시킨 후 수정명 리턴하는 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일을 업로드 시킬 폴더 경로 (String savePath)
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\uploadFiles\\";
		
		// 원본명 (aaa.jpg)
		String originName = file.getOriginalFilename();
		
		// 수정명 (20200522202011.jpg)
		// 년월일시분초 (String currentTime)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "20200522202011"
		
		// 확장자 (String ext)
		String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"
		
		String changeName = currentTime + ext;
		
				
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	@ResponseBody
	@RequestMapping(value="rlist.bo", produces="application/json; charset=utf-8")
	public String selectReplyList(int bno) {
		
		ArrayList<Reply> list = bService.selectReplyList(bno);
		// [{}, {}]
		
		//return new Gson().toJson(list); // 날짜 관련 기본 포맷      xx월 xx일, xxxx
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(list);
		
	}
	
	
	@ResponseBody
	@RequestMapping(value="rinsert.bo")
	public String insertReply(Reply r) {
		int result = bService.insertReply(r);
		
		if(result > 0) {
			return "success";
		}else {
			return "fail";
		}
		
	}
	*/
	
	// 여기부터 Admin 시작 (위에 참고용)
	
	// 주혁시작
	
	@RequestMapping("notice.ad")
	public String selectList(int currentPage, Model model) {
		
		int listCount = aService.selectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Notice> nlist = aService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("nlist", nlist);
		
		return "admin/adminNotice";
	}
	
	@ResponseBody
	@RequestMapping(value="noticeDetail.ad", produces="application/json; charset=utf-8")
	public String noticeDetail(String nno) {
		
		Notice noDetail = aService.noticeDetail(nno);
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(noDetail);
	}
	
	@ResponseBody
	@RequestMapping(value="insertNotice.ad")
	public String insertNotice(Notice n) {
		
		int result = aService.insertNotice(n);
		
		if(result > 0){
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="noticeDelete.ad")
	public String noticeDelete(String nno) {
		
		int result = aService.noticeDelete(nno);
		
		if(result > 0){
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="noticeUpdateIn.ad")
	public String noticeUpdatInsert(Notice n) {
		
		int result = aService.noticeUpdatInsert(n);
		
		if(result > 0){
			return "success";
		}else {
			return "fail";
		}
	}
	
	/* Question */	
	@RequestMapping("question.ad")
	public String questionSelectList(int currentPage, Model model) {
		
		int listCount = aService.questionSelectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		
		ArrayList<Question> qlist = aService.questionSelectList(pi);
		
		model.addAttribute("qpi", pi);
		model.addAttribute("qlist", qlist);
		
		return "admin/adminOneInqueiryList";
	}
	
	@ResponseBody
	@RequestMapping(value="qnaDetail.ad", produces="application/json; charset=utf-8")
	public String qnaDetail(String qno) {
		
		Question qnaDetail = aService.qnaDetail(qno);
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create().toJson(qnaDetail);
	}
	
	@ResponseBody
	@RequestMapping(value="qnaAns.ad")
	public String qnaAnsUpdate(Question q) {
		
		System.out.println(q);
		int result = aService.qnaAnsUpdate(q);
		
		if(result > 0){
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	@ResponseBody
	@RequestMapping(value="qnaDelete.ad")
	public String qnaDelete(String qno) {
		
		int result = aService.qnaDelete(qno);
		
		if(result > 0){
			return "success";
		}else {
			return "fail";
		}
		
	}
	
	/* Category */
	@RequestMapping("category.ad")
	public String adminMain(Model model) {
		
		ArrayList<Category> clist = aService.categoryList();
		
		model.addAttribute("clist", clist);
		
		return "admin/adminCategory";
	}
	
	@RequestMapping("insertCategory.ad")
	public String insertCategory(Category c, HttpServletRequest request,
							  @RequestParam(name="uploadFile", required=false) MultipartFile file) {
		
		// 파일 업로드시 참조번호를 먼저 뽑아서 "C"+숫자값의 +1 하여 setRefNo에 담기 (여러테이블을 참조하기 위하여 사용)
		
		//System.out.println("객체테스트 : " + c);
		//System.out.println("파일테스트(원본) : " + file.getOriginalFilename()); // 첨부파일 있을 경우 원본명 / 첨부파일 없을 경우 빈문자열
		
		// 파일업로드 관련된 라이브러리 추가해야만 잘 담김!!
		
		System.out.println(c.getOriginName());
		System.out.println("file.getOri : " + file.getOriginalFilename());
		// 현재 넘어온 파일이 있을 경우 서버에 업로드 후 원본명, 수정명 뽑아서 c 주섬주섬 담기
		if(!file.getOriginalFilename().equals("")) {
			
			// 서버에 파일 업로드 --> saveFile 메소드로 따로 빼서 정의할 것
			String changeName = saveFile(file, request);
			
			c.setOriginName(file.getOriginalFilename());
			c.setChangeName(changeName);
			
			System.out.println("파일테스트(변경) : " + changeName);
		}
		System.out.println("객체테스트2 : " + c);
		
		int result = aService.insertCategory(c);
		
		if(result > 0) { // 게시글 작성 성공 --> 갱신된 리스트가 보여지는 게시글 리스트 페이지 
			String refNo = aService.refNoCategory();
			c.setRefNo(refNo);
			
			int result2 = aService.insertAttachment(c);
			
			if(result2 > 0) {
				return "redirect:category.ad";
			}else {
				return "common/errorPage";
			}
			
		}else {
			return "common/errorPage";
		}
		
	}
	
	// 카테고리 디테일
	@ResponseBody
	@RequestMapping(value="categoryDetail.ad", produces="application/json; charset=utf-8")
	public String categoryDetail(String cno) {
		
		Category categoryDetail = aService.categoryDetail(cno);
		System.out.println("객체 테스트 : " + categoryDetail);
		
		return new GsonBuilder().setDateFormat("yyyy년 MM월 dd일").create().toJson(categoryDetail);
	}
	
	// 카테고리 수정
	@RequestMapping("updateCategory.ad")
	public String updateBoard(Category c, HttpServletRequest request, Model model,
							  @RequestParam(name="reUploadFile", required=false) MultipartFile file) {
		System.out.println("전 : " + c);
		// 새로 넘어온 첨부파일이 있을 경우 --> 서버에 업로드 해야됨
		if(!file.getOriginalFilename().equals("")) {
			
			// 기존의 첨부파일의 있었을 경우 --> 업로드 된 파일 지워야 됨
			if(c.getChangeName() != null) {
				// 새로 넘어온 첨부파일도 있고 기존의 첨부파일도 있었을 경우
				deleteFile(c.getChangeName(), request);	
			}
			
			String changeName = saveFile(file, request);
			
			c.setChangeName(changeName);
			c.setOriginName(file.getOriginalFilename());
			
		}
		
		System.out.println("후 : " + c);
		
		int result = aService.updateCategory(c);
		
		if(result > 0) {
			
			int result2 = aService.updateCategory2(c);
			
			if(result2 > 0) {
				return "redirect:category.ad";
			}else {
				return "common/errorPage";
			}
			
		}else {
			model.addAttribute("msg", "게시글 수정 실패!!");
			return "common/errorPage";
		}
		
	}
	
	// 카테고리 삭제
	
	@RequestMapping("deleteCategory.ad")
	public String delete(String cno, HttpServletRequest request, Model model) {
		
		int result = aService.deleteCategory(cno);
		
		if(result > 0) { // 게시글 삭제 성공 --> 기존의 첨부파일이 있었을 경우 서버에 삭제
			String fileName = aService.deleteCategoryFile(cno);
			
			System.out.println(fileName);
			
			// 기존의 첨부파일이 있었을 경우(fileName에 빈문자열이 아닐꺼임)만 서버에 업로드된 파일 삭제
			if(!fileName.equals("")) {
				deleteFile(fileName, request);
			}
			
			return "redirect:category.ad";
			
		}else { // 게시글 삭제 실패
			
			model.addAttribute("msg", "카테고리 삭제 실패!!");
			return "common/errorPage";
			
		}		
		
	}
	
	/*
	 * b = 게시글번호, 게시글제목, 게시글내용 
	 * 
	 * 1. 기존의 첨부파일 X, 새로 첨부된 파일 X
	 *    --> originName : null, changeName : null
	 * 
	 * 2. 기존의 첨부파일 X, 새로 첨부된 파일 O
	 *    --> 서버에 업로드 처리 후
	 *    --> originName : 새로첨부된파일원본명, changeName : 새로첨부된파일수정명
	 * 
	 * 3. 기존의 첨부파일 O, 새로 첨부된 파일 X
	 *    --> originName : 기존첨부파일원본명, changeName : 기존첨부파일수정명
	 * 
	 * 4. 기존의 첨부파일 O, 새로 첨부된 파일 O
	 *    --> 기존의 첨부파일 삭제 후
	 *    --> 새로첨부된 파일 서버에 업로드 후
	 *    --> originName : 새로첨부된파일원본명, changeName : 새로첨부된파일수정명
	 */
	
	// 전달받은 파일명을 가지고 서버로 부터 삭제하는 메소드
	public void deleteFile(String fileName, HttpServletRequest request) {
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\uploadFiles\\";
		
		File deleteFile = new File(savePath + fileName);
		deleteFile.delete();
	}
	
	// 공유해서 쓸수 있게끔 따로 정의 해놓은 메소드
	// 전달받은 파일을 서버에 업로드 시킨 후 수정명 리턴하는 메소드
	public String saveFile(MultipartFile file, HttpServletRequest request) {
		
		// 파일을 업로드 시킬 폴더 경로 (String savePath)
		String resources = request.getSession().getServletContext().getRealPath("resources");
		String savePath = resources + "\\uploadFiles\\";
		
		// 원본명 (aaa.jpg)
		String originName = file.getOriginalFilename();
		
		// 수정명 (20200522202011.jpg)
		// 년월일시분초 (String currentTime)
		String currentTime = new SimpleDateFormat("yyyyMMddHHmmss").format(new Date()); // "20200522202011"
		
		// 확장자 (String ext)
		String ext = originName.substring(originName.lastIndexOf(".")); // ".jpg"
		
		String changeName = currentTime + ext;
				
		try {
			file.transferTo(new File(savePath + changeName));
		} catch (IllegalStateException | IOException e) {
			e.printStackTrace();
		}
		
		return changeName;
		
	}
	
	// 결재내역
	@RequestMapping("adminProjectPayTotal.ad")
	public String adminProjectPayTotal() {
		
		// 프로젝트 번호만 조회해와서 ArrayList에 담고 그걸 이용하여 selectOne문을 포문으로 길이만큼 실행
		// 실행해온 값을 포문안에 ArrayList에 add 해준다 그걸 키 밸류로 보내서 리스트 출력을 한다.
		
		ArrayList<PayTotal> list = new ArrayList<>();
		
		//참고 
		/*
		 */
		// 리스트 미리 만들어두기!
		 ArrayList<PayTotal> ex = new ArrayList<>();
		 for(int i=0; i<10; i++) {
		// 객체에 주섬주섬 담아서 그값을 for문 도는동안 리스트에 넣기!
		 PayTotal zz = new PayTotal("one", "one", "one", "one", 1, 1, 1, "2020-05-05", "one", 1);
		 
		 // 리스트에 넣는 과정
	        ex.add(zz);
	        /*
	        ex.add("two");
	        ex.add("three");
	        */
	        
		 }
		 
		 // 리스트에 잘 담겼는지 확인용 
		 for(int j=0; j<ex.size(); j++){
			 System.out.println(ex.get(j));
		 }
		 
		return "admin/adminProjectPayTotal";
	}
	
	
	// 주혁 끝
	
}















