-- 커뮤니티 게시글 테이블
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

-- 커뮤니티 게시글 건수 입력
insert into tbl_review(title,content, nickname) values ('제목','내용','작성자');
insert into tbl_review(title,content, nisckname) values ('제목','내용','작성자');

-- 뉴스 게시판 테이블
create table tbl_news (
bno int not null auto_increment,
title varchar(200) not null,
content text null,
nickname varchar(50) not null,
regdate timestamp not null default now(),
updatedate timestamp not null default now(),
hit int default 0,
primary key (bno)
);

-- 회원 테이블

CREATE TABLE `lookplace`.`tbl_member` (
  `membercode` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(50) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(100) NOT NULL,
  `nickname` VARCHAR(50) NOT NULL,
  `address` VARCHAR(100) NULL,
  'phone' varchar(100) NOT NULL,
  PRIMARY KEY (`membercode`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `nickname_UNIQUE` (`nickname` ASC) VISIBLE);