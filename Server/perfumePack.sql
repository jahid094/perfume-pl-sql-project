SET VERIFY OFF;
SET SERVEROUTPUT ON;

CREATE OR REPLACE PACKAGE perfumePack AS
	FUNCTION TOTALCOST(STRG IN VARCHAR2)
	RETURN NUMBER;
	
	PROCEDURE InsertIntoOrderList(ID IN perfume.pid%TYPE );
	PROCEDURE InsertIntoWishList(ID IN perfume.pid%TYPE );
	PROCEDURE RemoveFromOrderList(ID IN perfumeOrderList.pid%TYPE );
	PROCEDURE RemoveFromWishList(ID IN perfumeWishlist.pid%TYPE );
	PROCEDURE MoveToOrderlistFromWishlist;
	PROCEDURE confirmOrder;
END perfumePack;
/

CREATE OR REPLACE PACKAGE BODY perfumePack AS

	FUNCTION TOTALCOST(STRG IN VARCHAR2)
	RETURN NUMBER
	IS 
	
	TOTAL perfumeOrderList.price%TYPE := 0;
	
	BEGIN
			FOR R IN (SELECT * FROM perfumeOrderList) LOOP
				IF STRG = 'TRUE' THEN	
					TOTAL := TOTAL + R.price;		
				END IF;
			END LOOP;
		RETURN TOTAL;
	END TOTALCOST;

	PROCEDURE InsertIntoOrderList(ID IN perfume.pid%TYPE )
	IS
		PID perfume.pid%TYPE;
		PNAME perfume.pname%TYPE;
		BRAND perfume.brand%TYPE;
		CAPACITY perfume.capacity%TYPE;
		GENDER perfume.gender%TYPE;
		PRICE perfume.price%TYPE;
	BEGIN

			-- FOR R IN (SELECT * FROM perfume) LOOP
				-- IF ID = R.pid THEN
					-- SELECT pid,pname,brand,capacity,gender,price INTO PID,PNAME, BRAND,CAPACITY,GENDER,PRICE FROM perfume WHERE pid = R.pid;
					-- INSERT into perfumeOrderList values(PID, PNAME, BRAND, CAPACITY,GENDER,PRICE);
					-- DBMS_OUTPUT.PUT_LINE('Product added to orderlist');
				-- END IF;
				
			
			-- END LOOP;
			
			FOR R IN (SELECT * FROM perfumeView) LOOP
				IF ID = R.Pid THEN
					SELECT Pid,Perfume_Name,Perfume_Brand,Capacity,Gender,Perfume_Price INTO PID,PNAME, BRAND,CAPACITY,GENDER,PRICE FROM perfumeView WHERE pid = R.Pid;
					INSERT into perfumeOrderList values(PID, PNAME, BRAND, CAPACITY,GENDER,PRICE);
					DBMS_OUTPUT.PUT_LINE('Product added to orderlist');
				END IF;
				--DBMS_OUTPUT.PUT_LINE(R.Pid || CHR(9)||CHR(9)|| R.Perfume_Name || CHR(9)||CHR(9)|| R.Perfume_Brand || CHR(9)||CHR(9)|| R.Capacity || CHR(9)||CHR(9)|| R.Gender || CHR(9)||CHR(9)|| R.Perfume_Price );
			END LOOP;
	END InsertIntoOrderList;
	
	
	PROCEDURE InsertIntoWishList(ID IN perfume.pid%TYPE )
	IS
		PID perfume.pid%TYPE;
		PNAME perfume.pname%TYPE;
		BRAND perfume.brand%TYPE;
		CAPACITY perfume.capacity%TYPE;
		GENDER perfume.gender%TYPE;
		PRICE perfume.price%TYPE;
	BEGIN

			-- FOR R IN (SELECT * FROM perfume) LOOP
				-- IF ID = R.pid THEN
					-- SELECT pid,pname,brand,capacity,gender,price INTO PID,PNAME, BRAND,CAPACITY,GENDER,PRICE FROM perfume WHERE pid = R.pid;
					-- INSERT into perfumeWishlist values(PID, PNAME, BRAND, CAPACITY,GENDER,PRICE);
					-- DBMS_OUTPUT.PUT_LINE('Product added to Wishlist');
				-- END IF;
				
			
			-- END LOOP;
			FOR R IN (SELECT * FROM perfumeView) LOOP
				IF ID = R.Pid THEN
					SELECT Pid,Perfume_Name,Perfume_Brand,Capacity,Gender,Perfume_Price INTO PID,PNAME, BRAND,CAPACITY,GENDER,PRICE FROM perfumeView WHERE pid = R.Pid;
					INSERT into perfumeWishlist values(PID, PNAME, BRAND, CAPACITY,GENDER,PRICE);
					DBMS_OUTPUT.PUT_LINE('Product added to orderlist');
				END IF;
				--DBMS_OUTPUT.PUT_LINE(R.Pid || CHR(9)||CHR(9)|| R.Perfume_Name || CHR(9)||CHR(9)|| R.Perfume_Brand || CHR(9)||CHR(9)|| R.Capacity || CHR(9)||CHR(9)|| R.Gender || CHR(9)||CHR(9)|| R.Perfume_Price );
			END LOOP;	
	END InsertIntoWishList;
	
	PROCEDURE RemoveFromOrderList(ID IN perfumeOrderList.pid%TYPE )
	IS

	BEGIN
			FOR R IN (SELECT * FROM perfumeOrderList) LOOP
				IF ID = R.pid THEN
					DELETE FROM perfumeOrderList WHERE pid = R.pid;
					DBMS_OUTPUT.PUT_LINE(R.pid || ' no product:' || R.pname || ' has been removed from orderlist');
				END IF;
				
			
			END LOOP;
	END RemoveFromOrderList;
	
	PROCEDURE RemoveFromWishList(ID IN perfumeWishlist.pid%TYPE )
	IS

	BEGIN
			FOR R IN (SELECT * FROM perfumeWishlist) LOOP
				IF ID = R.pid THEN
					DELETE FROM perfumeWishlist WHERE pid = R.pid;
					DBMS_OUTPUT.PUT_LINE(R.pid || ' no product:' || R.pname || ' has been removed from Wishlist');
				END IF;	
			END LOOP;
	END RemoveFromWishList;
	
	PROCEDURE MoveToOrderlistFromWishlist
	IS
		PID perfume.pid%TYPE;
		PNAME perfume.pname%TYPE;
		BRAND perfume.brand%TYPE;
		CAPACITY perfume.capacity%TYPE;
		GENDER perfume.gender%TYPE;
		PRICE perfume.price%TYPE;
	BEGIN
		FOR R IN (SELECT * FROM perfumeWishlist) LOOP
			SELECT pid,pname,brand,capacity,gender,price INTO PID,PNAME, BRAND,CAPACITY,GENDER,PRICE FROM perfumeWishlist WHERE pid = R.pid;
			INSERT into perfumeOrderList values(PID, PNAME, BRAND, CAPACITY,GENDER,PRICE);
			DELETE FROM perfumeWishlist WHERE pid = R.pid;
		END LOOP;
	END MoveToOrderlistFromWishlist;
	
	
	PROCEDURE confirmOrder
	IS
		TotalPrice perfumeOrderList.price%TYPE := 0;
		Id integer := 569;
		--num integer := 0;
		PID perfumeOrderList.pid%TYPE;
		PNAME perfumeOrderList.pname%TYPE;
		BRAND perfumeOrderList.brand%TYPE;
		CAPACITY perfumeOrderList.capacity%TYPE;
		GENDER perfumeOrderList.gender%TYPE;
		PRICE perfumeOrderList.price%TYPE;
	BEGIN
		TotalPrice := perfumePack.TOTALCOST('TRUE');
		--Id := orderVal.nextval;
		--select orderVal.nextval into Id from orderNumber;
		INSERT into orderNumber values(orderVal.nextval, TotalPrice );
		
		
		DBMS_OUTPUT.PUT_LINE('CONFIRM');
		DBMS_OUTPUT.PUT_LINE(TotalPrice);
		--DBMS_OUTPUT.PUT_LINE(Id);
		
		FOR R IN (SELECT * FROM perfumeOrderList) LOOP
			-- SELECT Count(pid) INTO num FROM perfumeOrderList WHERE pid = R.pid;
			-- IF num >  THEN
				-- Executable Code
			-- END IF;
			
	
			FOR S IN (SELECT * FROM perfumeOrderList) LOOP
				PID := S.pid;
				
					
				IF PID = R.pid THEN
					PNAME := S.pname;
					BRAND := S.brand;
					CAPACITY := S.capacity;
					GENDER := S.gender;
					PRICE := S.price;
					INSERT into orderDetails values(orderVal.currval, PID, PNAME, BRAND, CAPACITY, GENDER, PRICE);
				END IF;
			END LOOP;



			--SELECT pid,pname,brand,capacity,gender,price INTO PID, PNAME, BRAND, CAPACITY, GENDER, PRICE FROM perfumeOrderList WHERE pid = R.pid;
			--INSERT into orderDetails values(Id, PID, PNAME, BRAND, CAPACITY, GENDER, PRICE);
			DELETE FROM perfumeOrderList WHERE pid = R.pid;
		END LOOP;
		
	END confirmOrder;
	
END perfumePack;
/


