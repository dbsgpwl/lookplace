package com.look.model;

import java.util.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NoticeDTO {
	
	/* 게시판 번호 */
	private int bno;
	
	/* 게시글 제목 */
	private String title;
	
	/* 게시글 내용 */
	private String content; 
	
	/* 게시글 작성자 */
	private String nickname;
	
	/* 게시글 작성일 */
	private Date regdate;
	
	/* 게시글 수정일 */
	private Date updatedate;
	
	/* 조회수 */
	private int hit;
}
