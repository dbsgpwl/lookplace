package com.my.spring.service;



import java.util.List;

import com.my.spring.domain.Emp;

public interface EmpService {

    public List<Emp> selectAllEmp();
    void insertEmp(Emp emp);
    void updateEmp(int empno, Emp emp);
    void deleteEmp(int empno);

}
