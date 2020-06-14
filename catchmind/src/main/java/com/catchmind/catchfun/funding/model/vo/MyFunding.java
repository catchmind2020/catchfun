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
public class MyFunding {

	private String userNo;
	private int total;
	private String projectName;
	private String projectNumber;
	private String userId;
	private Date projectFinishDate;
	private String categoryName;
	private String totlaStatus;  
	
}
