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
public class ProjectBasic {
	private String projectBasicNo;
	private String projectNo;
	private String answer1;
	private String answer2;
	private String answer3;
	private String answer4;
	private String check1;
	private String check2;
	private String check3;
	private String check4;
	private String status;
}	
