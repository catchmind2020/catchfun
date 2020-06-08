package com.catchmind.catchfun.main.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor	// 기본생성자
@AllArgsConstructor
@ToString
public class Main {
	
	private String projectNo;			// 프로젝트넘버
	private String projectName;			// 프로젝트이름
	private String projectCategory;		// 프로젝트카테고리
	private String projectCategoryImg;	// 프로젝트카테고리이미지

	private String makerName;			// 메이커이름
	private String projectImg;			// 프로젝트대표이미지

	private int projectTargetAmount;	// 프로젝트목표금액
	private int fundingTotalCost;		// 프로젝트펀딩총금액

	private Date projectStartDate;		// 프로젝트시작날짜
	private Date projectFinishDate;		// 프로젝트종료날짜
	private int projectDday;			// 디데이계산
	private String projectStatus;		// 프로젝트상태값
	
	private int wishlist;				// 프로젝트위시리스트


}