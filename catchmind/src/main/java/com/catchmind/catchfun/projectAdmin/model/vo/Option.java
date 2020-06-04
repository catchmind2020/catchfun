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
public class Option {
	private String rewardNo;
	private String itemNo;
	private String rewardTitle;
	private String itemName;
	private String itemQuantity;
	private String status;
}
