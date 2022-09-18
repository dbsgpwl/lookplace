package com.look.model;

import java.util.Date;

import lombok.Data;
import lombok.ToString;

@Data
@ToString
public class ReplyDTO {

	private int rno;
	private int bno;
	private String nickname;
	private String content;
	private Date regdate;
}
