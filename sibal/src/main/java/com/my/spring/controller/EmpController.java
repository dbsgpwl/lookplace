package com.my.spring.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;

import com.my.spring.domain.Emp;
import com.my.spring.service.EmpService;

@Controller
public class EmpController {

    @Autowired
    private EmpService empService;

    @GetMapping("/emp/all")
    public List<Emp> selectAllEmp() {
        return empService.selectAllEmp();
    }

    @PostMapping("/emp/new")
    public List<Emp> insertEmp(@RequestBody Emp emp) {

        empService.insertEmp(emp);

        return empService.selectAllEmp();
    }

    @PutMapping("emp/{empno}")
    public List<Emp> updateEmp1(@PathVariable Integer empno, @RequestBody Emp emp) {

        empService.updateEmp(empno, emp);

        return empService.selectAllEmp();

    }

    @DeleteMapping("emp/{empno}")
    public List<Emp> deleteEmp(@PathVariable Integer empno) {

        empService.deleteEmp(empno);
        return empService.selectAllEmp();
    }
}
