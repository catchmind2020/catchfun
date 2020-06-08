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
public class Reply {
	private String replyNo;			// 댓글번호
	private String userNo;  		// 회원번호 / 회원아이디
	private String projectNumber;	// 프로젝트번호
	private String replyContent;	// 댓글내용 
	private Date replyDate;			// 댓글일자
	private String replyYn;			// 답변여부
	private String replyStatus;		// 상태값
	private int replyBanCount;		// 댓글신고횟수
}
