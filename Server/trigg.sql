SET SERVEROUTPUT ON;

drop trigger INSERT1;
drop trigger INSERT2;
drop trigger UPDATE1;
drop trigger UPDATE2;
drop trigger DELETE1;
drop trigger DELETE2;

CREATE OR REPLACE TRIGGER INSERT1
AFTER INSERT
ON perfume
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Insert successful in perfume table');
END;
/

CREATE OR REPLACE TRIGGER INSERT2 
AFTER INSERT 
ON alcoholFreePerfume
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Insert successful in alcoholFreePerfume table');
END;
/

CREATE OR REPLACE TRIGGER UPDATE1 
AFTER UPDATE
ON perfume 
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Update successful in perfume table');
END;
/

CREATE OR REPLACE TRIGGER UPDATE2 
AFTER UPDATE
ON alcoholFreePerfume
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Update successful in alcoholFreePerfume table');
END;
/


CREATE OR REPLACE TRIGGER DELETE1 
AFTER DELETE
ON perfume 
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Delete successful in perfume table');
END;
/

CREATE OR REPLACE TRIGGER DELETE2 
AFTER DELETE
ON alcoholFreePerfume
DECLARE
BEGIN
	DBMS_OUTPUT.PUT_LINE('Delete successful in alcoholFreePerfume table');
END;
/

