package com.catchmind.catchfun.admin.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class PayTotal {
	private String projectNumber;		// 프로젝트 기본키
	private String rewardNo;			// 리워드 기본키
	private String projectName;			// 프로젝트 이름
	private String user_id;				// 프로젝트 등록자 아이디
	private int fundingCost;			// 구매자의 구매금액
	private int fundingQuantity;		// 구매 수량		(구매금액 * 수량) 계산용
	private int projectTargetAmount;	// 프로젝트 등록자 목표금액
	private String projectFinishDate;		// 프로젝트 종료일
	private String categoryName;		// 프로젝트 카테고리명
	private int total;					// 총금액
}
