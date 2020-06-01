package com.catchmind.catchfun.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/*
 * ** lombok 라이브러리
 *    단지 어노테이션만으로 구성된 필드에 맞춰서
 *    생성자, setter/getter 메소드, toString 등등이 알아서 자동으로 만들어지는
 * 
 * ** 과정
 * 1) pom.xml에 라이브러리 추가
 * 2) lombok 라이브러리 설치 
 *    해당 다운로드된 jar 파일 찾아가서 설치
 * 3) sts 재부팅
 */

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@ToString
//@EqualsAndHashCode
public class Member {
	
	private String userNo;
	private String userId;
	private String userPwd;
	private int userType;
	private String userName;
	private String email;
	private String phone;
	private Date enrollDate;
	private String address;
	private String addressNum;
	private int point;
	private String status;
	private String reason;
	private String addressDetail;
	private String addressReference;
	
	
	
	//private String uId;
	// getuId()  setuId()
	// ${ loginUser.uId }
	
}




