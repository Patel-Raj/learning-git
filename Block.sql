set serveroutput on;
declare
    l_temp_number number := 10;
    l_temp_string varchar2(2); 
    l_grade char(1);
    l_i number;
begin
    --l_temp_string := 'abc';
    if true then
        dbms_output.put_line('if');
    else 
        dbms_output.put_line('else');
    end if;
    --l_temp_number := l_temp_number/0;
    -- Case stmts
    l_grade := 'D';
    case l_grade
    when 'A' then
        dbms_output.put_line('Excellent');
    when 'B' then
        dbms_output.put_line('Very good');
    when 'C' then
        dbms_output.put_line('Good');
    else 
        dbms_output.put_line('Poor');
    end case;
    
    -- Searched case stmt
    case 
    when l_temp_number > 10 then
        dbms_output.put_line('Greater then 10');
    when l_temp_number = 10 then
        dbms_output.put_line('Equal 10');
    else
        dbms_output.put_line('Less then 10');
    end case;
    
    -- basic loop
    l_i := 0;
    <<outloop>> loop
        --dbms_output.put_line('i : ' || l_i);
        l_i := l_i +1;
        exit outloop when l_i > 10;
    end loop outloop;
    
    -- For loop
    for i in 1..5
    loop
        dbms_output.put_line('foe loop i : ' || i);
    end loop;
    
exception
    when zero_divide then
        dbms_output.put_line('abcd');
end;
 