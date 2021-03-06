package com.catchmind.catchfun.funding.model.vo;

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
public class Wishlist {

	private String projectNumber;
	private String userNo;
	private Date wishlistDate;
	private String wishlistStatus;
	private int count;
	
}
