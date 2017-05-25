create or replace Package logUser IS
function login(usernam varchar , pass varchar ,tok  VARCHAR2) return VARCHAR2;
function signup(name varchar, forename varchar,username varchar, email varchar ,pass varchar , phoneNumber varchar ) return int;
function update_password(userID int,oldPass varchar, newPass varchar) return int;
/*function updateForename(userID int, newForename varchar) return int; */

END logUser;


CREATE OR REPLACE PACKAGE BODY logUser IS
function login(usernam varchar , pass varchar ,tok  VARCHAR2) return VARCHAR2 as
 passDB varchar2(256);
 tokenDB varchar(255);
 returned_token VARCHAR2(256);
begin
 select password into passDB from Users where username like usernam;
  if rawtohex(dbms_crypto.hash(to_clob(pass), 3)) = passDB then
   select token into tokenDB from USERS where USERNAME like usernam;
   if  tokenDB is NULL THEN
    update Users set token = tok where username like usernam;
    returned_token:=tok;
    ELSE
    returned_token :=tokenDB;
   END IF;
  return returned_token;
  end if;
  return NULL ;

  exception
  WHEN no_data_found THEN
  DBMS_OUTPUT.PUT_LINE('no data found');
  return NULL;
end;

function signup(name varchar, forename varchar,username varchar, email varchar ,pass varchar , phoneNumber varchar ) return int as
begin
       /* create sequence SEQUENCE userID INCREMENT BY 1 START WITH 10000 */
  insert into Users (ID, NAME, FORENAME, USERNAME, EMAIL, PASSWORD, PHONE_NUMBER) values ( userID.nextval ,  name, forename,username, email , rawtohex(dbms_crypto.hash(to_clob(pass), 3)), phoneNumber);
  return 1;
exception
when DUP_VAL_ON_INDEX then
 DBMS_OUTPUT.PUT_LINE('unique constraint violated');
  return -1;
end;

function update_password(userID int,oldPass varchar, newPass varchar) return int as
passDB varchar2(256);
begin
 select password into passDB from Users where ID like userID;
 if (rawtohex(dbms_crypto.hash(to_clob(oldPass), 3))) = passDB then
  update Users set password = rawtohex(dbms_crypto.hash(to_clob(newPass), 3)) where ID = userID;
  return 1;
  end if;
  return 0;
  exception
  WHEN no_data_found THEN
  DBMS_OUTPUT.PUT_LINE('no data found');
  return -1;
end;

end logUser;
