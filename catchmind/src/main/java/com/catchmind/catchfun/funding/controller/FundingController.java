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
		
		//System.out.println("a");
		//int result = fService.banReply(replyNo);
		int result = fService.increasebanReply(replyNo);
		
		if(result > 0) { return "success"; }else { return "fail"; } 
	
	}
	
	// 댓글 삭제
	@ResponseBody
	@RequestMapping("deleteReply.pro") 
	public String deleteReply(String replyNo) {

		int result = fService.deleteReply(replyNo);
		
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
			
			int count = fService.increasebanReport(r); 	// 카운트 증가
			int result = fService.insertReport(r); 				// 신고 내용 등록
			
			if(result > 0 && count > 0) { 
				
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
	public ModelAndView selectReward(String pno, String rno, ModelAndView mv) {

		Project p = fService.selectProject(pno); // 프로젝트 정보
		Maker m = fService.selectMaker(pno); // 메이커 정보
		FundingList fl = fService.selectFunding(pno); // 펀딩 내역 정보 (현재 펀딩금액, 수량 파악)
		ArrayList<Reward> rlist = fService.selectReward(pno); // 리워드 정보

		mv.addObject("p", p);
		mv.addObject("m", m);
		mv.addObject("fl", fl);
		mv.addObject("rlist", rlist);
		mv.addObject("rno", rno);

		mv.setViewName("funding/fundingPayRewardList");

		return mv;
	}
	
	@RequestMapping("booking.pay")
	public ModelAndView selectBooking(String pno, FundingList fl, ModelAndView mv, HttpSession session) {
		
		//System.out.println(fl);
		
		String rewardNo[] = fl.getRewardNo().split(",");
		String userNo = fl.getUserNo();
		
		String count[] = fl.getFundingQuantity2().split(",");
		String cost[] = fl.getFundingCost2().split(",");
		String title[] = fl.getFundingTitle2().split(",");
		String content[] = fl.getFundingProduct().split(",");
		int spon = fl.getFundingSponsership();
		
		int sum = 0;
		ArrayList<FundingList> flList = new ArrayList<FundingList>();
		
		for(int i=0; i<rewardNo.length; i++) {

			FundingList f = new FundingList();
			
			f.setUserNo(userNo);
			f.setRewardNo(rewardNo[i]);
			f.setProjectNumber(pno);
			f.setFundingProduct(content[i]);
			f.setFundingCost(Integer.parseInt(cost[i]));
			f.setFundingQuantity(Integer.parseInt(count[i]));
			
			f.setFundingTitle2(title[i]);

			sum += Integer.parseInt(cost[i]) * Integer.parseInt(count[i]);
			
			flList.add(f);
		}
		
		session.setAttribute("flList", flList);  	// 선택한 리워드
		session.setAttribute("spon", spon);			// 후원금
		session.setAttribute("sum", sum);			// 리워드 합계
		
		Project p = fService.selectProject(pno); // 프로젝트 정보
		Maker m = fService.selectMaker(pno); // 메이커 정보
		//FundingList fl = fService.selectFunding(pno); // 펀딩 내역 정보 (현재 펀딩금액, 수량 파악)
		ArrayList<Reward> rlist = fService.selectReward(pno); // 리워드 정보

		mv.addObject("p", p);
		mv.addObject("m", m);
		mv.addObject("fl", fl); // 넘어온 펀딩 내역
		mv.addObject("rlist", rlist);

		mv.setViewName("funding/fundingPayBooking");

		return mv;
	}
	
	
	
	@RequestMapping("dopay.pay")
	public ModelAndView payment(String pno, int finalSum, String shipMemo, int currentPoint, int usePoint, String paymentMethod, ModelAndView mv, HttpSession session) {
		
		//System.out.println(pno + " " + finalSum + " " + shipMemo + " " + currentPoint + " " + usePoint + " " + paymentMethod);
		Project p = fService.selectProject(pno); // 프로젝트 정보
		Maker m = fService.selectMaker(pno); // 메이커 정보
		//FundingList fl = fService.selectFunding(pno); // 펀딩 내역 정보 (현재 펀딩금액, 수량 파악)
		//ArrayList<Reward> rlist = fService.selectReward(pno); // 리워드 정보
		mv.addObject("p", p);
		mv.addObject("m", m);
		
		// 1. 펀딩 내역 insert 
		// --> for문으로 여러개 저장 (PL-SQL로)--> 벗, 사용포인트, 후원금은 한번만 저장
		ArrayList<FundingList> flList = (ArrayList<FundingList>)(session.getAttribute("flList"));
		
		int spon = (int)session.getAttribute("spon");

		//System.out.println(flList);
		int[] result = new int[flList.size()];
		int count = 0;
		
		for(int i=0; i<flList.size(); i++) {	
			
			FundingList f = flList.get(i);
			
			if(i == 0) {	// 0번 객체
				
				f.setPaymentMethod(paymentMethod); 	// 결제번호
				f.setFundingSponsership(spon);		// 후원금 저장
				f.setShipMemo(shipMemo); 			// 배송메모 저장
				f.setUsePoint(usePoint); 			// 포인트 저장
				
			}else {
				
				f.setPaymentMethod(paymentMethod);	// 결제번호
				f.setFundingSponsership(0);			// 후원금 저장
				f.setShipMemo(shipMemo); 			// 배송메모 저장
				f.setUsePoint(0); 					// 포인트 저장
				
			}
			
			//System.out.println(f);
			result[i] = fService.insertFundingList(f);
			
			if(result[i] > 0) { // insert 성공
				count = count + 1;
			}else { // 실패
				count = count;
			}
		
		}
		
		
		// insert 모두 성공시
		if(count == flList.size()) { 
			
			// 2-1. 사용한 포인트 차감 (차감된포인트, userNo 필요)
			int newPoint = currentPoint - usePoint;
			FundingList f = flList.get(0);
			f.setUsePoint(newPoint); 
			
			int pointResult = fService.updatePoint(f);
			
			
			// 2-2. 결재된 리워드 아이템 수량 차감 (rewardNo, fundingQuantity 필요)
			int itemQuantityCut = 0;
			
			for(int i=0; i<flList.size(); i++) {
				
				FundingList f2 = flList.get(i);

				itemQuantityCut = fService.updateItemQuantity(f2);
			}
			

			// 둘다 성공시
			if(pointResult > 0 && itemQuantityCut > 0) {
				
				// DB에서 가져오기
				FundingList f2 = flList.get(0);
				
				ArrayList<FundingList> confirmFlList = fService.selectConfirmFunding(f2);
				FundingList f0 = confirmFlList.get(0);
				
				mv.addObject("f0", f0);
				mv.addObject("cfl", confirmFlList); 
				System.out.println(confirmFlList);
				System.out.println(f0);
							
			}			
		
			//mv.addObject("rlist", rlist);

			//mv.addObject("shipMemo", shipMemo);
			//mv.addObject("finalSum", finalSum);
			//mv.addObject("usePoint", usePoint);
			
			mv.setViewName("funding/fundingPayConfirm");
			return mv;
			
			
		}else {	// 하나라도 실패시 
			session.setAttribute("msg", "펀딩 결재에 실패하였습니다. 다시 시도해주세요.");
			mv.setViewName("redirect:booking.pay?pno=" + pno);
			return mv;
		}

	}
	
}
