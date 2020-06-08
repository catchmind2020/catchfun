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
public class Project {

	private String projectNumber;
	private String projectCategory;
	private String userNo;
	private String projectName;
	private Date projectDate;
	private Date projectStartDate;
	private Date projectFinishDate;
	private String projectContent;
	private int projectTargetAmount;
	private int projectReport;
	private String hashtags;
	private String projectStatus;
	private String statusStory;
	private String changeName;
	private String filePath;
	
}


