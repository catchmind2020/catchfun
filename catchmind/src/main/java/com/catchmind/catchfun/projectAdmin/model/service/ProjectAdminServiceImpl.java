package com.catchmind.catchfun.projectAdmin.model.service;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.catchmind.catchfun.projectAdmin.model.dao.ProjectAdminDao;
import com.catchmind.catchfun.projectAdmin.model.vo.Item;
import com.catchmind.catchfun.projectAdmin.model.vo.Option;
import com.catchmind.catchfun.projectAdmin.model.vo.Project;
import com.catchmind.catchfun.projectAdmin.model.vo.ProjectBasic;
import com.catchmind.catchfun.projectAdmin.model.vo.Reward;

@Service("paService")
public class ProjectAdminServiceImpl implements ProjectAdminService {

	
	@Autowired
	private SqlSessionTemplate sqlSession;
	
	@Autowired
	private ProjectAdminDao paDao;

	@Override
	public int insertBasic(ProjectBasic pb) {
		return paDao.insertBasic(sqlSession, pb);
	}

	@Override
	public ProjectBasic basicInformation(Project p) {
		// TODO Auto-generated method stub
		return paDao.basicInformation(sqlSession, p);
	}
	
	@Override
	public Project ploginMember(int projectNo) {
		// TODO Auto-generated method stub
		return paDao.ploginMember(sqlSession, projectNo);
	}

	@Override
	public ArrayList<Item> selectItemList(String projectNo) {
		// TODO Auto-generated method stub
		return paDao.selectItemList(sqlSession, projectNo);
	}

	@Override
	public int insertItem(Item item) {
		// TODO Auto-generated method stub
		return paDao.insertItem(sqlSession, item);
	}

	@Override
	public int deleteItem(Item item) {
		// TODO Auto-generated method stub
		return paDao.deleteItem(sqlSession, item);
	}

	@Override
	public int insertReward(Reward reward) {
		// TODO Auto-generated method stub
		return paDao.insertReward(sqlSession, reward);
	}

	@Override
	public ArrayList<Reward> selectRewardList(String projectNo) {
		// TODO Auto-generated method stub
		return paDao.selectRewardList(sqlSession, projectNo);
	}

	@Override
	public int deleteReward(Reward reward) {
		// TODO Auto-generated method stub
		return paDao.deleteReward(sqlSession, reward);
	}

	@Override
	public int insertOption(Option option) {
		// TODO Auto-generated method stub
		return paDao.insertOption(sqlSession, option);
	}

	@Override
	public ArrayList<Option> selectOptionList() {
		// TODO Auto-generated method stub
		return paDao.selectOptionList(sqlSession);
	}

	

}
