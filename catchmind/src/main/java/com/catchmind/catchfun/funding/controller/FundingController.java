package com.catchmind.catchfun.funding.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.catchmind.catchfun.funding.model.service.FundingService;
import com.catchmind.catchfun.funding.model.vo.FundingList;
import com.catchmind.catchfun.funding.model.vo.Maker;
import com.catchmind.catchfun.funding.model.vo.News;
import com.catchmind.catchfun.funding.model.vo.PersonQuestion;
import com.catchmind.catchfun.funding.model.vo.Project;
import com.catchmind.catchfun.funding.model.vo.Reply;
import com.catchmind.catchfun.funding.model.vo.Report;
import com.catchmind.catchfun.funding.model.vo.Reward;
import com.catchmind.catchfun.funding.model.vo.Wishlist;
import com.google.gson.GsonBuilder;

@Controller
public class FundingController {

	@Autowired
	private FundingService fService;

	@RequestMapping("detail.pro")
	public ModelAndView selectProject(String pno, ModelAndView mv, HttpSession session) {
		
		/*
		Wishlist w = new Wishlist();
		int wResult = 4;
		int wr = 4;
		
		if( loginUser != null ) { // 로그인 되어있으면
			
			w.setUserNo((String)session.getAttribute(userId));
			w.setProjectNumber(pno);
			
			System.out.println("a");
			Sfystem.out.println(w);
			wResult = fService.selectWish(w);  // 찜하기 내역 정보
			System.out.println(wResult);
		} 
		
		if(wResult > 0) { // 찜내역 있음
			
			wr = 1;
			mv.addObject("wr", 1);
			
		}else { // 찜내역 없음
			
			wr = 0;
			mv.addObject("wr", 0);
		}
		*/
		
		Project p = fService.selectProject(pno); // 프로젝트 정보
		Maker m = fService.selectMaker(pno); // 메이커 정보
		FundingList fl = fService.selectFunding(pno); // 펀딩 내역 정보 (현재 펀딩금액, 수량 파악)
		ArrayList<Reward> rlist = fService.selectReward(pno); // 리워드 정보
		// ArrayList<Reward> rCountlist = fService.selectRewardCount(pno); // 리워드별 합계 정보
		
		ArrayList<News> nlist = fService.selectNews(pno); // 새소식 정보

		mv.addObject("p", p);
		mv.addObject("m", m);
		mv.addObject("fl", fl);
		mv.addObject("rlist", rlist);
		// mv.addObject("rCountlist", rCountlist);
		
		mv.addObject("nlist", nlist);
		

		mv.setViewName("funding/fundingDetail");

		return mv;
	}

	// 댓글 출력
	@ResponseBody
	@RequestMapping(value = "rlist.pro", produces = "application/json; charset=utf-8")
	public String selectReplyList(String pno) {

		ArrayList<Reply> list = fService.selectReplyList(pno);
		//System.out.println(list);

		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);

	}

	// 댓글 등록
	@ResponseBody
	@RequestMapping("rinsert.pro") 
	public String insertReply(Reply r) {
		
		int result = fService.insertReply(r);
		
		if(result > 0) { return "success"; }else { return "fail"; } 
	
	}

	// 댓글 신고
	@ResponseBody
	@RequestMapping("rBan.pro") 
	public String banReply(String replyNo) {
		
		int result = fService.banReply(replyNo);
		
		if(result > 0) { return "success"; }else { return "fail"; } 
	
	}
	
	// 개설자 문의 등록
	@RequestMapping("qinsert.pro") 
	public String insertQuestion(PersonQuestion pq, String pno, HttpSession session) {
		
		int result = fService.insertQuestion(pq);
		//System.out.println(pno);
		
		if(result > 0) { 
			
			session.setAttribute("msg", "문의가 정상적으로 전송되었습니다. 답변은 마이페이지에서 확인 가능합니다.");
			return "redirect:detail.pro?pno=" + pno;
			
		}else {
			
			session.setAttribute("msg", "문의 등록에 실패하였습니다. 다시 시도해주세요.");
			return "redirect:detail.pro?pno=" + pno;
		} 
	}
	
	// 개설자 신고 등록
	@RequestMapping("binsert.pro") 
	public String insertReport(Report r, HttpSession session) {
		
		int list = fService.selectReport(r);
		//System.out.println(list);
		
		if(list == 0) {	// 신고 내역이 없을 때
			
			int result = fService.insertReport(r);
			
			if(result > 0) { 
				
				session.setAttribute("msg", "신고가 정상적으로 전송되었습니다.");
				return "redirect:detail.pro?pno=" + r.getReportNo();
				
			}else {
				
				session.setAttribute("msg", "신고 등록에 실패하였습니다. 다시 시도해주세요.");
				return "redirect:detail.pro?pno=" + r.getReportNo();
			} 
			
		}else {	// 신고 내역이 있을 때
			session.setAttribute("msg", "이미 신고된 내역이 있습니다.");
			return "redirect:detail.pro?pno=" + r.getReportNo();
		}
	}

	// 찜하기
	@ResponseBody
	@RequestMapping("selectWishlist.pro")
	public String selectWishlist(Wishlist w, HttpSession session) {

		int result1 = fService.selectWishlistCount(w);

		if(result1 > 0) { // 찜목록 있음 
			return "yes";
		}else { // 찜목록 없음 
			return "no";
		}
	}
	
	// 찜하기
	@ResponseBody
	@RequestMapping("updateWish.pro")
	public String selectWishlistCount(Wishlist w, HttpSession session) {

		int result1 = fService.selectWishlistCount(w);
		
		// 찜하기 0일때 추가, 1일때 삭제
		if(result1 > 0) { // 찜목록 있음 --> 삭제
			
			int result3 = fService.deleteWishlist(w);
			return "delete";
			
		}else { // 찜목록 없음 --> 추가
			
			int result2 = fService.addWishlist(w);
			return "add";
		}
		
		
		/*
		int result = fService.insertWishlist(w);
		//System.out.println(w);

		if(result > 0) { 
			
			session.setAttribute("msg", "찜하기 추가 완료. 마이페이지에서 확인해보세요.");
			
			
			
			
		}else {
			
			session.setAttribute("msg", "찜하기를 실패하였습니다. 다시 시도해주세요.");
		} 
		
		//mv.setViewName("funding/fundingPayBooking");

		return "redirect:detail.pro?pno=" + w.getProjectNumber();
		*/
		
	}
	
	
	
	
	@RequestMapping("rewardList.pay")
	public ModelAndView selectReward(String pno, ModelAndView mv) {

		Project p = fService.selectProject(pno); // 프로젝트 정보
		Maker m = fService.selectMaker(pno); // 메이커 정보
		FundingList fl = fService.selectFunding(pno); // 펀딩 내역 정보 (현재 펀딩금액, 수량 파악)
		ArrayList<Reward> rlist = fService.selectReward(pno); // 리워드 정보

		mv.addObject("p", p);
		mv.addObject("m", m);
		mv.addObject("fl", fl);
		mv.addObject("rlist", rlist);

		mv.setViewName("funding/fundingPayRewardList");

		return mv;
	}
	
	@RequestMapping("booking.pay")
	public ModelAndView selectBooking(ModelAndView mv) {

		//Project p = fService.selectProject(pno); // 프로젝트 정보
		//Maker m = fService.selectMaker(pno); // 메이커 정보
		//FundingList fl = fService.selectFunding(pno); // 펀딩 내역 정보 (현재 펀딩금액, 수량 파악)
		//ArrayList<Reward> rlist = fService.selectReward(pno); // 리워드 정보

		//mv.addObject("p", p);
		//mv.addObject("m", m);
		//mv.addObject("fl", fl);
		//mv.addObject("rlist", rlist);

		mv.setViewName("funding/fundingPayBooking");

		return mv;
	}
}
