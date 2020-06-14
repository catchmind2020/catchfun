package com.catchmind.catchfun.admin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catchmind.catchfun.admin.model.service.AdminService2;
import com.catchmind.catchfun.admin.model.vo.Member;
import com.catchmind.catchfun.admin.model.vo.Project;
import com.catchmind.catchfun.admin.model.vo.ProjectDetail;
import com.catchmind.catchfun.admin.model.vo.ProjectReturn;
import com.catchmind.catchfun.admin.model.vo.Reply;
import com.catchmind.catchfun.common.model.vo.PageInfo;
import com.catchmind.catchfun.common.template.Pagination;
import com.catchmind.catchfun.funding.model.vo.FundingList;
import com.catchmind.catchfun.funding.model.vo.Maker;
import com.catchmind.catchfun.funding.model.vo.News;
import com.catchmind.catchfun.funding.model.vo.Reward;

@Controller
public class AdminController2 {
	
	@Autowired
	private AdminService2 aService2;
	
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
	
	/*
	 * // 주혁시작
	 * 
	 * @RequestMapping("category.ad") public String adminMain() { return
	 * "admin/adminCategory"; }
	 * 
	 * 
	 * @RequestMapping("notice.ad") public String selectList(int currentPage, Model
	 * model) {
	 * 
	 * int listCount = aService.selectListCount();
	 * 
	 * PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
	 * 
	 * ArrayList<Notice> nlist = aService.selectList(pi);
	 * 
	 * model.addAttribute("pi", pi); model.addAttribute("nlist", nlist);
	 * 
	 * return "admin/adminNotice"; }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="noticeDetail.ad",
	 * produces="application/json; charset=utf-8") public String noticeDetail(String
	 * nno) {
	 * 
	 * Notice noDetail = aService.noticeDetail(nno);
	 * 
	 * return new
	 * GsonBuilder().setDateFormat("yyyy년 MM월 dd일 HH:mm:ss").create().toJson(
	 * noDetail); }
	 * 
	 * @RequestMapping("inqueiry.ad") public String adminOneInqueiryList() { return
	 * "admin/adminOneInqueiryList"; }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="insertNotice.ad") public String insertNotice(Notice n)
	 * {
	 * 
	 * int result = aService.insertNotice(n);
	 * 
	 * System.out.println("이거실행?? : " + result);
	 * 
	 * if(result > 0){ return "success"; }else { return "fail"; }
	 * 
	 * }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="noticeDelete.ad") public String noticeDelete(String
	 * nno) {
	 * 
	 * int result = aService.noticeDelete(nno);
	 * 
	 * if(result > 0){ return "success"; }else { return "fail"; }
	 * 
	 * }
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping(value="noticeUpdateIn.ad") public String
	 * noticeUpdatInsert(Notice n) {
	 * 
	 * int result = aService.noticeUpdatInsert(n);
	 * 
	 * System.out.println("요거실행!!! : " + result);
	 * 
	 * if(result > 0){ return "success"; }else { return "fail"; }
	 * 
	 * }
	 * 
	 * // 주혁 끝
	 */	
	
	/**
	 * 회원 리스트페이지
	 */
	@RequestMapping("member.ad")
	public String adminMemberList(int currentPage, Model model) {
		  int listCount = aService2.memberListCount();
		 
		
		  PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 2);
		 
		  ArrayList<Member> mlist = aService2.memberList(pi);
		  
		  model.addAttribute("pi", pi); 
		  model.addAttribute("mlist", mlist);
		  
		return "admin/adminMember";
	}
	
	@RequestMapping("msearch.ad")
	public String adminMemberSearch(int currentPage, Model model, String keyword) {
		
		int listCount = aService2.memberSearchCount(keyword);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 2);
		
		ArrayList<Member> mlist = aService2.memberSearch(pi, keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("mlist", mlist);
		
		return "admin/adminMemberSearch";
		
	}
	@RequestMapping("adMemberSelect.ad")
	public String adMemberSelect(Member m, Model model) {
		
				
		int result = aService2.memberSelect(m);
		
		return "redirect:member.ad?currentPage=1";
		
	}
	
	
	@RequestMapping("black.ad")
	public String adminBlackList(int currentPage, Model model) {
		  int listCount = aService2.blackListCount();
		 
		
		  PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 2);
		 
		  ArrayList<Member> blist = aService2.blackList(pi);
		  
		  model.addAttribute("pi", pi);
		  model.addAttribute("blist", blist);
		  
		return "admin/adminBlackList";
	}
	
	
	@RequestMapping("bsearch.ad")
	public String adminBlackSearch(int currentPage, Model model, String keyword) {
		
		int listCount = aService2.blackSearchCount(keyword);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 2);
		
		ArrayList<Member> blist = aService2.blackSearch(pi, keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("blist", blist);
		
		return "admin/adminBlackListSearch";
		
	}
	
	@RequestMapping("adBlackUpdate.ad")
	public String adBlackUpdate(Member m, Model model ) {
		
		int result = aService2.blackUpdate(m);
		
		return "redirect:black.ad?currentPage=1";
		
	}
	
	
	
	/**
	 * 댓글/프로젝트 신고 리스트페이지
	 */
	@RequestMapping("report.ad")
	public String adminReportList(int currentPage, Model model) {
		int listCount = aService2.reportListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 2);
		
		ArrayList<Reply> rlist = aService2.reportList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("rlist", rlist);
		
		
		return "admin/adminReport";
	}
	
	@RequestMapping("rSearch.ad")
	public String adminReportSearch(int currentPage, Model model, String keyword) {
		
		int listCount = aService2.reportSearchCount(keyword);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 2);
		
		ArrayList<Reply> rlist = aService2.reportSearch(pi, keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("rlist", rlist);
		
		return "admin/adminReportSearch";
	}
	
	@RequestMapping("pReport.ad")
	public String adminpProReportList(int currentPage, Model model) {
		int listCount = aService2.proReportListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 2);
		
		ArrayList<Project> prlist = aService2.proReportList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("prlist", prlist);
		
		
		return "admin/adminPjReport";
	}
	
	@RequestMapping("prSearch.ad")
	public String adminProReportSearch(int currentPage, Model model, String keyword) {
		
		int listCount = aService2.proReportSearchCount(keyword);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 2);
		
		ArrayList<Project> prlist = aService2.proReportSearch(pi, keyword);
		
		model.addAttribute("pi", pi);
		model.addAttribute("prlist", prlist);
		
		return "admin/adminPjReportSearch";
	}
	
	@RequestMapping("reportDetail.ad")
	public String adminReportDetail(String rd, Model model) {
		
		Reply rp = aService2.rpReportDetail(rd);
		
		model.addAttribute("rp", rp);
		
		return "admin/adminReportDetail";
	}
	
	@RequestMapping("reportBlack.ad")
	public String reportBlack(String userNo, Model model) {
		
		int result = aService2.reportBlack(userNo);
		
		return "redirect:report.ad?currentPage=1";
		
	}
	
	@RequestMapping("pjReportDetail.ad")
	public String adminpjReportDetail(String rd, Model model) {
		
		Project pj = aService2.pjReportDetail(rd);
		
		model.addAttribute("pj", pj);
		return "admin/adminPjReportDetail";
		
	}
	
	@RequestMapping("pjDelete.ad")
	public String pjDelete(String projectNumber, Model model) {
		
		int result = aService2.pjDelete(projectNumber);
		
		return "redirect:pReport.ad?currentPage=1";
	}
	
	@RequestMapping("projectList.ad")
	public String projectList(int currentPage, Model model) {
		int listCount = aService2.projectListCount();
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 2);
		
		ArrayList<Project> plist = aService2.projectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("plist", plist);
		
		return "admin/adminProjectList";
		
	}
	
	@RequestMapping("projectSearch.ad")
	public String projectSearch(int currentPage, Model model, String proCategory) {
		int listCount = aService2.projectSearchCount(proCategory);
		
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 2);
		
		ArrayList<Project> plist = aService2.projectSearch(pi, proCategory);
		
		model.addAttribute("pi", pi);
		model.addAttribute("plist", plist);
		
		return "admin/adminProjectSearch"; 
	}
	
	@RequestMapping("projectDetail.ad")
	public ModelAndView selectProject(String pno, ModelAndView mv, HttpSession session) {
		
		ProjectDetail p = aService2.selectProject(pno); // 프로젝트 정보
		Maker m = aService2.selectMaker(pno); // 메이커 정보
		FundingList fl = aService2.selectFunding(pno); // 펀딩 내역 정보 (현재 펀딩금액, 수량 파악)
		ArrayList<Reward> rlist = aService2.selectReward(pno); // 리워드 정보
		// ArrayList<Reward> rCountlist = fService.selectRewardCount(pno); // 리워드별 합계 정보
		
		ArrayList<News> nlist = aService2.selectNews(pno); // 새소식 정보

		mv.addObject("p", p);
		mv.addObject("m", m);
		mv.addObject("fl", fl);
		mv.addObject("rlist", rlist);
		mv.addObject("pno", pno);
		// mv.addObject("rCountlist", rCountlist);
		mv.addObject("nlist", nlist);
		System.out.println(p);
		System.out.println(m);
		System.out.println(fl);
		System.out.println(rlist);
		System.out.println(nlist);
		System.out.println(pno);
		
		mv.setViewName("admin/adminProjectDetail");

		return mv;
	}
	
	@RequestMapping("projectApproval.ad")
	public String projectApproval(String pno, Model model) {
		
		aService2.updateProject(pno); // 프로젝트 정보
		aService2.updateMaker(pno); // 메이커 정보
		aService2.updateFunding(pno); // 펀딩 내역 정보 (현재 펀딩금액, 수량 파악)
		aService2.updateReward(pno); // 리워드 정보
		aService2.updateNews(pno); // 새소식 정보
		
		return "redirect:projectList.ad?currentPage=1";
		
	}
	
	@RequestMapping("projectReturn.ad")
	public String projectReturn(String pno, String returnContent, Model model) {
		
		ProjectReturn p = new ProjectReturn();
		p.setProjectNumber(pno);
		p.setReturnContent(returnContent);
		
		aService2.insertReturn(p);
		
		aService2.returnProject(pno); // 프로젝트 정보
		aService2.returnMaker(pno); // 메이커 정보
		aService2.returnFunding(pno); // 펀딩 내역 정보 (현재 펀딩금액, 수량 파악)
		aService2.returnReward(pno); // 리워드 정보
		aService2.returnNews(pno); // 뉴스 정보
		
		return "redirect:projectList.ad?currentPage=1";
		
	}
	
	/**
	 * 매출 통계 리스트페이지
	 */
	@RequestMapping("sales.ad")
	public String adminSales(Model model) {
		
		int sales6 = aService2.sales6();
		int sales7 = aService2.sales7();
		int sales8 = aService2.sales8();
		int sales9 = aService2.sales9();
		int sales10 = aService2.sales10();
		
		model.addAttribute("sales6", sales6);
		model.addAttribute("sales7", sales7);
		model.addAttribute("sales8", sales8);
		model.addAttribute("sales9", sales9);
		model.addAttribute("sales10", sales10);
		return "admin/adminSales";
	}
	
	@RequestMapping("salesSearch.ad")
	public String adminSalesSearch(String sDate, Model model) {

		int sales1 = aService2.sales1(sDate);
		int sales2 = aService2.sales2(sDate);
		int sales3 = aService2.sales3(sDate);
		int sales4 = aService2.sales4(sDate);
		int sales5 = aService2.sales5(sDate);
		model.addAttribute("sales1", sales1);
		model.addAttribute("sales2", sales2);
		model.addAttribute("sales3", sales3);
		model.addAttribute("sales4", sales4);
		model.addAttribute("sales5", sales5);
		return "admin/adminSalesSearch";
	}
	
	/*
	 * @RequestMapping("salesSearch.ad") public String adminSalesSearch(String
	 * sDate, Model model) {
	 * 
	 * }
	 */

	
	
}















