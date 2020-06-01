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
public class Faq {

	private String faqNo;
	private String userNo;
	private String faqTitle;
	private String faqAnswer;
	private String faqStatus;
	private Date faqDate;
	
}
