drop table alcoholFreePerfume;

SET VERIFY OFF;
SET SERVEROUTPUT ON;
SET LINESIZE 500;

create table alcoholFreePerfume(
	pid     integer, 
	pname   varchar2(30), 
	brand   varchar2(30), 
	capacity varchar2(30),
	gender varchar2(30),
	price number(30),
		PRIMARY KEY (pid)
);


insert into alcoholFreePerfume values(1001, 'Madina Attar Perfume', 'Al Haramain ','15ml','Men', 585);
insert into alcoholFreePerfume values(1002, 'Khaltath Attar Perfume', 'Al Haramain ','15ml','Men', 585);
insert into alcoholFreePerfume values(1002, 'Classic by Al Rehab Atta', 'Al Rehab ','30ml','Women', 300);

commit;

select * from alcoholFreePerfume;
