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
public class Project {
	private String projectNo;
	private String projectCategory;
	private String userNo;
	private String projectName;
	private String projectDate;
	private String projectStartDate;
	private String projectFinishDate;
	private String projectContent;
	private String projectTargetAmount;
	private String projectReport;
	private String hhsh;
	private String projectStatus;
	private String statusStory;
	private String originName;
	private String changeName;
	private String totalStatus;
	
}
