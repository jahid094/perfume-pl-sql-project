clear screen;
drop table perfume;

SET VERIFY OFF;
SET SERVEROUTPUT ON;
SET LINESIZE 500;


create table perfume(
	pid     integer, 
	pname   varchar2(50), 
	brand   varchar2(30), 
	capacity varchar2(10),
	gender varchar2(10),
	price number(10),
		PRIMARY KEY (pid)
);

insert into perfume values(4, 'Fogg Perfumed Body spray', 'Fogg ','50ml','Men', 325);
insert into perfume values(5, 'Fogg Perfumed Body spray', 'Fogg ','100ml','Women', 325);
insert into perfume values(6, 'Fogg Scent', 'Fogg ','100ml','Women', '825');
insert into perfume values(7, 'JAGUAR Classic Blue', 'JAGUAR ','10ml','Men', 825);

commit;

select * from perfume;
