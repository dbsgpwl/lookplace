package com.look.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {

	private static final Logger log = LoggerFactory.getLogger(BoardMapperTests.class);

	@Autowired
	private NoticeMapper mapper;

	
	/*
	 * @Test public void insert() {
	 * 
	 * NoticeDTO dto = new NoticeDTO();
	 * 
	 * dto.setTitle("mapper test"); dto.setContent("mapper test");
	 * dto.setNickname("mapper test");
	 * 
	 * mapper.enroll(dto);
	 * 
	 * }
	 */
	
	/* 게시판 조회 */
    @Test
   public void testGetPage() {
       
       /* 실제 존재하는 페이지 */
       int bno = 1;
       
       log.info("" + mapper.getPage(bno));
       
   }
	 


}
