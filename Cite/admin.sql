SET VERIFY OFF;
SET SERVEROUTPUT ON;

DECLARE
	
    
BEGIN
	DBMS_OUTPUT.PUT_LINE('Press 1 to insert product to perfume table');
	DBMS_OUTPUT.PUT_LINE('Press 2 to update product from perfume table');
	DBMS_OUTPUT.PUT_LINE('Press 3 to delete product from perfume table');
	
	
	DBMS_OUTPUT.PUT_LINE('Press 4 to insert into Perfume server table');
	DBMS_OUTPUT.PUT_LINE('Press 5 to update into Perfume server table');
	DBMS_OUTPUT.PUT_LINE('Press 6 to delete into Perfume server table');

END;
/

accept X char prompt 'Enter the choice = ';

DECLARE
	choice perfume.pid%TYPE;
	Error EXCEPTION;
    
BEGIN
	choice := &X;

	IF choice = 1 THEN
		adminPack.InsertIntoPerfume(8, 'Edge Perfume', 'Wild stone',  '50ml','Men', 450);
	ELSIF choice = 2 THEN	
		adminPack.UpdatePerfumeTable(29 , 2000);		
	ELSIF choice = 3 THEN	
		adminPack.delelteFromPerfumeTable(29);	

	ELSIF choice = 4 THEN
		adminPack.InsertIntoPerfumeServer(20, 'Edge Perfume', 'Wild stone',  '50ml','Men', 450);		
	ELSIF choice = 5 THEN	
		adminPack.UpdatePerfumeTableServer(20 , 2000);	
	ELSIF choice = 6 THEN	
		adminPack.delelteFromPerfumeServer(20);
	ELSE
		RAISE Error;
	END IF;
	
EXCEPTION

	WHEN Error THEN
		DBMS_OUTPUT.PUT_LINE('YOU HAVE NOT SELECTED THE RIGHT OPTION. ');	
END;
/


select * from perfume;
