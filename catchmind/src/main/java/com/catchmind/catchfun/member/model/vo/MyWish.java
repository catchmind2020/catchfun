package com.catchmind.catchfun.member.model.vo;

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
public class MyWish {
	
	private String projectName;
	private String projectCategoryName;
	private String makerName;
	private String changeName;
	   
}