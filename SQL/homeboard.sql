create table homeboard(
    num number primary key,
    writer varchar2(100),
    subject varchar2(100),
    email varchar2(100),
    content varchar2(100),
    pw varchar2(100),
    reg_date date,
    readcount number default 0,
    ip varchar2(100),
    ref number,
    re_step number,
    re_level number
);

commit;

create sequence homeboard_seq nocache;

commit;
desc homeboard;
select * from homeboard;
select * from homeboard_seq;
drop table homeboard;