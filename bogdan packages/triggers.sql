CREATE OR REPLACE TRIGGER prediction_environment 
  AFTER INSERT ON users
  FOR EACH ROW
DECLARE
  v_i NUMBER := 0;
  v_max_rows NUMBER := 50;
  v_car_id NUMBER;
  v_max_car_id NUMBER;
  v_inc NUMBER;
BEGIN
  INSERT INTO preferences(user_id) values (:NEW.id);
  SELECT MAX(id) INTO v_max_car_id FROM cars;
  LOOP
    v_car_id := TRUNC(DBMS_RANDOM.VALUE(1,v_max_car_id));
    v_inc := 1;
    BEGIN
      INSERT INTO history 
            VALUES (:NEW.id, 
                    v_car_id, 
                    SYSDATE + v_i / 90600); -- adding 1 second to current timestamp
    EXCEPTION
      WHEN OTHERS THEN
        IF(SQLCODE = -02291) THEN --integrity constraint violated
          DBMS_OUTPUT.PUT_LINE('continue...');
          v_inc := 0;
        ELSE
          RAISE_APPLICATION_ERROR(-20001, 
              'EXCEPTION @TRIGGER(prediction_environment) ' || sqlerrm);
        END IF;
    END;
    v_i := v_i + v_inc;
    EXIT WHEN v_i = v_max_rows;
  END LOOP;
END;