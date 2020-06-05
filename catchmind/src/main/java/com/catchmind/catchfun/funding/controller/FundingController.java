package com.catchmind.catchfun.funding.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.catchmind.catchfun.funding.model.vo.Reply;
import com.catchmind.catchfun.funding.model.service.FundingService;
import com.catchmind.catchfun.funding.model.vo.FundingList;
import com.catchmind.catchfun.funding.model.vo.Maker;
import com.catchmind.catchfun.funding.model.vo.News;
import com.catchmind.catchfun.funding.model.vo.Project;
import com.google.gson.GsonBuilder;

@Controller
public class FundingController {

	@Autowired 
	private FundingService fService;
	
	@RequestMapping("detail.pro")
	public ModelAndView selectProject(String pno, ModelAndView mv) {
				
		Project p = fService.selectProject(pno);  // 프로젝트 정보
		Maker m = fService.selectMaker(pno);	  // 메이커 정보
		FundingList fl = fService.selectFunding(pno);	// 펀딩 정보
		// 리워드 정보
		
		ArrayList<News> nlist = fService.selectNews(pno);// 새소식 정보
		
		mv.addObject("p", p);
		mv.addObject("m", m);
		mv.addObject("fl", fl);
		mv.addObject("nlist", nlist);
		
		mv.setViewName("funding/fundingDetail");

		return mv;
	}

	
	// 댓글 출력
	@ResponseBody
	@RequestMapping(value="rlist.pro", produces="application/json; charset=utf-8")
	public String selectReplyList(String pno) {
		
		ArrayList<Reply> list = fService.selectReplyList(pno);
		System.out.println(list);
		
		return new GsonBuilder().setDateFormat("yyyy-MM-dd").create().toJson(list);
		
	}
	
	/*
	 * // 댓글 등록
	 * 
	 * @ResponseBody
	 * 
	 * @RequestMapping("rinsert.pro") public String insertReply(Reply r) {
	 * 
	 * int result = fService.insertReply(r);
	 * 
	 * if(result > 0) { return "success"; }else { return "fail"; } }
	 */
}
