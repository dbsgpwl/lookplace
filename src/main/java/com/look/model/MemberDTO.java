package com.look.model;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Data

public class MemberDTO {
	
	
	private int membercode;
	private String name;
	private String email;
	private String phone;
	private String password;
	private String nickname;
	private String address;
	private String grade;
	private Date createdAt;
	
}
