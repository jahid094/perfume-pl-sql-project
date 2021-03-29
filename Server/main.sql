SET VERIFY OFF;
SET SERVEROUTPUT ON;

DECLARE
	
    
BEGIN
	DBMS_OUTPUT.PUT_LINE('Press 1 to add product into orderlist');
	DBMS_OUTPUT.PUT_LINE('Press 2 to add product into wishlist');
	DBMS_OUTPUT.PUT_LINE('Press 3 to remove product from orderlist');
	DBMS_OUTPUT.PUT_LINE('Press 4 to remove product from wishlist');
	DBMS_OUTPUT.PUT_LINE('Press 5 to see the total cost of orderlist');
	DBMS_OUTPUT.PUT_LINE('Press 6 to move value from wishlist to orderlist');
	DBMS_OUTPUT.PUT_LINE('Press 7 to confirm your order');
	DBMS_OUTPUT.PUT_LINE('Press 8 to view all the perfume');

END;
/

accept X char prompt 'Enter the choice = ';

DECLARE
	choice perfume.pid%TYPE;
	TOTALPRICE perfumeOrderList.price%TYPE;
	Error EXCEPTION;
    
BEGIN
	choice := &X;

	IF choice = 1 THEN
		perfumePack.InsertIntoOrderList(1001);
		DBMS_OUTPUT.PUT_LINE('choice 1');
	ELSIF choice = 2 THEN	
		perfumePack.InsertIntoWishList(2);
		DBMS_OUTPUT.PUT_LINE('choice 2');
	ELSIF choice = 3 THEN	
		perfumePack.RemoveFromOrderList(1001);
		DBMS_OUTPUT.PUT_LINE('choice 3');
	ELSIF choice = 4 THEN	
		perfumePack.RemoveFromWishList(2);
		DBMS_OUTPUT.PUT_LINE('choice 4');
	ELSIF choice = 5 THEN	
		TOTALPRICE := perfumePack.TOTALCOST('TRUE');
		DBMS_OUTPUT.PUT_LINE('choice 5');
		DBMS_OUTPUT.PUT_LINE('Total cost is ' || TOTALPRICE);
	ELSIF choice = 6 THEN	
		perfumePack.MoveToOrderlistFromWishlist();
		
		DBMS_OUTPUT.PUT_LINE('choice 6');
	ELSIF choice = 7 THEN	
		perfumePack.confirmOrder();
	ELSIF choice = 8 THEN	
		FOR R IN (SELECT * FROM perfumeView) LOOP
			DBMS_OUTPUT.PUT_LINE(R.Pid || CHR(9)||CHR(9)|| R.Perfume_Name || CHR(9)||CHR(9)|| R.Perfume_Brand || CHR(9)||CHR(9)|| R.Capacity || CHR(9)||CHR(9)|| R.Gender || CHR(9)||CHR(9)|| R.Perfume_Price );
		END LOOP;
	ELSE
		RAISE Error;
	END IF;
	
EXCEPTION

	WHEN Error THEN
		DBMS_OUTPUT.PUT_LINE('YOU HAVE NOT SELECTED THE RIGHT OPTION. ');	
END;
/

select * from perfume;
select * from perfume@site1;
select * from alcoholFreePerfume;


select * from perfumeOrderList;
select * from perfumeWishlist;
select * from orderNumber;
select * from orderDetails;
