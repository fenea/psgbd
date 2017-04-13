create or replace Package logUser IS
function login(usernam varchar , pass varchar) return int;
function signup(name varchar, forename varchar,username varchar, email varchar ,pass varchar , phoneNumber varchar ) return int;
function update_password(userID int,oldPass varchar, newPass varchar) return int;
/*function updateForename(userID int, newForename varchar) return int; */

END logUser;




CREATE OR REPLACE PACKAGE BODY logUser IS
function login(usernam varchar , pass varchar) return int as
passDB varchar2(256);
begin
 select password into passDB from Users where username like usernam;
  if pass = passDB then
  return 1;
  end if;
  return 0;
  exception
  WHEN no_data_found THEN
  DBMS_OUTPUT.PUT_LINE('no data found');
  return -1;
end;

function signup(name varchar, forename varchar,username varchar, email varchar ,pass varchar , phoneNumber varchar ) return int as
begin
       /* create sequence SEQUENCE userID INCREMENT BY 1 START WITH 10000 */
  insert into Users values ( userIDseq.nextval ,  name, forename,username, email , pass, phoneNumber);
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
