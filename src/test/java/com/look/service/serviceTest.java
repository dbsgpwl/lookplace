package com.look.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.look.model.MemberDTO;
import com.look.service.MemberService;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations={
		"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class serviceTest {

	@Autowired
	MemberDTO dto;
	
	@Autowired
	MemberService service;
	
	@Test
	public void ServiceUpdatetest() {
	
	}
}
