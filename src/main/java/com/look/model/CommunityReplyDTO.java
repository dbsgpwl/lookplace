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
public class CommunityReplyDTO {

   private int rno;
   private int bno;
   private String nickname;
   private String content;
   private Date regdate;
}