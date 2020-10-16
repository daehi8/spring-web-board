create table signup
(
	id varchar2(100) primary key,
	pw varchar2(100),
	name varchar2(100),
	gender varchar2(100),
	nickname varchar2(100),
	num varchar2(100),
	email varchar2(100),
	address varchar2(100),
	reg date default sysdate
);

insert into signup values('java','1111','ydh','남','java','01000000000','java@naver.com','서울',sysdate);
insert into signup values('jsp','0000','abc','남','jsp','01011111111','jsp@google.com','부산',sysdate);
insert into signup values('oracle','2222','def','여','oracle','01022222222','oracle@naver.com','서울',sysdate);
insert into signup values('naver','3333','ghi','남','naver','01033333333','naver@google.com','부산',sysdate);
insert into signup values('google','4444','jkl','남','google','01044444444','google@google.com','서울',sysdate);
insert into signup values('eclipse','5555','nmo','남','ecll','01055555555','ecccc@naver.com','경기도',sysdate);
insert into signup values('html','6666','htm','남','html','01066666666','httmm@google.com','부산',sysdate);
insert into signup values('css','7777','ssc','여','scs','01077777777','sccscsc@google.com','서울',sysdate);
insert into signup values('avaj','8888','jav','여','avaj','010888888888','avjavj@google.com','서울',sysdate);
insert into signup values('espil','9988','esp','남','lllll','01099999999','99999@google.com','부산',sysdate);
insert into signup values('psj','0101','psj','여','psj','01035353535','ppssjj@google.com','경기도',sysdate);

select * from signup;
delete from signup where name = '123';
alter table signup add(img varchar2(100));
commit;
