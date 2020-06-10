package com.catchmind.catchfun.projectAdmin.model.service;

import java.util.ArrayList;

import com.catchmind.catchfun.common.model.vo.PageInfo;
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

public interface ProjectAdminService {

	int insertBasic(ProjectBasic pb);

	ProjectBasic basicInformation(Project p);

	ProjectMaker selectMaker(Project p);

	News selectNews(String nno);
	
	FundSum fundSum(String projectNo);

	FundSum todayfundSum(String projectNo);

	ArrayList<FundSum> daylistfundSum(String projectNo);

	ArrayList<Funding> selectFundingList(PageInfo pi, String projectNo);

	ArrayList<News> selectNewsList(PageInfo pi, String projectNo);

	Project selectProject(Project p);

	int selectfundListCount(String projectNo);

	int selectNewsListCount(String projectNo);

	Project ploginMember(int projectNo);

	ArrayList<Item> selectItemList(String projectNo);

	int insertItem(Item item);

	int deleteItem(Item item);
	
	int deleteNews(News news);
	
	int insertReward(Reward reward);

	ArrayList<Reward> selectRewardList(String projectNo);

	int deleteReward(Reward reward);

	int insertOption(Option option);

	ArrayList<Option> selectOptionList();

	ArrayList<Category> selectCategoryList();
	
	int insertMaker(ProjectMaker maker);

	int insertNews(News news);
	
	int insertFile(Project project);

	int updateProject(Project project);

	int updateFile(Project project);
	int updateNews(News news);
	int updateBasic(String projectNo);

	int updateMaker(String projectNo);

	int updateStory(String projectNo);

	int updateItem(String projectNo);

	int updateReward(String projectNo);

	int updateBasic2(ProjectBasic Basic);

	int updateMaker2(ProjectMaker maker);

}
