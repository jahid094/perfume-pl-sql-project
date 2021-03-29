clear screen;

SET VERIFY OFF;
SET SERVEROUTPUT ON;
SET LINESIZE 400;

DROP SEQUENCE orderVal;
drop table orderDetails;
drop table orderNumber;

SET VERIFY OFF;
SET SERVEROUTPUT ON;
SET LINESIZE 500

create table orderNumber(
	orderId integer,  
	price number,
		primary key(orderId)
);


create table orderDetails(
	orderId integer, 
	pid     integer, 
	pname   varchar2(50), 
	brand   varchar2(30), 
	capacity varchar2(30),
	gender varchar2(30),
	price number(30)	
);



create sequence orderVal minvalue 1 maxvalue 9999999 start with 10001 increment by 1 nocache;

insert into orderDetails values(10025,1001, 'Madina Attar Perfume', 'Al Haramain ','15ml','Men', 585);

insert into orderNumber values(orderVal.nextval, 0);

select * from orderDetails;
select * from orderNumber;