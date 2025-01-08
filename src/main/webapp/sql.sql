create table member_tbl_01 (
id varchar2(5) not null primary key,
name varchar2(20),
gender varchar2(3)
);

create table score_tbl_01 (
id varchar2(5) not null primary key,
korean number(3),
english number(3),
math number(3),
history number(3)
);

insert into member_tbl_01 values('10301', '권기현', '남');
insert into member_tbl_01 values('10302', '구지우', '여');
insert into member_tbl_01 values('10303', '권태준', '남');
insert into member_tbl_01 values('10304', '금기연', '여');
insert into member_tbl_01 values('10305', '김영진', '남');
insert into member_tbl_01 values('10401', '김주현', '남');
insert into member_tbl_01 values('10402', '김태민', '여');
insert into member_tbl_01 values('10403', '임수민', '여');
insert into member_tbl_01 values('10404', '남상도', '남');
insert into member_tbl_01 values('10405', '조은호', '여');

insert into score_tbl_01 values('10301', 70, 80, 75, 95);
insert into score_tbl_01 values('10302', 80, 73, 80, 85);
insert into score_tbl_01 values('10303', 45, 75, 45, 75);
insert into score_tbl_01 values('10304', 65, 73, 65, 65);
insert into score_tbl_01 values('10305', 90, 100, 68, 95);
insert into score_tbl_01 values('10401', 95, 75, 84, 60);
insert into score_tbl_01 values('10402', 65, 70, 50, 94);
insert into score_tbl_01 values('10403', 80, 60, 100, 80);
insert into score_tbl_01 values('10404', 64, 50, 40, 65);
insert into score_tbl_01 values('10405', 55, 70, 80, 75);

<--List-->
select id, name, substr(id, 1, 1), substr(id, 2, 2), substr(id, 4, 2), gender from member_tbl_01;

<--Regi-->
insert into score_tbl_01 values(?, ?, ?, ?, ?);

<--Reuslt 1-->
select mt.id, mt.name, substr(mt.id, 1, 1), substr(mt.id, 2, 2), substr(mt.id, 4, 2), mt. gender
st.korean, st.math, st.english, st.history
st.korean + st.math + st.english + st.history as total
avg((st.korean + st.math + st.english + st.history) / 4) as av
rank() over(order by st.korean + st.math + st.english + st.history desc) as ran
from member_tbl_01 mt, score_tbl_01 st
where mt.id = st.id
group by mt.id, mt.name, substr(mt.id, 1, 1), substr(mt.id, 2, 2), substr(mt.id, 4, 2), mt. gender, st.korean
st.math, st.english, st.history, st.korean + st.math + st.english + st.history;

<--Result 2-->
select sum(korean) as sk, sum(math) as sm, sum(english) as se, sum(history) as sh
sum(korean) + sum(math) + sum(english) + sum(history) as total
avg(korean + math + english + history) as ag
from score_tbl_01;