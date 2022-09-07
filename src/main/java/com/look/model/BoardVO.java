package com.look.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class BoardVO {
	
	private int articelcode;
	private int membercode;
	private String title;
	private String content;
	private String hashtag;
	private String nickname;
	private Date createdAt;
	private Date modifiledAt;
	
}
