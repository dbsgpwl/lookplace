package com.look.model;

import java.util.Date;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class TripReplyDTO {
	
	private int reno;
	private int imgno;
	private String nickname;
	private Date regdate;
	private String content;
	
	
}
