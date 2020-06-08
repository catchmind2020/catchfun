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
public class News {

	private String newsNo;
	private String projectNumber;
	private String newsTitle;
	private String newsContent;
	private Date newsDate;
	private int newsCount;
	private String newsStatus;
	
}
