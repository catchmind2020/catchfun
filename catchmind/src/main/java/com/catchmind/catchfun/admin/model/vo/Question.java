package com.catchmind.catchfun.admin.model.vo;

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
public class Question {
	private String questionNo;
	private String userNo;
	private int questionType;
	private String counseling;
	private String questionTitle;
	private String questionContent;
	private Date questionDate;
	private String questionYn;
	private String questionStatus;
	private String ansTitle;
	private String ansContent;
	private Date ansDate;
	private String ansNo;
	
}
