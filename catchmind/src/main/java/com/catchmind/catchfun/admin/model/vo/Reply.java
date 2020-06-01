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
public class Reply {
	
	private String pQuestionNo;
	private String userNo;
	private String questionContent;
	private Date questionDate;
	private String questionYN;
	private String questionStatus;
	private int questionBanCount;

}
