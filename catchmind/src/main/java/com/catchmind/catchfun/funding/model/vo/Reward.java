package com.catchmind.catchfun.funding.model.vo;

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
public class Reward {
	
	private String rewardNo;				// 리워드 번호
	private String projectNumber;			// 프로젝트 번호
	private String rewardTitle;				// 리워드 제목
	private String rewardContent;			// 리워드 내용
	private int rewardCost;					// 리워드 금액
	private int rewardRemainingQuantity;	// 상품잔여량
	private int rewardDeliveryCost;			// 배송비
	private String rewardStatus;			// 상태값
	private int rewardFundingCount;			// 리워드별 펀딩 합계

}
