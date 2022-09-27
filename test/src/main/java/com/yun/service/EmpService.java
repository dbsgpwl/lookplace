package com.yun.service;

import java.util.List;

import com.yun.domain.Emp;

public interface EmpService {
	public List<Emp> selectAll();
    public Emp selectByEmpno(int empno);
    public void insert(Emp emp);
    public void update(Emp emp);
    public void delete(int empno);

}
