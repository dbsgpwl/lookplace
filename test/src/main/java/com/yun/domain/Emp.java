package com.yun.domain;

import java.time.LocalDateTime;

import lombok.Data;
@Data
public class Emp {

    private Integer empno;
    private String ename;
    private String job;
    private Integer mgr;
    private LocalDateTime createAt;
    private Integer sal;
    private Integer comm;
    private Integer deptno;

}
