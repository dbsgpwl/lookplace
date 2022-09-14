package com.look.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class replyDTO {

	private int rno;
	private int bno;
	private String nickname;
	private String content;
	private Date regDate;
	
}
