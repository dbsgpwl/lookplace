package com.my.spring.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.my.spring.domain.Emp;

public interface EmpMapper {

    public List<Emp> selectAll();
    Emp selectByEmpno(int empno);
    void insert(Emp emp);
    void update(Emp emp);
    void delete(int empno);

}
