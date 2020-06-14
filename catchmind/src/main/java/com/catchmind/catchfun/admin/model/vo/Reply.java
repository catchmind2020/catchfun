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
	private String replyContent;
	private Date replyDate;
	private String replyYN;
	private String replyStatus;
	private int replyBanCount;
	
	private String userId;
	private int userType;
	private String userName;
	private String email;
	private String phone;
	private Date userEnrolldate;
	private String questionBanCount;
	
	private String userNo1;
	private String reportContent;
	

}
