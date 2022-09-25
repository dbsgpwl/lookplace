package com.yun.service;

import java.util.List;

import com.yun.domain.Emp;
import com.yun.mapper.EmpMapper;

public class EmpServiceImpl implements EmpService{

	private EmpMapper mapper;
	
	@Override
	public List<Emp> selectAll() {
		return mapper.selectAll();
	}

	@Override
	public Emp selectByEmpno(int empno) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Emp emp) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void update(Emp emp) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void delete(int empno) {
		// TODO Auto-generated method stub
		
	}

}
