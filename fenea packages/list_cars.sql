create or replace Package queryCars IS


function list_cars(minPrice number, maxPrice number,
      minMileage number, maxMileage number, minEngineCapacity number, maxEngineCapacity number, make varchar,model varchar,body_type varchar, color varchar,
      fuel_type varchar ,pageNr number) return SYS_REFCURSOR;


function search_cars(searchedString varchar,pageNr number) return SYS_REFCURSOR;

END queryCars;

/

CREATE OR REPLACE PACKAGE BODY queryCars IS

function getModel(myModel varchar, myMake varchar) return VARCHAR2 as
  stmt VARCHAR2(256);
  modelid number(9,0);
begin
    modelid:=0;
    if myModel!=NULL then
      select ID into modelid from Models where model like myModel;
      stmt := ' model = ' || to_char(modelid);
    end if;
    return stmt;
end;

function getPrice (minPrice number, maxPrice number) return varchar as
  sir varchar2(256);
begin
  sir:=NULL;
  if minPrice != 0 then
   sir := ' price>= ' || to_char(minPrice) ;
   if(maxPrice  !=0) then
      sir:= sir || ' and price<= ' || to_char(maxPrice);
     end if;
    end if;
  if(maxPrice  != 0) then
    sir :=  ' price<= ' || to_char(maxPrice);
    return sir;
  end if;
end;

function getBodyType (bodytype varchar) return varchar as
  sir varchar2(256);
  body_type_id number(9,0);
begin
  if(bodytype!=NULL ) then
      select id into body_type_id from types where body_type like bodytype;
      sir:= ' body_type_id = ' || to_char(body_type_id);
   ELSE
      sir:=NULL;
  end if;
 return sir;

 exception
  WHEN no_data_found THEN
  DBMS_OUTPUT.PUT_LINE('no data found');
  return NULL;
end;
function getFuelType (fuelType varchar) return varchar as
  sir varchar2(256);
  fuel_id number(9,0);
begin
  if fuelType !=NULL then
      select id into fuel_id from fuel where fuel_type like fuelType;
      sir:= ' color_id = ' || to_char(fuel_id);
   else sir := NULL;
  end if;
 return sir;
 exception
  WHEN no_data_found THEN
  DBMS_OUTPUT.PUT_LINE('no data found');
  return NULL;
end;

function getColor(col varchar) return varchar as
  sir varchar(256);
  color_id number(9,0);
begin
  if col = NULL  THEN
    return NULL;
    end if;
  select id into color_id from colors where color like col;
 sir:= ' color_id = ' || to_char(color_id);
 return sir;
 exception
  WHEN no_data_found THEN
  DBMS_OUTPUT.PUT_LINE('no data found');
  return NULL;
end;

function getSegment(my_column varchar, minim number, maxim number) return varchar as
  sir varchar(256);
begin
  sir := NULL;
  if minim != 0 then
   sir :=  my_column || ' >= ' || to_char(minim);
     if(maxim != 0) then
        sir:= sir || ' and ' || my_column || ' <= ' || to_char(maxim);
     end if;
  ELSE
      if (maxim  !=0) then
        sir :=  my_column || ' <= ' || to_char(maxim);
      end if;
  END IF ;

  return sir;
end;


function list_cars(minPrice number, maxPrice number,
minMileage number, maxMileage number, minEngineCapacity number, maxEngineCapacity number, make varchar,model varchar,body_type varchar, color varchar,
fuel_type varchar ,pageNr number) return SYS_REFCURSOR as
  TYPE ARRAY_TYPE IS TABLE OF NUMBER(9,0);
  ID_ARRAY ARRAY_TYPE;
  stmt varchar2(2048);
  tempstmt varchar2(1024);
  started number(9,0);
  my_column varchar2(50);
  myCursor SYS_REFCURSOR;
  iterator number(9,0);
  id_varchar varchar2(1024);
begin

started:=0;
 stmt :=  '' ;
 my_column:='price';
  DBMS_OUTPUT.PUT_LINE(stmt);
 tempstmt := getSegment(my_column, minPrice , maxPrice);
 if(tempstmt is not NULL) then
   stmt :=stmt || ' where '  || tempstmt;
   started:=1;
 end if;

 my_column:='mileage';
 tempstmt:= getSegment(my_column, minMileage, maxMileage) ;
 if(tempstmt is not NULL ) then
   if(started = 0) then
    stmt := stmt || ' where '  || tempstmt;
     started:=1;
    else
      stmt :=stmt ||  ' and ' || tempstmt;
    end if;
 end if;

 my_column:='engine_capacity';
 tempstmt:= getSegment(my_column,minEngineCapacity,maxEngineCapacity);
  DBMS_OUTPUT.PUT_LINE(tempstmt);
 if(tempstmt is not NULL ) then
   if(started = 0) then
     stmt := stmt || ' where '  || tempstmt;
     started:=1;
    else
      stmt :=stmt || ' and ' ||  tempstmt;
    end if;
 end if;

 tempstmt := getBodyType(body_type);
 if(tempstmt is not NULL ) then
   if(started = 0) then
     stmt := stmt || 'where ' || tempstmt;
     started:=1;
    else
      stmt := stmt || ' and ' ||  tempstmt;
    end if;
 end if;

 tempstmt:= getColor(color);

 if(tempstmt is not NULL ) then
   if(started = 0) then
     stmt := stmt || ' where ' || tempstmt;
     started:=1;
    else
      stmt := stmt || ' and ' || tempstmt;
    end if;
 end if;

  tempstmt:= getFuelType(fuel_type);
 if(tempstmt is not NULL) then
   if(started = 0) then
     stmt := stmt || ' where ' || tempstmt;
     started:=1;
    else
      stmt :=  stmt || ' and ' || tempstmt;
    end if;
 end if;

 stmt := 'select ID  from (select ID, row_number() over (order by id) "nr" from Cars ' || stmt || ' ) where "nr"<= ' || pageNr * 20 || ' and "nr" >=' ||(pageNr-1)*20;
  DBMS_OUTPUT.PUT_LINE(stmt);
  stmt := 'select * from Cars where ID in (' || stmt ||  ')';
   OPEN myCursor FOR stmt;

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
