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
public class Report {
	
	private String userNo;
	private String reportNo;
	private String reportCategory;
	private Date reportDate;
	private String reportTitle;
	private String reportContent;
}
