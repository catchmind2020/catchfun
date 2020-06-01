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
public class Member {
	
	private String userNo;
	private String userId;
	private String userPwd;
	private int userType;
	private String userName;
	private String email;
	private String phone;
	private Date userEnrolldate;
	private String address;
	private String addressNum;
	private int userPoint;
	private String status;
	private String reason;

}
