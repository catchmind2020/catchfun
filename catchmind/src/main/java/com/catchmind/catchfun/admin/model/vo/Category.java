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
public class Category {
	//	Category
	private String projectCategory;
	private String projectCategoryName;
	private Date categoryDate;
	
	//	Attachment
	private String fileNo;
	private String refNo;
	private String originName;
	private String changeName;
	private String filePath;
	private Date uploadDate;
	private int fileLevel;
	private String status;
	private String projectName;
}
