-- 리뷰 게시글 테이블
create table tbl_review (
bno int not null auto_increment,
title varchar(200) not null,
content text null,
nickname varchar(50) not null,
regdate timestamp not null default now(),
updatedate timestamp not null default now(),
hit int default 0,
primary key (bno)
);

-- 리뷰 게시글 건수 입력
insert into tbl_review(title,content, nickname) values ('제목','내용','작성자');
insert into tbl_review(title,content, nickname) values ('제목','내용','작성자');

-- 자유게시판 게시글 테이블
create table tbl_board (
bno int not null auto_increment,
title varchar(200) not null,
content text null,
nickname varchar(50) not null,
regdate timestamp not null default now(),
updatedate timestamp not null default now(),
hit int default 0,
primary key (bno)
);

-- tbl_member

CREATE TABLE `lookplace`.`tbl_member` (
  `membercode` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `nickname` VARCHAR(50) NOT NULL,
  `address` VARCHAR(100) NULL,
  `grade` CHAR(1) NOT NULL,
  `createdAt` DATETIME NOT NULL,
  PRIMARY KEY (`membercode`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `nickname_UNIQUE` (`nickname` ASC) VISIBLE);