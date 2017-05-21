create or replace package suggestion as
    type ret_cursor is ref cursor;
    type preferences is table of number index by pls_integer;
    type approximation is record (mini NUMBER(9, 0) := 999999999, 
                                  maxi NUMBER(9, 0) := 0);
    
    procedure suggestion_on_car_page(p_res OUT ret_cursor, p_user_id IN users.id%type, p_car_id IN cars.id%type);
    procedure suggestion_algorithm(p_user_id users.id%type);
end suggestion;

/

create or replace package body suggestion as
    procedure suggestion_on_car_page(p_res OUT ret_cursor, p_user_id IN users.id%type, p_car_id IN cars.id%type) as
        v_car cars%ROWTYPE;
    begin
        insert into history values (p_user_id, p_car_id, sysdate);
        select * into v_car from cars where id = p_car_id;
        open p_res for select * from (select * from cars 
                                      where model_id = v_car.model_id and
                                            id != p_car_id and
                                            abs(price - v_car.price) < 2000)
                                where rownum < 6;
    end suggestion_on_car_page;
    
    procedure inc_value(p_array in out preferences, p_key IN NUMBER) as
    begin
        if(p_array.exists(p_key)) then
            p_array(p_key) := p_array(p_key) + 1;
        else
            p_array(p_key) := 1;
        end if;
    end inc_value;
    
    procedure update_approximation (p_approx in out approximation, p_value cars.model_id%type) as
    begin
        if(p_approx.mini > p_value) then
            p_approx.mini := p_value;
        end if;
        if(p_approx.maxi < p_value) then
            p_approx.maxi := p_value;
        end if;
    end update_approximation;
    
    function get_key_with_max_value(p_array in preferences) return number as
        v_key_max_value NUMBER := 0;
        v_current_max NUMBER := 0;
    begin
        for i in p_array.first .. p_array.last loop
            if (p_array.exists(i) and v_current_max < p_array(i)) then
                v_current_max := p_array(i);
                v_key_max_value := i;
            end if;
        end loop;
        
        return v_key_max_value;
    end get_key_with_max_value;

    procedure suggestion_algorithm(p_user_id users.id%type) as
        v_car cars%ROWTYPE;
        v_models preferences;
        v_fuel preferences;
        v_color preferences;
        v_body preferences;
        v_price_interval approximation;
        v_mileage_interval approximation;
        v_engine_capacity_interval approximation;
        v_year_interval approximation;
        v_task_complete NUMBER;
        v_empty NUMBER := 1;
    begin
        for v_line in (select * from history where user_id = p_user_id) loop
            v_empty := 0;
            select * into v_car from cars where id = v_line.car_id;
            inc_value(v_models, v_car.model_id);
            inc_value(v_fuel, v_car.fuel_type);
            inc_value(v_color, v_car.color);
            inc_value(v_body, v_car.body_type_id);
            update_approximation(v_price_interval, v_car.price);
            update_approximation(v_mileage_interval, v_car.mileage);
            update_approximation(v_engine_capacity_interval, v_car.engine_capacity);
            update_approximation(v_year_interval, v_car.release_year);
        end loop;
        
        if(v_empty = 0) then
        /*    update preferences set
                model_id = get_key_with_max_value(v_models),
                fuel_type = get_key_with_max_value(v_fuel),
                body_type = get_key_with_max_value(v_body),
                min_price = v_price_interval.mini,
                max_price = v_price_interval.maxi,
                engine_capacity_min = v_engine_capacity_interval.mini,
                engine_capacity_max = v_engine_capacity_interval.maxi,
                min_year = v_year_interval.mini,
                max_year = v_year_interval.maxi,
                max_milage = v_mileage_interval.maxi,
                min_milage = v_mileage_interval.mini,
                color = get_key_with_max_value(v_color)
            where user_id = p_user_id;
            v_task_complete := sql%rowcount;
          */  
            if (v_task_complete = 0) then
                insert into preferences values(
                    p_user_id,
                    get_key_with_max_value(v_models),
                    get_key_with_max_value(v_fuel),
                    get_key_with_max_value(v_body),
                    v_price_interval.mini,
                    v_price_interval.maxi,
                    v_engine_capacity_interval.mini,
                    v_engine_capacity_interval.maxi,
                    v_year_interval.mini,
                    v_year_interval.maxi,
                    v_mileage_interval.maxi,
                    v_mileage_interval.mini,
                    get_key_with_max_value(v_color)
                );
            end if;
        end if;
        
    end suggestion_algorithm;

end suggestion;