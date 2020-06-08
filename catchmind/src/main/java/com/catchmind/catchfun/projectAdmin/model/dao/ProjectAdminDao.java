package com.catchmind.catchfun.projectAdmin.model.dao;

import java.util.ArrayList;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.catchmind.catchfun.projectAdmin.model.vo.FundSum;
import com.catchmind.catchfun.projectAdmin.model.vo.Item;
import com.catchmind.catchfun.projectAdmin.model.vo.Option;
import com.catchmind.catchfun.projectAdmin.model.vo.Project;
import com.catchmind.catchfun.projectAdmin.model.vo.ProjectBasic;
import com.catchmind.catchfun.projectAdmin.model.vo.ProjectMaker;
import com.catchmind.catchfun.projectAdmin.model.vo.Reward;


@Repository("paDao")
public class ProjectAdminDao {
	
	
	public int insertBasic(SqlSessionTemplate sqlSession, ProjectBasic pb) {
		return sqlSession.insert("projectAdminMapper.insertBasic", pb);
	}
	
	
	
	public ProjectBasic basicInformation(SqlSessionTemplate sqlSession, Project p) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("projectAdminMapper.basicInformation", p);
	}
	
	
	public ProjectMaker selectMaker(SqlSessionTemplate sqlSession, Project p) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("projectAdminMapper.selectMaker", p);
	}
	
	public Project selectProject(SqlSessionTemplate sqlSession, Project p) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("projectAdminMapper.selectProject", p);
	}
	
	
	public FundSum fundSum(SqlSessionTemplate sqlSession, String projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("projectAdminMapper.fundSum", projectNo);
	}
	
	public Project ploginMember(SqlSessionTemplate sqlSession, int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("projectAdminMapper.ploginMember", projectNo);
	}
	
	public ArrayList<Item> selectItemList(SqlSessionTemplate sqlSession, String projectNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("projectAdminMapper.selectItemList", projectNo);
	}
	
	public int insertItem(SqlSessionTemplate sqlSession, Item item) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("projectAdminMapper.insertItem", item);
	}
	
	public int deleteItem(SqlSessionTemplate sqlSession, Item item) {
		// TODO Auto-generated method stub
		
		return sqlSession.update("projectAdminMapper.deleteItem", item);
	}
	
	public int insertReward(SqlSessionTemplate sqlSession, Reward reward) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("projectAdminMapper.insertReward", reward);
	}
	
	public ArrayList<Reward> selectRewardList(SqlSessionTemplate sqlSession, String projectNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("projectAdminMapper.selectRewardList", projectNo);
	}
	
	public int deleteReward(SqlSessionTemplate sqlSession, Reward reward) {
		// TODO Auto-generated method stub
		
		return sqlSession.update("projectAdminMapper.deleteReward", reward);
	}
	
	public int insertOption(SqlSessionTemplate sqlSession, Option option) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("projectAdminMapper.insertOption", option);
	}
	
	public ArrayList<Option> selectOptionList(SqlSessionTemplate sqlSession) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("projectAdminMapper.selectOptionList");
	}
	
	public int insertMaker(SqlSessionTemplate sqlSession, ProjectMaker maker) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("projectAdminMapper.insertMaker", maker);
	}
	public int insertFile(SqlSessionTemplate sqlSession, Project project) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("projectAdminMapper.insertFile", project);
	}
	public int updateProject(SqlSessionTemplate sqlSession, Project project) {
		// TODO Auto-generated method stub
		
		return sqlSession.update("projectAdminMapper.updateProject", project);
	}
	
	public int updateBasic(SqlSessionTemplate sqlSession, String projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("projectAdminMapper.updateBasic", projectNo);
	}

	public int updateMaker(SqlSessionTemplate sqlSession, String projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("projectAdminMapper.updateMaker", projectNo);
	}
	
	public int updateStory(SqlSessionTemplate sqlSession, String projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("projectAdminMapper.updateStory", projectNo);
	}
	
	public int updateItem(SqlSessionTemplate sqlSession, String projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("projectAdminMapper.updateItem", projectNo);
	}
	
	public int updateReward(SqlSessionTemplate sqlSession, String projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.update("projectAdminMapper.updateReward", projectNo);
	}
	
	public int updateBasic2(SqlSessionTemplate sqlSession, ProjectBasic Basic) {
		// TODO Auto-generated method stub
		return sqlSession.update("projectAdminMapper.updateBasic2", Basic);
	}
	public int updateMaker2(SqlSessionTemplate sqlSession, ProjectMaker maker) {
		// TODO Auto-generated method stub
		return sqlSession.update("projectAdminMapper.updateMaker2", maker);
	}
}
