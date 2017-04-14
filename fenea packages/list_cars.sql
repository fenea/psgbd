create or replace Package queryCars IS


function list_cars(minPrice number, maxPrice number,
      minMileage number, maxMileage number, minEngineCapacity number, maxEngineCapacity number, make varchar,model varchar,body_type varchar, color varchar,
      fuel_type varchar ,pageNr number) return SYS_REFCURSOR;

function search_cars(searchedString varchar,pageNr number) return SYS_REFCURSOR;

END queryCars;


CREATE OR REPLACE PACKAGE BODY queryCars IS

function getModel(myModel varchar, myMake varchar) return varchar as
  sir varchar(50);
  modelid number(9,0);
begin
    if myModel!='' then
      select ID into modelid from Models where model like myModel;
      sir:= ' model_id = ' || to_char(myModel);
    else return ' ';
    end if;
    return sir;
end;
function getPrice (minPrice number, maxPrice number) return varchar as
  sir varchar2(50);
begin
  if minPrice != 0 then
   sir := ' price>= ' || to_char(minPrice) ;
   if(maxPrice  !=0) then
      sir:= sir || ' and price<= ' || to_char(maxPrice);
     end if;
    end if;
  if(maxPrice  !=0) then
    sir :=  ' price<= ' || to_char(maxPrice);
    return sir;
  end if;
end;
function getBodyType (bodytype varchar) return varchar as
  sir varchar2(50);
  body_type_id number(9,0);
begin
  select id into body_type_id from types where body_type like bodytype;
 sir:= ' body_type_id = ' || to_char(body_type_id);
 return sir;
 exception
  WHEN no_data_found THEN
  DBMS_OUTPUT.PUT_LINE('no data found');
  return ' ';
end;
function getFuelType (fuelType varchar) return varchar as
  sir varchar2(50);
  fuel_id number(9,0);
begin
  if fuelType not like '' then
    select id into fuel_id from fuel where fuel_type like fuelType;
    sir:= ' color_id = ' || to_char(fuel_id);
    else sir := ' ';
 end if;
 return sir;
 exception
  WHEN no_data_found THEN
  DBMS_OUTPUT.PUT_LINE('no data found');
  return ' ';
end;
function getColor(col varchar) return varchar as
  sir varchar(50);
  color_id number(9,0);
begin
  select id into color_id from colors where color like col;
 sir:= ' color_id = ' || to_char(color_id);
 return sir;
 exception
  WHEN no_data_found THEN
  DBMS_OUTPUT.PUT_LINE('no data found');
  return ' ';
end;

function getSegment(my_column varchar, minim number, maxim number) return varchar as
sir varchar(50);
begin
  if minim != 0 then
   sir :=  my_column || ' >= ' || to_char(minim);
     if(maxim !=0) then
        sir:= sir || ' and ' || my_column || ' <= ' || to_char(maxim);
     end if;
  end if;
  if (maxim  !=0) then
    sir :=  my_column || ' <= ' || to_char(maxim);
    return sir;
  end if;
  sir := ' ';
  return sir;
end;



function list_cars(minPrice number, maxPrice number,
minMileage number, maxMileage number, minEngineCapacity number, maxEngineCapacity number, make varchar,model varchar,body_type varchar, color varchar,
fuel_type varchar ,pageNr number) return SYS_REFCURSOR as
  TYPE ARRAY_TYPE IS TABLE OF NUMBER(9,0);
  ID_ARRAY ARRAY_TYPE;
  stmt varchar2(512);
  tempstmt varchar2(512);
  started number(9,0);
  my_column varchar2(50);
  myCursor SYS_REFCURSOR;
  iterator number(9,0);
  id_varchar varchar2(512);
begin
started:=0;
 stmt :=  ' '  ;
 my_column:='price';
  DBMS_OUTPUT.PUT_LINE(stmt);
 tempstmt := getSegment(my_column, minPrice , maxPrice);
 if(tempstmt not like ' ') then
   stmt :=stmt || ' where '  || tempstmt;
   started:=1;
 end if;
  DBMS_OUTPUT.PUT_LINE(stmt);

 my_column:='mileage';
 tempstmt:= getSegment(my_column, minMileage, maxMileage) ;
 if(tempstmt not like ' ') then
   if(started = 0) then
    stmt :=stmt || ' where '  || tempstmt;
     started:=1;
    else
      stmt :=stmt ||  ' and ' || tempstmt;
    end if;
 end if;
  DBMS_OUTPUT.PUT_LINE(stmt);
 my_column:='engine_capacity';
 tempstmt:= getSegment(my_column,minEngineCapacity,maxEngineCapacity);
 if(tempstmt not like ' ') then
   if(started = 0) then
     stmt := stmt || ' where '  || tempstmt;
     started:=1;
    else
      stmt :=stmt || 'and ' ||  tempstmt;
    end if;
 end if;
  DBMS_OUTPUT.PUT_LINE(stmt);
 tempstmt:= getBodyType(body_type);
 if(tempstmt not like ' ') then
   if(started = 0) then
     stmt := stmt || 'where ' || tempstmt;
     started:=1;
    else
      stmt := stmt || 'and ' ||  tempstmt;
    end if;
 end if;
  DBMS_OUTPUT.PUT_LINE(stmt);
 tempstmt:= getBodyType(body_type);
 if(tempstmt not like ' ') then
   if(started = 0) then
     stmt := stmt || 'where ' || tempstmt;
     started:=1;
    else
      stmt := stmt ||  'and ' || tempstmt;
    end if;
 end if;
 tempstmt:= getColor(color);
 if(tempstmt not like ' ') then
   if(started = 0) then
     stmt := stmt || 'where ' || tempstmt;
     started:=1;
    else
      stmt := stmt || ' and ' || tempstmt;
    end if;
 end if;
  tempstmt:= getFuelType(fuel_type);
 if(tempstmt not like ' ') then
   if(started = 0) then
     stmt := stmt || 'where ' || tempstmt;
     started:=1;
    else
      stmt :=  stmt || 'and ' || tempstmt;
    end if;
 end if;
 stmt := ' select ID BULK COLLECT INTO ID_ARRAY from (select ID , row_number() over (order by id) nr from Cars ' || stmt || ' ) where nr<= ' || pageNr * 20 || ' and nr >=' ||(pageNr-1)*20 || ';';
  DBMS_OUTPUT.PUT_LINE(stmt);
  execute immediate stmt;
  id_varchar:= '(' || ID_ARRAY(1);
 FOR iterator IN 2..ID_ARRAY.COUNT loop
  id_varchar:=id_varchar || ',' || ID_ARRAY(iterator);
  DBMS_OUTPUT.PUT_LINE(ID_ARRAY(iterator));
  end loop;
  id_varchar:=id_varchar || ')';
   OPEN myCursor FOR select * from Cars where ID in id_varchar;

   DBMS_OUTPUT.PUT_LINE(stmt);
  return myCursor;

end;
function search_cars(searchedString varchar,pageNr number) return SYS_REFCURSOR as
subsir varchar2(256) := '%'|| lower(searchedString) || '%';
 myCursor  SYS_REFCURSOR;

begin
  DBMS_OUTPUT.PUT_LINE(subsir);
  open myCursor for select * from Cars where ID in
    (select ID from (select c.ID , row_number() over (order by c.id) nr from
    (select  id  from MODELS where lower(make) like subsir or lower(model) like subsir ) m join Cars c on m.id = c.model_id) where nr<=20*pageNr and nr>(pageNr-1));

    return myCursor;
exception
  WHEN no_data_found THEN
    DBMS_OUTPUT.PUT_LINE('no data found');
  return NULL;
end;

end queryCars;
