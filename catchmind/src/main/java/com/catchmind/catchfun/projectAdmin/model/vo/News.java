package com.catchmind.catchfun.projectAdmin.model.vo;

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
public class News {
	private String newsNo;
	private String projectNo;
	private String newsTitle;
	private String newsContent;
	private String newsDate;
	private String newsCount;
	private String newsStatus;
}
