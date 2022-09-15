package com.look.service;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.look.mapper.BoardMapperTests;
import com.look.model.NoticeDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTests {
	private static final Logger log = LoggerFactory.getLogger(BoardMapperTests.class);
	@Autowired
	private NoticeService service;
	/*게시판 조회*/
    @Test
    public void testGETPage() {
        
        int bno = 1;
        
        log.info("" + service.getPage(bno));
        
    }
}
