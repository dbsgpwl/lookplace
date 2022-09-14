package com.look.service;


import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.look.mapper.BoardMapperTests;
import com.look.model.BoardDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardServiceTests {
	private static final Logger log = LoggerFactory.getLogger(BoardMapperTests.class);
	@Autowired
	private BoardService service;

	  /* 게시판 수정 */
    @Test
    public void testModify() {
        
        BoardDTO board = new BoardDTO();
        board.setBno(4106);
        board.setTitle("서비스 테스트");
        board.setContent("수정 내용");
        
        int result = service.modify(board);
        log.info("result : " +result);
        
    }     

}
