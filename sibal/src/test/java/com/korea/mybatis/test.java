package com.korea.mybatis;

import static org.junit.Assert.*;

import java.time.LocalDateTime;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.my.spring.domain.Emp;
import com.my.spring.service.EmpService;
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class test {
	@Autowired
    private EmpService mapper;

    @Test
    void selectAll() {
        mapper.selectAllEmp();
    }


    @Test
    void insert(Emp emp) {

        emp.setEmpno(7777);
        emp.setEname("test");
        emp.setJob("test");
        emp.setMgr(7777);
        emp.setCreateAt(LocalDateTime.now());
        emp.setSal(7777);
        emp.setComm(7777);
        emp.setDeptno(7777);

        mapper.insertEmp(emp);
    }

    @Test
    void update(Emp emp) {

        emp.setEname("수정");
        emp.setJob("수정");

        mapper.updateEmp(7777, emp);

    }

    @Test
    void delete() {
        mapper.deleteEmp(7777);
    }
}
