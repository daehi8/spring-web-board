create table board(
    num number primary key,
    writer varchar2(100),
    subject varchar2(100),
    email varchar2(100),
    content varchar2(100),
    passwd varchar2(100),
    reg_date date,
    readcount number default 0,
    ip varchar2(100),
    ref number,
    re_step number,
    re_level number
);

commit;

create sequence board_seq nocache;

commit;
desc board;
select * from board;
select * from board_seq;