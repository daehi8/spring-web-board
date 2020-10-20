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
drop sequence homeboard_seq;

select * from 
(select num,writer,email,subject,pw,reg_date,ref,re_step,re_level,content,ip,readcount,rownum r
from (select * from homeboard order by ref desc, re_step asc)
order by ref desc, re_step asc)
where r>=1 and r=>10