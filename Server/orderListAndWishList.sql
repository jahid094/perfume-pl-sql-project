clear screen;
drop table perfumeOrderList;
drop table perfumeWishlist;

SET VERIFY OFF;
SET SERVEROUTPUT ON;
SET LINESIZE 500;


create table perfumeOrderList(
	pid     integer, 
	pname   varchar2(50), 
	brand   varchar2(30), 
	capacity varchar2(10),
	gender varchar2(10),
	price number(10)
);

create table perfumeWishlist(
	pid     integer, 
	pname   varchar2(50), 
	brand   varchar2(30), 
	capacity varchar2(10),
	gender varchar2(10),
	price number(10),
		PRIMARY KEY (pid)
);

--insert into perfumeOrderList values(4, 'Fogg Perfumed Body spray', 'Fogg ','50ml','Men', 325);
--insert into perfumeWishlist values(4, 'Fogg Perfumed Body spray', 'Fogg ','50ml','Men', 325);


commit;

select * from perfumeOrderList;
select * from perfumeWishlist;
