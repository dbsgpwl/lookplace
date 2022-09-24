package com.yun.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.yun.domain.Emp;

@Mapper
public interface EmpMapper {

    public List<Emp> selectAll();
    public Emp selectByEmpno(int empno);
    public void insert(Emp emp);
    public void update(Emp emp);
    public void delete(int empno);

}
