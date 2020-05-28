package com.catchmind.catchfun.board.model.vo;

import java.sql.Timestamp;

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
	
	private int replyNo;
	private String replyContent;
	private String replyWriter;
	private int refBoardNo;
	//private Date createDate; // 조회 결과를 java.sql.Date 담는 순간 년월일에 대한 정보만 담김..
	private Timestamp createDate;
	private String status;

}





