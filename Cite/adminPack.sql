SET VERIFY OFF;
SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE adminPack AS
	PROCEDURE InsertIntoPerfume(PID perfume.pid%TYPE , PNAME perfume.pname%TYPE , BRAND perfume.brand%TYPE, CAPACITY perfume.capacity%TYPE, GENDER perfume.gender%TYPE, PRICE perfume.price%TYPE  );
	PROCEDURE InsertIntoPerfumeServer(PID perfume.pid%TYPE , PNAME perfume.pname%TYPE , BRAND perfume.brand%TYPE, CAPACITY perfume.capacity%TYPE, GENDER perfume.gender%TYPE, PRICE perfume.price%TYPE  );
	
	PROCEDURE UpdatePerfumeTable(ID perfume.pid%TYPE, PRICE perfume.price%TYPE);
	PROCEDURE UpdatePerfumeTableServer(ID perfume.pid%TYPE, PRICE perfume.price%TYPE);
	
	PROCEDURE delelteFromPerfumeTable(ID perfume.pid%TYPE);
	PROCEDURE delelteFromPerfumeServer(ID perfume.pid%TYPE);
	
END adminPack;
/

CREATE OR REPLACE PACKAGE BODY adminPack AS

	PROCEDURE InsertIntoPerfume(PID perfume.pid%TYPE , PNAME perfume.pname%TYPE , BRAND perfume.brand%TYPE, CAPACITY perfume.capacity%TYPE, GENDER perfume.gender%TYPE, PRICE perfume.price%TYPE  )
	IS
	BEGIN
		INSERT into perfume values(PID, PNAME, BRAND, CAPACITY,GENDER,PRICE);

	END InsertIntoPerfume;
	
	
	
	
	PROCEDURE UpdatePerfumeTable(ID perfume.pid%TYPE, PRICE perfume.price%TYPE)
	IS
		pefumePrice perfume.price%TYPE;
	BEGIN
		pefumePrice := PRICE;
		FOR R IN (SELECT * FROM perfume) LOOP
			IF ID = R.pid THEN
				UPDATE perfume SET price = pefumePrice WHERE R.pid  = pid;
				DBMS_OUTPUT.PUT_LINE('Product updated successfully');
			END IF;
		END LOOP;

	END UpdatePerfumeTable;
	
	
	
	PROCEDURE delelteFromPerfumeTable(ID perfume.pid%TYPE)
	IS

	BEGIN
		FOR R IN (SELECT * FROM perfume) LOOP
			IF ID = R.pid THEN
				DELETE FROM perfume WHERE pid = R.pid;
				DBMS_OUTPUT.PUT_LINE('Product deleted successfully');
			END IF;
		END LOOP;

	END delelteFromPerfumeTable;
	
	
	
	
	
	
	PROCEDURE InsertIntoPerfumeServer(PID perfume.pid%TYPE , PNAME perfume.pname%TYPE , BRAND perfume.brand%TYPE, CAPACITY perfume.capacity%TYPE, GENDER perfume.gender%TYPE, PRICE perfume.price%TYPE  )
	IS
	counter number :=0 ;
	BEGIN

		DBMS_OUTPUT.PUT_LINE(counter);
		DBMS_OUTPUT.PUT_LINE(PID);
		
		--select price into counter from perfume where pid=PID; 
		FOR R IN (SELECT * FROM perfume) LOOP
			IF PID = R.pid THEN
				counter := counter + 1;
			END IF;
		END LOOP;
		
		DBMS_OUTPUT.PUT_LINE(counter);
		
		IF counter = 0 THEN
			INSERT into perfume@server1 values(PID, PNAME, BRAND, CAPACITY,GENDER,PRICE);	
			commit;
		ELSE
			DBMS_OUTPUT.PUT_LINE('Perfume already exits!');
		END IF;
	END InsertIntoPerfumeServer;
	
	
	
	
	PROCEDURE UpdatePerfumeTableServer(ID perfume.pid%TYPE, PRICE perfume.price%TYPE)
	IS
		pefumePrice perfume.price%TYPE;
	BEGIN
		DBMS_OUTPUT.PUT_LINE(ID);
		DBMS_OUTPUT.PUT_LINE(PRICE);
		pefumePrice := PRICE;
		FOR R IN (SELECT * FROM perfume@server1) LOOP
			IF ID = R.pid THEN
				
				UPDATE perfume@server1 SET price = pefumePrice WHERE pid = R.pid;
				commit;
				DBMS_OUTPUT.PUT_LINE('Product updated successfully');
			END IF;
		END LOOP;

	END UpdatePerfumeTableServer;
	
	
	
	PROCEDURE delelteFromPerfumeServer(ID perfume.pid%TYPE)
	IS

	BEGIN
		FOR R IN (SELECT * FROM perfume@server1) LOOP
			IF ID = R.pid THEN
				DELETE FROM perfume@server1 WHERE pid = R.pid;
				commit;
				DBMS_OUTPUT.PUT_LINE('Product deleted successfully');
			END IF;
		END LOOP;

	END delelteFromPerfumeServer;
	

END adminPack;
/


