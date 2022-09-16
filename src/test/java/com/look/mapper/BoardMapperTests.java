package com.look.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.look.model.NoticeDTO;

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
	
	 /* 게시판 수정 */
    @Test
    public void testModify() {
        
    	NoticeDTO dto = new NoticeDTO();
    	dto.setBno(1);
    	dto.setTitle("수정 제목");
    	dto.setContent("수정 내용");
        
        mapper.update(dto);
        log.info("result : " +dto);
        
    }
	 


}
