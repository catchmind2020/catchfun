package com.catchmind.catchfun.projectAdmin.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.catchmind.catchfun.projectAdmin.model.service.ProjectAdminService;
import com.catchmind.catchfun.projectAdmin.model.vo.Item;
import com.catchmind.catchfun.projectAdmin.model.vo.Option;
import com.catchmind.catchfun.projectAdmin.model.vo.Project;
import com.catchmind.catchfun.projectAdmin.model.vo.ProjectBasic;
import com.catchmind.catchfun.projectAdmin.model.vo.Reward;

@Controller
public class ProjectAdminController {

	@Autowired // DI
	private ProjectAdminService paService;
		
	@RequestMapping("basicSelect.pa")
		public ModelAndView basicInformation(HttpSession session, ModelAndView mv) {
		
		
		Project pro  = (Project)session.getAttribute("projectUser");
		
		System.out.println("삽입프젝객체");
		System.out.println(pro);
		ProjectBasic pb = paService.basicInformation(pro);
		
		System.out.println("기본객체");
		System.out.println(pb);
		
		session.setAttribute("projectBasic1", pb);
		mv.setViewName("projectAdmin/projectEnroll/basicInformation");
		
		return mv;
			
		}
	
	@RequestMapping("basic.pa")
	public String basicInformation() {
		return "projectAdmin/projectEnroll/basicInformation";
	}
	
	@RequestMapping("story.pa")
	public String fundingRequirment() {
		return "projectAdmin/projectEnroll/stroyproject";
	}
	@RequestMapping("maker.pa")
	public String makerInformation() {
		return "projectAdmin/projectEnroll/makerInformation";
	}
	@RequestMapping("reward.pa")
	public String itemDesign() {
		return "projectAdmin/projectEnroll/rewardDesign";
	}
	
	@RequestMapping("home.pa")
	public String home(Model model, HttpSession session) {
		selectRewardList(model, session);
		selectItemList(model, session);
		selectOptionList(model, session);
		
		
		return "projectAdmin/projectEnroll/home";
	}

	@RequestMapping("insertBasic.pa")
	public ModelAndView insertBasic(ProjectBasic pb, ModelAndView mv, HttpSession session) {
		System.out.println(pb);
		
		Project pro  = (Project)session.getAttribute("projectUser"); //현재 프로젝트 로그인된걸 불러와요
		pb.setProjectNo(pro.getProjectNo()); //bp객체에 불러온 프로젝트 번호를 넣어주고
		
		int result = paService.insertBasic(pb); // pb 객체를 인설트함.
 		
		if(result > 0) { 
			
			session.setAttribute("projectBasic", pb);
			mv.setViewName("projectAdmin/projectEnroll/home");
			
		}else {
			
			System.out.println("실패");
			mv.setViewName("projectAdmin/projectEnroll/home");
		}
		return mv;
		
	}
	
	
	@RequestMapping("insertItem.pa")
	public String insertItem(Item item, Model model, HttpSession session) {

		
		Project project  = (Project)session.getAttribute("projectUser"); //현재 프로젝트 로그인된걸 불러와요
		item.setProjectNo(project.getProjectNo()); //item객체에 불러온 프로젝트 번호를 넣어주고
		
		int result = paService.insertItem(item); // item 객체를 인설트함.
 		
		if(result > 0) {
		
			model.addAttribute("item", item);

			return "redirect:itemList.pa";  //리스트 출력을위해 리스트 컨트롤 단 감.
			
		}else { 
			
			System.out.println("실패");
			return "projectAdmin/projectEnroll/itemDesign";
		}
	
		
	}
	
	@RequestMapping("deleteItem.pa")
	public String deleteItem(Item item, Model model, HttpSession session) {

		
		Project project  = (Project)session.getAttribute("projectUser"); //현재 프로젝트 로그인된걸 불러와요
		item.setProjectNo(project.getProjectNo()); //item객체에 불러온 프로젝트 번호를 넣어주고
		
		int result = paService.deleteItem(item); // item 객체를 인설트함.
 		
		if(result > 0) {

			return "redirect:itemList.pa";
			
		}else { 
			
			System.out.println("실패");
			return "redirect:itemList.pa";
		}
	
		
	}
	
	
	
	@RequestMapping("plogin.pa")
	public ModelAndView ploginMember(int projectNo, HttpSession session, ModelAndView mv) {
		
		Project projectUser = paService.ploginMember(projectNo); // 아이디만을 가지고 조회한 결과
		
		
			session.setAttribute("projectUser", projectUser);
			System.out.println("성공성공");	
			
				mv.setViewName("projectAdmin/projectEnroll/home");
//				mv.setViewName("common/admin");
			
		
		return mv;
	}
	
	
	
	@RequestMapping("ptest.pa")
	public ModelAndView ploginMember(ModelAndView mv, HttpSession session) {
		
		Project projectUser = new Project("PR1","","M1","용환프젝","","","","","","","","Y","Y"); // 아이디만을 가지고 조회한 결과
		
		
			session.setAttribute("projectUser", projectUser);
			System.out.println(projectUser);	
				mv.setViewName("projectAdmin/projectEnroll/home");
		
		return mv;
	}
	
	/*
	 * @RequestMapping("selectProject.pa") public String selectproject(Project p,
	 * HttpSession session, ModelAndView mv) { ProjectBasic pb =
	 * paService.selectproject(p);
	 * 
	 * 
	 * return "projectAdmin/projectEnroll/stroyproject"; }
	 */
	@RequestMapping("itemList.pa")
	public String selectItemList(Model model,HttpSession session) {
		
		Project project  = (Project)session.getAttribute("projectUser"); //현재 프로젝트 로그인된걸 불러와요
		
		ArrayList<Item> list = paService.selectItemList(project.getProjectNo());
		
		

	

//		for(Item dd : list) {
//
//		    System.out.println(dd);
//
//		}
		

		model.addAttribute("list", list);
		
		return "projectAdmin/projectEnroll/itemDesign";
	}
	
	
	
	
	
	
	@RequestMapping("insertReward.pa")
	public String insertReward(Reward reward, Model model, HttpSession session) {

		
		Project project  = (Project)session.getAttribute("projectUser"); //현재 프로젝트 로그인된걸 불러와요
		reward.setProjectNo(project.getProjectNo()); //item객체에 불러온 프로젝트 번호를 넣어주고
		
		
	
		int result = paService.insertReward(reward); // item 객체를 인설트함.
 		
		if(result > 0) {
			
			selectItemList(model, session);
			selectRewardList(model, session);
			return "projectAdmin/projectEnroll/rewardDesign";  //리스트 출력을위해 리스트 컨트롤 단 감.
			
		}else { 
			
			System.out.println("실패");
			return "projectAdmin/projectEnroll/itemDesign";
		}
	
		
		
	}
	
	
	@RequestMapping("rewardList.pa")
	public String selectRewardList(Model model,HttpSession session) {
		
		Project project  = (Project)session.getAttribute("projectUser"); //현재 프로젝트 로그인된걸 불러와요
		
		ArrayList<Reward> rlist = paService.selectRewardList(project.getProjectNo());
		
		
	
	

//		for(Item dd : list) {
//
//		    System.out.println(dd);
//
//		}
		
		session.setAttribute("rlist", rlist);
	
		selectOptionList(model, session);
		
		
		
		return "projectAdmin/projectEnroll/rewardDesign";
	}
	
	@RequestMapping("optionList.pa")
	public String selectOptionList(Model model,HttpSession session) {
		
		Project project  = (Project)session.getAttribute("projectUser"); //현재 프로젝트 로그인된걸 불러와요
		
		ArrayList<Option> optionlist = paService.selectOptionList();
		
		
	
	

//		for(Item dd : list) {
//
//		    System.out.println(dd);
//
//		}
		
		session.setAttribute("optionlist", optionlist);
		
		
		return "projectAdmin/projectEnroll/rewardDesign2";
	}
	
	@RequestMapping("deleteReward.pa")
	public String deleteReward(Reward reward, Model model, HttpSession session) {

		
		Project project  = (Project)session.getAttribute("projectUser"); //현재 프로젝트 로그인된걸 불러와요
		reward.setProjectNo(project.getProjectNo()); //item객체에 불러온 프로젝트 번호를 넣어주고
		
		int result = paService.deleteReward(reward); // item 객체를 인설트함.
		selectOptionList(model, session);
		if(result > 0) {

			return "redirect:rewardList.pa";
			
		}else { 
			
			System.out.println("실패");
			return "redirect:itemList.pa";
		}
	
		
	}
	
	@RequestMapping("rewardDesign2.pa")
	public String rewardDesign2(Reward reward, Model model, HttpSession session) {
		Project project  = (Project)session.getAttribute("projectUser");
		
		reward.setProjectNo(project.getProjectNo()); //item객체에 불러온 프로젝트 번호를 넣어주고
		
	
		session.setAttribute("reward", reward);
		selectOptionList(model, session);
		selectItemList(model, session);
		selectRewardList(model, session);
		return "projectAdmin/projectEnroll/rewardDesign2";
	}
	
	
	
	@RequestMapping("insertOption.pa")
	public String insertOption(Option option, Model model, HttpSession session) {

		
	

		int result = paService.insertOption(option); // item 객체를 인설트함.
 		
		if(result > 0) {
			selectOptionList(model, session);
			selectItemList(model, session);
			selectRewardList(model, session);
			return "projectAdmin/projectEnroll/rewardDesign2";  //리스트 출력을위해 리스트 컨트롤 단 감.
			
		}else { 
			
			System.out.println("실패");
			return "projectAdmin/projectEnroll/itemDesign";
		}

	}
}
