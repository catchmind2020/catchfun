package com.catchmind.catchfun.main.model.vo;

import java.util.ArrayList;

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
public class Param {
	
	private int startNum;		// 시작번호
	private int endNum;			// 끝번호
	private int page;			// 현재페이지
	
	private ArrayList rows;		// 프로젝트list
	private int totCnt;			// 총 게시물갯수
	private int resultCode;
	
	private String cno;			// 프로젝트번호
	private String order;		// 정렬값

}
