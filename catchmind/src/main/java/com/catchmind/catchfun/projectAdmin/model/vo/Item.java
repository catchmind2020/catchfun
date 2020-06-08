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
public class Item {

	private String itemNo;
	private String itemName;
	private String projectNo;
	private String status;
	private String itemContent;
}
