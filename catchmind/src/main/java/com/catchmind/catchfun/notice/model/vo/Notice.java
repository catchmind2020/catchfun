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
public class Notice {
	
	private String noticeNo;		// 공지사항 글번호
	private String noticeWriter;	// 공지사항 작성자
	private String noticeTitle;		// 공지사항 제목
	private String noticeContent;	// 공지사항 내용
	private Date noticeDate;		// 공지사항 작성일
	private int noticeCount;		// 공지사항 글 카운트 수
	private String noticeStatus;	// 상태값


}
