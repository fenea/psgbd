alter session set NLS_NUMERIC_CHARACTERS = '.,';


CREATE OR REPLACE TRIGGER students_scholarship
  AFTER 
    INSERT OR
    UPDATE ON note
  FOR EACH ROW
DECLARE
  PRAGMA AUTONOMOUS_TRANSACTION;
  v_scholarship studenti.bursa%TYPE;
  v_study_year studenti.an%TYPE;
  v_id studenti.nr_matricol%TYPE;
  v_counter NUMBER(10, 0);
  v_student_mean NUMBER(9, 2);
  v_max_student_mean NUMBER(9, 2);
BEGIN
  SELECT bursa, an INTO v_scholarship, v_study_year 
            FROM studenti WHERE nr_matricol = :NEW.nr_matricol;
  dbms_output.put_line('new grade ' || :NEW.valoare);
  dbms_output.put_line('old grade ' || :OLD.valoare);
  IF(:NEW.valoare < 5) THEN
    dbms_output.put_line('VALUE LOWER THEN 5');
    IF(v_scholarship IS NOT NULL) THEN
      UPDATE studenti SET bursa = null WHERE nr_matricol = :NEW.nr_matricol;
      COMMIT;
      update_scholarships();
    END IF;
  ELSE
    --GET OLD STUDENT MEAN (NOT YET COMMITED)
    SELECT COUNT(VALOARE), AVG(valoare) INTO v_counter, v_student_mean 
           FROM note WHERE nr_matricol = :NEW.nr_matricol;
    --COMPUTE NEW MEAN
    DBMS_OUTPUT.PUT_LINE('OLD MEAN: ' || v_student_mean);
    v_student_mean := (v_student_mean * v_counter - :OLD.valoare + :NEW.valoare) / v_counter;
    DBMS_OUTPUT.PUT_LINE('NEW MEAN: ' || v_student_mean);
    SELECT MAX(AVG(VALOARE)) INTO v_max_student_mean 
           FROM studenti natural join note
           WHERE an = v_study_year AND nr_matricol <> :NEW.nr_matricol
           GROUP BY nr_matricol;
    DBMS_OUTPUT.PUT_LINE('MAX MEAN BESIDES THIS: ' || v_max_student_mean);
    IF(v_max_student_mean <= v_student_mean) THEN
      v_max_student_mean := v_student_mean;
      UPDATE studenti SET bursa = 1 WHERE nr_matricol = :NEW.nr_matricol;
      COMMIT;
    END IF;
    SYS.DBMS_OUTPUT.PUT_LINE(v_student_mean || ' ' || v_max_student_mean);
   IF(v_student_mean = v_max_student_mean) THEN
      /*
        * SET ALL STUDENTS SCHOLARSHIPS THAT DO NOT HAVE MAX MEAN IN THAT YEAR TO NULL
        * AND UPDATE STUDENTS SCHOLARSHIPS THAt HAVE MAX MEAN IN THAN YEAR
      */ 
      UPDATE studenti SET bursa = NULL
             WHERE bursa IS NOT NULL AND 
                   an = v_study_year AND
                   (SELECT AVG(VALOARE) FROM NOTE 
                           WHERE nr_matricol = studenti.nr_matricol) 
                    < v_max_student_mean;
      
      /*UPDATE studenti SET bursa = 1
             WHERE bursa IS NULL AND 
                   an = v_study_year AND
                   (SELECT AVG(VALOARE) FROM NOTE 
                           WHERE nr_matricol = studenti.nr_matricol) 
                    = v_max_student_mean;*/
      COMMIT;
      update_scholarships();
    END IF;
  END IF;
EXCEPTION
    WHEN OTHERS THEN
      dbms_output.put_line('WTF?!!!: ' || sqlerrm);
END;

/

CREATE OR REPLACE PROCEDURE update_scholarships AS
  v_scholarship_counter NUMBER(10, 0);
  v_year_scholarship_counter NUMBER(10, 0);
  v_year_scholarship NUMBER(9, 2);
  v_faculty_scholarship NUMBER(9, 2) := 1000;
  v_temp NUMBER(9, 2);
  v_max_mean NUMBER(9, 2);
BEGIN

  --SEE FOR HOW MANY YEARS TO DIVIDE AMOUNT OF MONEY
  SELECT COUNT(DISTINCT an) INTO v_scholarship_counter
         FROM (SELECT AN
               FROM studenti s LEFT JOIN note n  on n.nr_matricol = s.nr_matricol
               GROUP BY s.nr_matricol, an
               HAVING MIN(valoare) > 4 OR MIN(valoare) IS NULL);
  v_year_scholarship := v_faculty_scholarship / v_scholarship_counter;
  
  --UPDATE EVERY STUDENT SCHOLARSHIP
  FOR v_i IN 1 .. 3 LOOP
    /*SELECT COUNT(*) INTO v_year_scholarship_counter 
           FROM studenti WHERE an = v_i AND bursa IS NOT NULL;
    IF(v_year_scholarship_counter > 0) THEN
      -- COMPUTE NEW SCHOLARSHIP FOR THIS YEAR (V_I) AND ASSIGN TO STUDENTS;
      v_temp := v_year_scholarship / v_year_scholarship_counter;
      UPDATE studenti SET bursa = v_temp
             WHERE an = v_i AND bursa IS NOT NULL;
    ELSE*/
      BEGIN
        --COMPUTE MAX MEAN FOR YEAR v_i
        SELECT MAX(TRUNC(AVG(valoare), 2))INTO v_max_mean
        FROM studenti s LEFT JOIN note n ON n.nr_matricol = s.nr_matricol
        WHERE an = v_i
        GROUP BY s.nr_matricol
        HAVING MIN(valoare) > 4 OR MIN(valoare) IS NULL;
        dbms_output.put_line(v_i || ' ' ||v_max_mean);
        
        --FIND HOW MANY STUDENTS HAVE MAX MEAN IN v_i YEAR
        IF(v_max_mean IS NULL) THEN
          SELECT COUNT(*) INTO v_year_scholarship_counter FROM
            (SELECT distinct s.nr_matricol
            FROM studenti s LEFT JOIN note n ON n.nr_matricol = s.nr_matricol
            WHERE an = v_i
            GROUP BY s.nr_matricol 
            HAVING TRUNC(AVG(valoare), 2) IS NULL);
        ELSE
          SELECT COUNT(*) INTO v_year_scholarship_counter FROM
            (SELECT COUNT(distinct s.nr_matricol)
            FROM studenti s LEFT JOIN note n ON n.nr_matricol = s.nr_matricol
            WHERE an = v_i
            GROUP BY s.nr_matricol 
            HAVING TRUNC(AVG(valoare), 2) = v_max_mean);
        END IF;
        dbms_output.put_line(v_i || ' ' || v_year_scholarship_counter);
        
        --COMPUTE AMOUNT OF MONEY TO GIVE TO THAT STUDENTS
        v_temp := v_year_scholarship / v_year_scholarship_counter;
      
        --UPDATE
        UPDATE studenti SET bursa = v_temp
        WHERE (SELECT TRUNC(AVG(VALOARE), 2) 
               FROM studenti s LEFT JOIN note n ON n.nr_matricol = s.nr_matricol
               WHERE S.NR_MATRICOL = STUDENTI.NR_MATRICOL)
                  = v_max_mean;
        EXCEPTION
          WHEN NO_DATA_FOUND THEN
            DBMS_OUTPUT.PUT_LINE('NO DATA FOUND');
          WHEN ZERO_DIVIDE THEN
            DBMS_OUTPUT.PUT_LINE('OOOPS');
        END;
  END LOOP;
  COMMIT;
END;


select nr_matricol, avg(valoare) from studenti natural join note where an = 2 group by nr_matricol;