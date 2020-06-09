package com.catchmind.catchfun.projectAdmin.model.dao;

import java.util.ArrayList;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Repository;

import com.catchmind.catchfun.common.model.vo.PageInfo;
import com.catchmind.catchfun.projectAdmin.model.vo.FundSum;
import com.catchmind.catchfun.projectAdmin.model.vo.Funding;
import com.catchmind.catchfun.projectAdmin.model.vo.Item;
import com.catchmind.catchfun.projectAdmin.model.vo.News;
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
	
	public int insertNews(SqlSessionTemplate sqlSession, News news) {
		return sqlSession.insert("projectAdminMapper.insertNews", news);
	}
	
	public ProjectBasic basicInformation(SqlSessionTemplate sqlSession, Project p) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("projectAdminMapper.basicInformation", p);
	}
	
	
	public ProjectMaker selectMaker(SqlSessionTemplate sqlSession, Project p) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("projectAdminMapper.selectMaker", p);
	}
	
	public News selectNews(SqlSessionTemplate sqlSession, String nno) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("projectAdminMapper.selectNews", nno);
	}
	
	public Project selectProject(SqlSessionTemplate sqlSession, Project p) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("projectAdminMapper.selectProject", p);
	}
	
	
	public FundSum fundSum(SqlSessionTemplate sqlSession, String projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("projectAdminMapper.fundSum", projectNo);
	}
	public FundSum todayfundSum(SqlSessionTemplate sqlSession, String projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("projectAdminMapper.todayfundSum", projectNo);
	}
	
	public ArrayList<FundSum> daylistfundSum(SqlSessionTemplate sqlSession, String projectNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("projectAdminMapper.daylistfundSum", projectNo);
	}
	public ArrayList<Funding> selectFundingList(SqlSessionTemplate sqlSession, PageInfo pi, String projectNo) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("projectAdminMapper.selectFundingList", projectNo, rowBounds);
	}
	
	public ArrayList<News> selectNewsList(SqlSessionTemplate sqlSession, PageInfo pi, String projectNo) {
		// TODO Auto-generated method stub
		int offset = (pi.getCurrentPage() - 1) * pi.getBoardLimit();
		RowBounds rowBounds = new RowBounds(offset, pi.getBoardLimit());
		return (ArrayList)sqlSession.selectList("projectAdminMapper.selectNewsList", projectNo, rowBounds);
	}
	
	
	public Project ploginMember(SqlSessionTemplate sqlSession, int projectNo) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("projectAdminMapper.ploginMember", projectNo);
	}
	
	public ArrayList<Item> selectItemList(SqlSessionTemplate sqlSession, String projectNo) {
		// TODO Auto-generated method stub
		return (ArrayList)sqlSession.selectList("projectAdminMapper.selectItemList", projectNo);
	}
	
	
	public int selectfundListCount(SqlSessionTemplate sqlSession, String projectNo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("projectAdminMapper.selectfundListCount", projectNo);
	}
	public int selectNewsListCount(SqlSessionTemplate sqlSession, String projectNo) {
		// TODO Auto-generated method stub
		
		return sqlSession.selectOne("projectAdminMapper.selectNewsListCount", projectNo);
	}
	
	
	public int insertItem(SqlSessionTemplate sqlSession, Item item) {
		// TODO Auto-generated method stub
		
		return sqlSession.insert("projectAdminMapper.insertItem", item);
	}
	
	public int deleteItem(SqlSessionTemplate sqlSession, Item item) {
		// TODO Auto-generated method stub
		
		return sqlSession.update("projectAdminMapper.deleteItem", item);
	}
	public int deleteNews(SqlSessionTemplate sqlSession, News news) {
		// TODO Auto-generated method stub
		
		return sqlSession.update("projectAdminMapper.deleteNews", news);
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
	
	public int updateNews(SqlSessionTemplate sqlSession, News news) {
		// TODO Auto-generated method stub
		
		return sqlSession.update("projectAdminMapper.updateNews", news);
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
	
	public int updateFile(SqlSessionTemplate sqlSession, Project project) {
		// TODO Auto-generated method stub
		return sqlSession.update("projectAdminMapper.updateFile", project);
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
