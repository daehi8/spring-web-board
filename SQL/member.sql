create table member(
    id varchar2(100) primary key,
    passwd varchar2(100),
    name varchar2(100),
    jumin1 varchar2(100),
    jumin2 varchar2(100),
    email varchar2(100),
    blog varchar2(100),
    reg_date date
);

commit;
desc member;
select * from member;