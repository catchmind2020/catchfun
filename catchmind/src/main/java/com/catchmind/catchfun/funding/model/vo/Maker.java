package com.catchmind.catchfun.funding.model.vo;

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
public class Maker {

	private String makerNo;				// 메이커번호
	private String projectNumber;		// 프로젝트번호
	private String makerName;			// 메이커명
	private String makerEmail;			// 이메일
	private String makerPhone;			// 전화번호
	private String makerType;			// 사업자구분
	private String representativeName;	// 대표자명
	private String representativeEmail;	// 대표자이메일
	private String status;				// 상태값
	private String changeName;
	private String filePath;
}
