package com.catchmind.catchfun.main.model.vo;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@NoArgsConstructor	// 기본생성자
@AllArgsConstructor
@ToString
public class Category {
	
	private String categoryNo;		// 카테고리번호
	private String categoryName;	// 카테고리이름
	private String categoryImg;		// 카테고리이미지


}
