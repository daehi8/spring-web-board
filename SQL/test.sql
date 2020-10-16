create table test
(
	id varchar2(100) primary key,
	pw varchar2(100) not null,
	name varchar2(100) default 'guest', 
    age number default 1,
    phone number,
	reg date default sysdate
);

desc test;

drop table test;

delete from test;

select * from test;

insert into test values('java','0000','ora',20,sysdate);
insert into test values('jsp','1234','aaa',30,sysdate);
insert into test(id,pw) values('web','7777');

delete from test where age >= 30;
delete from test where id = 'java';

update test set age = 50;
update test set name = 'guest', age=40 where id = 'java';

select * from test where id=? and pw=?

commit;