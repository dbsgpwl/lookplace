package com.look.mapper;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.look.model.MemberDTO;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class MemberTEST {

	@Autowired
	private MemberMapper membermapper;			//MemberMapper.java 인터페이스 의존성 주입
	
	//회원가입 쿼리 테스트 메서드
	@Test
	public void memberJoin() throws Exception{
		MemberDTO member = new MemberDTO();
		
		Date date = new Date();
		member.setName("test");
		member.setEmail("tets3");
		member.setPassword("test4");
		member.setNickname("test1112");
		member.setAddress("test2");
		member.setGrade("1");
		member.setCreatedAt(date);
		
		membermapper.memberJoin(member);			//쿼리 메서드 실행
		
	}
}
