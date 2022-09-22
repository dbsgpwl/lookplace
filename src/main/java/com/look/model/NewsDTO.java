package com.look.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class NewsDTO {
	

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
