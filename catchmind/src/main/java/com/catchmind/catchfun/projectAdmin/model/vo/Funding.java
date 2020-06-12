package com.catchmind.catchfun.projectAdmin.model.vo;

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
public class Funding {
	private String fundingNo;
	private String rewardNo;
	private String fundingUserNo;
	private String fundingProduct;
	private int fundingCost;
	private int fundingQuantity;
	private Date fundingDate;
	private String fundingStatus;
	private String paymentMethod;
	private String projectNo;
	private String rewardTitle;
}
