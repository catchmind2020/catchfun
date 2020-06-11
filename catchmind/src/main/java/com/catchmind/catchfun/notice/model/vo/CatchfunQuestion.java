package com.catchmind.catchfun.notice.model.vo;

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
public class CatchfunQuestion {
	
	private String cqNo;			// 문의 글번호
	private String cqWriter;		// 문의 작성자
	private int cqType;				// 답변자타입(2. 관리자)
	private String counseling;		// 문의 유형
	private String cqTitle;			// 문의 제목
	private String cqContent;		// 문의 내용
	private Date cqDate;			// 문의 작성일
	private String cqYn;			// 답변여부
	private String cqStatus;		// 상태값
	private String ansTitle;		// 답변 제목
	private String ansContent;		// 답변 내용
	private Date ansDate;			// 답변 등록일
	private String ansWriter;		// 답변자ID


}
