SET VERIFY OFF;
SET SERVEROUTPUT ON;


DECLARE
	
    
BEGIN
	DBMS_OUTPUT.PUT_LINE('Press 1 to insert product to perfume table');
	DBMS_OUTPUT.PUT_LINE('Press 2 to insert product to alcoholFreePerfume table');
	DBMS_OUTPUT.PUT_LINE('Press 3 to update product from perfume table');
	DBMS_OUTPUT.PUT_LINE('Press 4 to update product from alcoholFreePerfume table');
	DBMS_OUTPUT.PUT_LINE('Press 5 to delete product from perfume table');
	DBMS_OUTPUT.PUT_LINE('Press 6 to delete product from alcoholFreePerfume table');
	
	DBMS_OUTPUT.PUT_LINE('Press 7 to insert into Perfume cite table');
	DBMS_OUTPUT.PUT_LINE('Press 8 to update into Perfume cite table');
	DBMS_OUTPUT.PUT_LINE('Press 9 to delete into Perfume cite table');

END;
/

accept X char prompt 'Enter the choice = ';

DECLARE
	choice perfume.pid%TYPE;
	Error EXCEPTION;
    
BEGIN
	choice := &X;

	IF choice = 1 THEN
		adminPack.InsertIntoPerfume(30, 'Edge Perfume', 'Wild stone',  '50ml','Men', 450);
	ELSIF choice = 2 THEN	
		adminPack.InsertIntoAlcoholFreePerfume(1020, 'Classic Attar', 'Al Rehab ','50ml','Women', 300);
	ELSIF choice = 3 THEN	
		adminPack.UpdatePerfumeTable(30 , 2000);		
	ELSIF choice = 4 THEN	
		adminPack.UpdateAlcoholFreePerfumeTable(1020 , 3000);
	ELSIF choice = 5 THEN	
		adminPack.delelteFromPerfumeTable(30);	
	ELSIF choice = 6 THEN	
		adminPack.delelteFromBothTable(1020);

	ELSIF choice = 7 THEN
		adminPack.InsertIntoPerfumeSite(9, 'Edge Perfume', 'Wild stone',  '50ml','Men', 450);		
	ELSIF choice = 8 THEN	
		adminPack.UpdatePerfumeTableSite(9 , 2000);	
	ELSIF choice = 9 THEN	
		adminPack.delelteFromPerfumeSite(9);
	ELSE
		RAISE Error;
	END IF;
	
EXCEPTION

	WHEN Error THEN
		DBMS_OUTPUT.PUT_LINE('YOU HAVE NOT SELECTED THE RIGHT OPTION. ');	
END;
/


select * from perfume;
select * from alcoholFreePerfume;
