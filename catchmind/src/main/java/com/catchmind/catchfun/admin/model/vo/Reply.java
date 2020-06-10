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
	
	private String replyNo;
	private String userNo;
	private String questionContent;
	private Date questionDate;
	private String questionYN;
	private String questionStatus;
	private int questionBanCount;
	
	private String userId;
	private int userType;
	private String userName;
	private String email;
	private String phone;
	private Date userEnrolldate;
	
	private String userNo1;
	private String reportContent;
	

}
