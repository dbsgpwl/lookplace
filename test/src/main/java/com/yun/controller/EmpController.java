package com.yun.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import com.yun.service.EmpService;

@Controller
public class EmpController {

    @Autowired

    @GetMapping("/emp/all")
    public void selectAllEmp() {
        
    }

   
}
