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
//@EqualsAndHashCode
public class MemberDTO {
	
	private String user_id;    //아이디
    private String member_pass;    //비밀번호
    private String e_mail;    //이메일
    private Date join_date;    //가입일자
	
}




