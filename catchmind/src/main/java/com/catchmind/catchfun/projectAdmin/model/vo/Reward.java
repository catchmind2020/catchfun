package com.catchmind.catchfun.projectAdmin.model.vo;

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
	
	private String rewardNo;
	private String projectNo;
	private String rewardTitle;
	private String rewardContent;
	private String rewardCost;
	private String rewardRemainingQuantity;
	private String rewarDeliveryCost;
	private String rewardStatus;
}
