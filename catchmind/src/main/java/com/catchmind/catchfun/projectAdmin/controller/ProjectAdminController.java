package com.catchmind.catchfun.projectAdmin.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.catchmind.catchfun.common.model.vo.PageInfo;
import com.catchmind.catchfun.common.template.Pagination;
import com.catchmind.catchfun.member.model.vo.Member;
import com.catchmind.catchfun.projectAdmin.model.service.ProjectAdminService;
import com.catchmind.catchfun.projectAdmin.model.vo.Category;
import com.catchmind.catchfun.projectAdmin.model.vo.FundSum;
import com.catchmind.catchfun.projectAdmin.model.vo.Funding;
import com.catchmind.catchfun.projectAdmin.model.vo.Item;
import com.catchmind.catchfun.projectAdmin.model.vo.News;
import com.catchmind.catchfun.projectAdmin.model.vo.Option;
import com.catchmind.catchfun.projectAdmin.model.vo.Project;
import com.catchmind.catchfun.projectAdmin.model.vo.ProjectBasic;
import com.catchmind.catchfun.projectAdmin.model.vo.ProjectMaker;
import com.catchmind.catchfun.projectAdmin.model.vo.Reward;

@Controller
public class ProjectAdminController {

	@Autowired // DI
	private ProjectAdminService paService;

	@RequestMapping("basicSelect.pa")
	public ModelAndView basicInformation(HttpSession session, ModelAndView mv) {

		Project pro = (Project) session.getAttribute("projectUser");

		ProjectBasic pb = paService.basicInformation(pro);

		System.out.println(pb);
		session.setAttribute("projectBasic", pb);

		mv.setViewName("projectAdmin/projectEnroll/basicInformation");

		return mv;

	}

	@RequestMapping("selectMaker.pa")
	public ModelAndView selectMaker(HttpSession session, ModelAndView mv) {

		Project pro = (Project) session.getAttribute("projectUser");

		ProjectMaker maker = paService.selectMaker(pro);

		session.setAttribute("projectMaker", maker);

		System.out.println(maker);
		mv.setViewName("projectAdmin/projectEnroll/makerInformation");

		return mv;

	}

	@RequestMapping("selectProject.pa")
	public ModelAndView selectProject(HttpSession session, ModelAndView mv) {

		Project pro = (Project) session.getAttribute("projectUser");

		
		ArrayList<Category> categoryList = paService.selectCategoryList();
		Project project = paService.selectProject(pro);
		session.setAttribute("project", project);
		session.setAttribute("categoryList", categoryList);
		mv.setViewName("projectAdmin/projectEnroll/stroyproject");

		return mv;

	}

	@RequestMapping("fund.pa")
	public ModelAndView selectfund(HttpSession session, ModelAndView mv, int currentPage, Model model) {

		Project project = (Project) session.getAttribute("projectUser");

		FundSum fundSum = paService.fundSum(project.getProjectNo());
		FundSum todayfundSum = paService.todayfundSum(project.getProjectNo());
		ArrayList<FundSum> daylistfundSum = paService.daylistfundSum(project.getProjectNo());

		int listCount = paService.selectfundListCount(project.getProjectNo());
		// 카운트 24 함수 만들어서 추가하면 끝
		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);

		
		System.out.println(listCount);
		ArrayList<Funding> fundingList = paService.selectFundingList(pi, project.getProjectNo());

		System.out.println(fundingList);
		
		String fundDayMoney = "";
		String fundDayDate = "";
		for (FundSum df : daylistfundSum) {
			fundDayMoney += df.getFundSum() + ",";
			fundDayDate += '"' + df.getFundDate() + '"' + ",";

		}

		model.addAttribute("pi", pi);
		model.addAttribute("fundingList", fundingList);
		session.setAttribute("fundDayDate", fundDayDate);
		session.setAttribute("fundDayMoney", fundDayMoney);
		session.setAttribute("fundSum", fundSum);
		session.setAttribute("todayfundSum", todayfundSum);
		session.setAttribute("daylistfundSum", daylistfundSum);
		mv.setViewName("projectAdmin/funding/fundingStatusList");

		return mv;

	}
	
	@RequestMapping("news.pa")
	public ModelAndView selectNewsList(HttpSession session, ModelAndView mv, int currentPage, Model model) {

		Project project = (Project) session.getAttribute("projectUser");

	
		int listCount = paService.selectNewsListCount(project.getProjectNo());
		// 카운트 24 함수 만들어서 추가하면 끝
		
		

		PageInfo pi = Pagination.getPageInfo(listCount, currentPage, 5, 5);

		
		
		ArrayList<News> newsList = paService.selectNewsList(pi, project.getProjectNo());

		mv.addObject("pi", pi);
		mv.addObject("newsList", newsList);

		System.out.println(newsList);
		
		mv.setViewName("projectAdmin/news/newsList");

		return mv;

	}
	/*
	 * @RequestMapping("summer.pa") public String basicInformatiodn() { return
	 * "projectAdmin/projectEnroll/summernote"; }
	 */

	@RequestMapping("basic.pa")
	public String basicInformation() {
		return "projectAdmin/projectEnroll/projectList";
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
	
	@RequestMapping("newsEnroll.pa")
	public String newsEnroll() {
		return "projectAdmin/news/newsEnroll";
	}
	
	@RequestMapping("projectEnroll.pa")
	public String projectEnroll() {
		return "projectAdmin/projectEnroll/projectEnroll";
	}

	@RequestMapping("home.pa")
	public String home(Model model, HttpSession session, ModelAndView mv) {
		selectRewardList(model, session);
		selectItemList(model, session);
		selectOptionList(model, session);
		basicInformation(session, mv);
		selectMaker(session, mv);
		selectProject(session, mv);
		return "projectAdmin/projectEnroll/home";
	}

	@RequestMapping("insertBasic.pa")
	public ModelAndView insertBasic(ProjectBasic pb, ModelAndView mv, HttpSession session) {
		System.out.println(pb);

		Project pro = (Project) session.getAttribute("projectUser"); // 현재 프로젝트 로그인된걸 불러와요
		pb.setProjectNo(pro.getProjectNo()); // bp객체에 불러온 프로젝트 번호를 넣어주고

		int result = paService.insertBasic(pb); // pb 객체를 인설트함.

		if (result > 0) {

			session.setAttribute("projectBasic", pb);
			mv.setViewName("redirect:home.pa");

		} else {

			System.out.println("실패");
			mv.setViewName("projectAdmin/projectEnroll/home");
		}
		return mv;

	}
	
	@RequestMapping("insertProject.pa")
	public ModelAndView insertProject(Project project, ModelAndView mv, HttpSession session) {
		
	
		
		Member member = (Member) session.getAttribute("loginUser");  //나중에 로그인 되면 이걸로 위에껄 이걸로 대체할거임
		
		
		project.setUserNo(member.getUserNo()); 

		int result = paService.insertProject(project); 

		if (result > 0) {

			mv.setViewName("redirect:projectList.pa");

		} else {

			System.out.println("실패");
			
		}
		return mv;

	}
	
	
	@RequestMapping("projectList.pa")
	public String selectProjectList(Model model, HttpSession session) {

	
		
		Member member = (Member) session.getAttribute("loginUser");  //나중에 로그인 되면 이걸로 위에껄 이걸로 대체할거임
		
		if(member != null) {
		
		ArrayList<Project> projectList = paService.selectProjectList(member.getUserNo());

		session.setAttribute("projectList", projectList);
		return "projectAdmin/projectEnroll/projectList";
		
		} else {
			
				model.addAttribute("msg", "로그인 후 이용해주세요. ");
				return "common/errorPage";
				
			}
	}
	
	

	@RequestMapping("insertItem.pa")
	public String insertItem(Item item, Model model, HttpSession session) {

		Project project = (Project) session.getAttribute("projectUser"); // 현재 프로젝트 로그인된걸 불러와요
		item.setProjectNo(project.getProjectNo()); // item객체에 불러온 프로젝트 번호를 넣어주고

		int result = paService.insertItem(item); // item 객체를 인설트함.

		if (result > 0) {

			model.addAttribute("item", item);

			return "redirect:itemList.pa"; // 리스트 출력을위해 리스트 컨트롤 단 감.

		} else {

			System.out.println("실패");
			return "projectAdmin/projectEnroll/itemDesign";
		}

	}

	@RequestMapping("insertNews.pa")
	public String insertNews(News news, Model model, HttpSession session) {

		Project project = (Project) session.getAttribute("project"); // 현재 프로젝트 로그인된걸 불러와요
		news.setProjectNo(project.getProjectNo()); // item객체에 불러온 프로젝트 번호를 넣어주고

		int result = paService.insertNews(news); // item 객체를 인설트함.
		
		if (result > 0) {

		
			
			return "redirect:news.pa?currentPage=1"; // 리스트 출력을위해 리스트 컨트롤 단 감.

		}else {

			System.out.println("실패");
			return "projectAdmin/projectEnroll/itemDesign";
		}

	}
	
	
	
	@RequestMapping("newDetail.pa")
	public ModelAndView selectNews(String nno, ModelAndView mv,HttpSession session) {
		
			System.out.println(nno);
			News news = paService.selectNews(nno);
			
			System.out.println(news);
			
			session.setAttribute("news", news);
			
			mv.setViewName("projectAdmin/news/newsDetail");
			
	
	
		
		return mv;
		
	}
	
	@RequestMapping("deleteItem.pa")
	public String deleteItem(Item item, Model model, HttpSession session) {

		Project project = (Project) session.getAttribute("projectUser"); // 현재 프로젝트 로그인된걸 불러와요
		item.setProjectNo(project.getProjectNo()); // item객체에 불러온 프로젝트 번호를 넣어주고

		int result = paService.deleteItem(item); // item 객체를 인설트함.

		if (result > 0) {

			return "redirect:itemList.pa";

		} else {

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
	public ModelAndView ploginMember(Project project, ModelAndView mv, HttpSession session, Model model) {

		//Project projectUser = new Project("PR13", "", "", "", "", "", "", "", "", "", "", "", "", "", ""); // 아이디만을 가지고
																											// 조회한 결과

		session.setAttribute("projectUser", project);
		System.out.println(project);

		mv.setViewName("redirect:home.pa");
		

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
	public String selectItemList(Model model, HttpSession session) {

		Project project = (Project) session.getAttribute("projectUser"); // 현재 프로젝트 로그인된걸 불러와요

		ArrayList<Item> list = paService.selectItemList(project.getProjectNo());

//		for(Item dd : list) {
//
//		    System.out.println(dd);
//
//		}

		session.setAttribute("ilist", list);

		return "projectAdmin/projectEnroll/itemDesign";
	}

	@RequestMapping("insertReward.pa")
	public String insertReward(Reward reward, Model model, HttpSession session) {

		Project project = (Project) session.getAttribute("projectUser"); // 현재 프로젝트 로그인된걸 불러와요
		reward.setProjectNo(project.getProjectNo()); // item객체에 불러온 프로젝트 번호를 넣어주고

		paService.insertReward(reward); // item 객체를 인설트함.

		selectItemList(model, session);
		selectRewardList(model, session);

		return "projectAdmin/projectEnroll/rewardDesign"; // 리스트 출력을위해 리스트 컨트롤 단 감.

	}

	@RequestMapping("enrollProject.pa")
	public String enrollProject(Reward reward, Model model, HttpSession session) {

		Project project = (Project) session.getAttribute("projectUser"); // 현재 프로젝트 로그인된걸 불러와요
		// item객체에 불러온 프로젝트 번호를 넣어주고
		System.out.println(project.getProjectNo());
		paService.updateBasic(project.getProjectNo()); // 등록대기상태변환
		paService.updateMaker(project.getProjectNo());
		paService.updateStory(project.getProjectNo()); // 프로젝트임이건
		paService.updateItem(project.getProjectNo());
		paService.updateReward(project.getProjectNo());

		session.setAttribute("project", project);
		return "redirect:home.pa";// 리스트 출력을위해 리스트 컨트롤 단 감.

	}

	@RequestMapping("updateBasic2.pa")
	public String updateBasic2(ProjectBasic Basic, Model model, HttpSession session) {

		Project project = (Project) session.getAttribute("projectUser"); // 현재 프로젝트 로그인된걸 불러와요
		// item객체에 불러온 프로젝트 번호를 넣어주고
		Basic.setProjectNo(project.getProjectNo());
		paService.updateBasic2(Basic); // 등록대기상태변환

		return "redirect:home.pa";// 리스트 출력을위해 리스트 컨트롤 단 감.

	}
	
	@RequestMapping("updateNews.pa")
	public String updateNews(News news, Model model, HttpSession session) {

		News newsno = (News) session.getAttribute("news"); // 현재 프로젝트 로그인된걸 불러와요
		// item객체에 불러온 프로젝트 번호를 넣어주고
		
		news.setNewsNo(newsno.getNewsNo());
		
		
		paService.updateNews(news); // 등록대기상태변환

		return "redirect:news.pa?currentPage=1";// 리스트 출력을위해 리스트 컨트롤 단 감.

	}
	
	
	@RequestMapping("updateFund.pa")
	public String updateNews(String fundingNo,String currentPage, Model model, HttpSession session) {


		
		
		paService.updateFund(fundingNo); // 등록대기상태변환

		return "redirect:fund.pa?currentPage="+currentPage;

	}
	
	
	

	@RequestMapping("updateMaker2.pa")
	public String enrollProject(ProjectMaker maker, HttpServletRequest request, HttpSession session,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {

		Project project = (Project) session.getAttribute("projectUser"); // 현재 프로젝트 로그인된걸 불러와요
		// item객체에 불러온 프로젝트 번호를 넣어주고
		if (!file.getOriginalFilename().equals("")) {

			// 서버에 파일 업로드 --> saveFile 메소드로 따로 빼서 정의할 것
			String changeName = saveFile(file, request);

			maker.setOriginName(file.getOriginalFilename());
			maker.setChangeName(changeName);

		}
		maker.setProjectNo(project.getProjectNo());
		paService.updateMaker2(maker); // 등록대기상태변환

		return "redirect:home.pa";// 리스트 출력을위해 리스트 컨트롤 단 감.

	}

	@RequestMapping("updateProject.pa")
	public String updateProject(Project project, HttpServletRequest request, HttpSession session,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {

		Project p = (Project) session.getAttribute("projectUser"); // 현재 프로젝트 로그인된걸 불러와요
		project.setProjectNo(p.getProjectNo()); // item객체에 불러온

		
	
	
			if (!file.getOriginalFilename().equals("")) {

				// 서버에 파일 업로드 --> saveFile 메소드로 따로 빼서 정의할 것
				String changeName = saveFile(file, request);

				project.setOriginName(file.getOriginalFilename());
				project.setChangeName(changeName);

				paService.insertFile(project);
			} 
		

		System.out.println(project);

		int result = paService.updateProject(project); // item 객체를 인설트함.

		/* session.setAttribute("projectUser", projectUser); 좀따 셀렉 */
		if (result > 0) {

			return "redirect:home.pa"; // 리스트 출력을위해 리스트 컨트롤 단 감.

		} else {

			System.out.println("실패");
			return "projectAdmin/projectEnroll/itemDesign";
		}
	}

	
	@RequestMapping("updateProject2.pa")
	public String updateProject2(Project project, HttpServletRequest request, HttpSession session,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {

		Project p = (Project)session.getAttribute("projectUser"); // 현재 프로젝트 로그인된걸 불러와요
		
		project.setProjectNo(p.getProjectNo()); // item객체에 불러온

		
	
	
			if (!file.getOriginalFilename().equals("")) {

				// 서버에 파일 업로드 --> saveFile 메소드로 따로 빼서 정의할 것
				String changeName = saveFile(file, request);

				project.setOriginName(file.getOriginalFilename());
				project.setChangeName(changeName);

				paService.updateFile(project);
			} 
		

		System.out.println(project);

		int result = paService.updateProject(project); // item 객체를 인설트함.

		/* session.setAttribute("projectUser", projectUser); 좀따 셀렉 */
		if (result > 0) {

			return "redirect:home.pa"; // 리스트 출력을위해 리스트 컨트롤 단 감.

		} else {

			System.out.println("실패");
			return "projectAdmin/projectEnroll/itemDesign";
		}
	}
	@RequestMapping("rewardList.pa")
	public String selectRewardList(Model model, HttpSession session) {

		Project project = (Project) session.getAttribute("projectUser"); // 현재 프로젝트 로그인된걸 불러와요

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
	public String selectOptionList(Model model, HttpSession session) {

		Project project = (Project) session.getAttribute("projectUser"); // 현재 프로젝트 로그인된걸 불러와요

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

		Project project = (Project) session.getAttribute("projectUser"); // 현재 프로젝트 로그인된걸 불러와요
		reward.setProjectNo(project.getProjectNo()); // item객체에 불러온 프로젝트 번호를 넣어주고

		int result = paService.deleteReward(reward); // item 객체를 인설트함.
		selectOptionList(model, session);
		if (result > 0) {

			return "redirect:rewardList.pa";

		} else {

			System.out.println("실패");
			return "redirect:itemList.pa";
		}

	}
	
	@RequestMapping("deleteNews.pa")
	public String deleteNews(Model model, HttpSession session) {

		News newsno = (News) session.getAttribute("news");
		System.out.println("---");
System.out.println(newsno);
		paService.deleteNews(newsno); // item 객체를 인설트함.
	

			return "redirect:news.pa?currentPage=1";

	


	}

	@RequestMapping("rewardDesign2.pa")
	public String rewardDesign2(Reward reward, Model model, HttpSession session) {
		Project project = (Project) session.getAttribute("projectUser");

		reward.setProjectNo(project.getProjectNo()); // item객체에 불러온 프로젝트 번호를 넣어주고

		session.setAttribute("reward", reward);
		selectOptionList(model, session);
		selectItemList(model, session);
		selectRewardList(model, session);
		return "projectAdmin/projectEnroll/rewardDesign2";
	}

	@RequestMapping("insertOption.pa")
	public String insertOption(Option option, Model model, HttpSession session) {

		int result = paService.insertOption(option); // item 객체를 인설트함.

		if (result > 0) {
			selectOptionList(model, session);
			selectItemList(model, session);
			selectRewardList(model, session);
			return "projectAdmin/projectEnroll/rewardDesign2"; // 리스트 출력을위해 리스트 컨트롤 단 감.

		} else {

			System.out.println("실패");
			return "projectAdmin/projectEnroll/itemDesign";
		}

	}

	@RequestMapping("insertMaker.pa")
	public String insertMaker(ProjectMaker maker, HttpServletRequest request, HttpSession session,
			@RequestParam(name = "uploadFile", required = false) MultipartFile file) {

		Project project = (Project) session.getAttribute("projectUser");

		maker.setProjectNo(project.getProjectNo()); // item객체에 불러온 프로젝트 번호를 넣어주고

		// System.out.println(b);
		// System.out.println(file.getOriginalFilename()); // 첨부파일 있을 경우 원본명 / 첨부파일 없을
		// 경우 빈문자열

		// 파일업로드 관련된 라이브러리 추가해야만 잘 담김!!

		// 현재 넘어온 파일이 있을 경우 서버에 업로드 후 원본명, 수정명 뽑아서 b 주섬주섬 담기
		if (!file.getOriginalFilename().equals("")) {

			// 서버에 파일 업로드 --> saveFile 메소드로 따로 빼서 정의할 것
			String changeName = saveFile(file, request);

			maker.setOriginName(file.getOriginalFilename());
			maker.setChangeName(changeName);

		}

		System.out.println(maker);
		int result = paService.insertMaker(maker);

		if (result > 0) { // 게시글 작성 성공 --> 갱신된 리스트가 보여지는 게시글 리스트 페이지

			return "projectAdmin/projectEnroll/home";
			/* return "redirect:list.bo?currentPage=1"; */

		} else { // 게시글 작성 실패
			// 메세지
			return "common/errorPage";
		}

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

}
