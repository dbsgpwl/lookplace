package com.look.model;
import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ImageDTO {
	
	/* db에 저장되는 첨부파일명 */
	private String filename;
	
	// 첨부되어서 올라오는 파일
	private MultipartFile imagefile;
	 /* 게시판 번호 */
    private int bno;
    
    /* 게시판 제목 */
    private String title;
    
    /* 게시판 내용 */
    private String content;
    
    /* 게시판 작가 */
    private String nickname;
    
    /* 등록 날짜 */
    private Date regdate;
    
    /* 수정 날짜 */
    private Date updateDate;
    
    /* 조회수 */
    private int hit;

}
    
