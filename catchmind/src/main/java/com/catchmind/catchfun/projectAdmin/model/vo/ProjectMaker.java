package com.catchmind.catchfun.projectAdmin.model.vo;

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
public class ProjectMaker {
	private String makerNo;
	private String projectNo;
	private String makerName;
	private String makerEmail;
	private String makerPhone;
	private String makerHomepage;
	private String rName;
	private String rEmail;
	private String status;
	private String originName;
	private String changeName;
}
