--select * from perfume union select * from alcoholFreePerfume;
SET VERIFY OFF;
SET SERVEROUTPUT ON;
SET LINESIZE 500;


create or replace view perfumeView(Pid, Perfume_Name, Perfume_Brand, Capacity , Gender, Perfume_Price) as
select P.pid,P.pname,P.brand,P.capacity,P.gender,P.price
from perfume P 
UNION 
select P.pid,P.pname,P.brand,P.capacity,P.gender,P.price
from perfume@site1 P 
UNION 
select AFP.pid,AFP.pname,AFP.brand,AFP.capacity,AFP.gender,AFP.price
from alcoholFreePerfume AFP;

select * from perfumeView;

commit;