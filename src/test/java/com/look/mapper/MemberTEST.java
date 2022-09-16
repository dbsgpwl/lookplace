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
//	@Test
//	public void memberJoin() throws Exception{
//		MemberDTO member = new MemberDTO();
		
//		Date date = new Date();
//		member.setName("test");
//		member.setEmail("tets3");
//		member.setPassword("test4");
//		member.setNickname("test1112");
//		member.setAddress("test2");
//		member.setGrade("1");
//		member.setCreatedAt(date);
//		
//	membermapper.memberJoin(member);			//쿼리 메서드 실행
//		
//	}
	// 아이디 중복 검사
//	@Test
//	public void memberIdChk() throws Exception{
//		String email = "admin";
//		String email2 = "min11600@naver.com";
//		
//		membermapper.idCheck(email);
//		membermapper.idCheck(email2);
//	}
	
	/* 로그인 테스트 mapper */
	@Test
	public void MemberLogin() throws Exception {
		MemberDTO dto = new MemberDTO();        
		
		/* 올바른 아이디 비번 */
		dto.setEmail("min11600@naver.com");
		dto.setPassword("1234");
		
		/* 올바르지 않은 아이디 비번 */
/*		dto.setEmail("aaa");
		dto.setEmail("1234"); */
		
		membermapper.memberLogin(dto);
		
		System.out.println("결과 값 : " + membermapper.memberLogin(dto));
	}
}	