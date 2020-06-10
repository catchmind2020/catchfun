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
	private String userId;				// 프로젝트 등록자 아이디
	private int fundingCost;			// 구매자의 구매금액
	private int fundingQuantity;		// 구매 수량		(구매금액 * 수량) 계산용
	private int projectTargetAmount;	// 프로젝트 등록자 목표금액
	private Date projectFinishDate;		// 프로젝트 종료일
	private String categoryName;		// 프로젝트 카테고리명
	private int total;					// 총금액
	private String totalStatus;			// 총금액 93% 프젝한테 지급, 관리자 7% 지급
	private int projectPay;				// 프로젝트등록자한테 93% 지급될 금액
}
