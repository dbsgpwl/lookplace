package com.my.spring.service;



import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.my.spring.domain.Emp;
import com.my.spring.mapper.EmpMapper;


@Service
public class EmpServiceImpl implements EmpService{

    @Autowired
    private EmpMapper mapper;

    @Override
    public List<Emp> selectAllEmp() {
        return mapper.selectAll();
    }

    @Override
    public void insertEmp(Emp emp) {
        mapper.insert(emp);
    }

    @Override
    public void updateEmp(int empno, Emp emp) {
        Emp emp1 = mapper.selectByEmpno(empno);
        if(emp1 != null) {
            emp1.setEname(emp.getEname());
            emp1.setJob(emp.getJob());
            mapper.update(emp);
        } else {
            throw new IllegalArgumentException("회원이 존재하지 않습니다");
        }
    }

    @Override
    public void deleteEmp(int empno) {
        if(mapper.selectByEmpno(empno) != null) {
            mapper.delete(empno);
        } else {
            throw new IllegalArgumentException("회원이 존재하지 않습니다");
        }
    }
}
