set serveroutput on;
declare
    l_temp_number number := 10;
    l_temp_string varchar2(2); 
begin
    --l_temp_string := 'abc';
    if true then
     dbms_output.put_line('if');
    else 
         dbms_output.put_line('else');
    end if;
    --l_temp_number := l_temp_number/0;
    --select * from fnd_lookup_values where lookup_type = 'HRX_US_FEDERAL_FILING_STATUS';
exception
    when zero_divide then
        dbms_output.put_line('abcd');
end;
 