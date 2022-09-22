package com.look.mapper;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.look.model.MemberDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class MapperTest {

	@Autowired
	MemberMapper mapper;
	
	@Test
	public void testUpdate() {
		MemberDTO dto = new MemberDTO();
		
		dto.setEmail("min11600@naver.com");
		dto.setNickname("수정1");
		dto.setPassword("1234");
		dto.setAddress("수정1");
		
		mapper.memberUpdate(dto);
		
		
		
	}
}
