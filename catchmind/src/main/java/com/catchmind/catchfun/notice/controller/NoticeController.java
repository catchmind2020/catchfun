package com.catchmind.catchfun.notice.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catchmind.catchfun.common.model.vo.PageInfo;
import com.catchmind.catchfun.common.template.Pagination;
import com.catchmind.catchfun.member.model.vo.Member;
import com.catchmind.catchfun.notice.model.service.NoticeService;
import com.catchmind.catchfun.notice.model.vo.CatchfunQuestion;
import com.catchmind.catchfun.notice.model.vo.Notice;

@Controller
public class NoticeController {
	
	@Autowired
	private NoticeService ntService;

	
	/********************************************************************************
	 * 									Notice
	 ******************************************************************************** /
	
	/**
	 * 공지사항 리스트 
	 */
	@RequestMapping("list.no")
	public String selectList(int currentPage, Model model) {
	
		
		int listCount = ntService.selectListCount();
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<Notice> list = ntService.selectList(pi);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "notice/noticeListView";
	}
	
	
	/**
	 * 공지사항 상세조회 
	 */
	@RequestMapping("detail.no")
	public ModelAndView selectBoard(String nno, ModelAndView mv) {
		
		int result = ntService.increaseCount(nno);
		
		if(result > 0) {
			
			Notice n = ntService.selectNotice(nno);
			mv.addObject("n", n);
			mv.setViewName("notice/noticeDetailView");
			
		}else { // 공지글 상세조회 실패
			
			mv.addObject("msg", "공지글 상세조회 실패!");
			mv.setViewName("common/errorPage");
		}
		
		return mv;
		
	}
	

	/********************************************************************************
	 * 									Guide
	 ********************************************************************************/
	

	// Guide
	
	@RequestMapping("guide.gu")
	public String notice(Model model) { 
		
		return "notice/guide";
	}
	
	
	
	
	
	/********************************************************************************
	 * 								CatchfunQuestion
	 ********************************************************************************/
	
	
	/**
	 * 캐치펀 1:1 리스트 
	 */
	@RequestMapping("list.cq")
	public String cqSelectList(int currentPage,HttpSession session, Model model) {
		
		Member loginUser = (Member)(session.getAttribute("loginUser"));
		
		if(loginUser != null) {
		
		String userNo = loginUser.getUserNo();
		int listCount = ntService.cqselectListCount(userNo);	// 게시판 글갯수 조회용
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 10, 5);
		ArrayList<CatchfunQuestion> list = ntService.cqselectList(pi, userNo);
		
		model.addAttribute("pi", pi);
		model.addAttribute("list", list);
		
		return "notice/CatchfunQuestionListView";
		
		} else { 
			
			model.addAttribute("msg", "로그인 후 이용해주세요. ");
			return "common/errorPage";
			
		}
	}
	
	/**
	 * 캐치펀 1:1  상세조회 
	 */
	@RequestMapping("detail.cq")
	public ModelAndView selectCatchfunQu(String qno, ModelAndView mv) {
		
			CatchfunQuestion q = ntService.selectCatchfunQu(qno);
			mv.addObject("q", q);
			mv.setViewName("notice/CatchfunQuestionDetailView");
			
		return mv;
		
	}
	
	@RequestMapping("enrollForm.cq")
	public String enrollForm() {
		return "notice/CatchfunQuestionEnrollForm";
	}
	
	
	@RequestMapping("insert.cq")
	public String insertBoard(CatchfunQuestion q, HttpSession session, Model model) {
		
		Member loginUser = (Member)(session.getAttribute("loginUser"));
		String userNo = loginUser.getUserNo();
		
		int result = ntService.insertCatchfunQuestion(q, userNo);
		if(result > 0) { // 게시글 작성 성공 --> 갱신된 리스트가 보여지는 게시글 리스트 페이지 
			return "redirect:list.cq?currentPage=1";
		}else { // 게시글 작성 실패
			return "common/errorPage";
		}
	}
	
	
	@RequestMapping("delete.cq")
	public String deleteBoard(String qno, Model model) {
		
		int result = ntService.deleteCatchfunQuestion(qno);
		if(result > 0) { // 게시글 삭제 성공 --> 기존의 첨부파일이 있었을 경우 서버에 삭제
			return "redirect:list.cq?currentPage=1";
		}else { // 게시글 삭제 실패
			model.addAttribute("msg", "게시글 삭제 실패!!");
			return "common/errorPage";
			
		}		
		
	}

}
