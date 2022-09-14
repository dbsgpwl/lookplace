package com.look.mapper;

import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.look.model.BoardDTO;


@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class BoardMapperTests {

	private static final Logger log = LoggerFactory.getLogger(BoardMapperTests.class);

	@Autowired
	private BoardMapper mapper;

    @Test
    public void insert() {
        
        BoardDTO rdto = new BoardDTO();
        
        rdto.setTitle("mapper test");
        rdto.setContent("mapper test");
        rdto.setNickname("mapper test");
        
        mapper.insert(rdto);
        
    }




}
