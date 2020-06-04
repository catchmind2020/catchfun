package com.catchmind.catchfun.projectAdmin.model.service;

import java.util.ArrayList;

import com.catchmind.catchfun.projectAdmin.model.vo.Item;
import com.catchmind.catchfun.projectAdmin.model.vo.Option;
import com.catchmind.catchfun.projectAdmin.model.vo.Project;
import com.catchmind.catchfun.projectAdmin.model.vo.ProjectBasic;
import com.catchmind.catchfun.projectAdmin.model.vo.Reward;

public interface ProjectAdminService {
	
	int insertBasic(ProjectBasic pb);

	ProjectBasic basicInformation(Project p);

	Project ploginMember(int projectNo);
	
	
	ArrayList<Item> selectItemList(String projectNo);
	
	
	int insertItem(Item item);
	
	int deleteItem(Item item);
	
	int insertReward(Reward reward);
	
	ArrayList<Reward> selectRewardList(String projectNo);
	
	
	int deleteReward(Reward reward);
	
	int insertOption(Option option);
	
	ArrayList<Option> selectOptionList();
	
}
