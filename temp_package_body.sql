create or replace package body temp_package
as
    function doubleIt(temp number default 1)
    return number
    is
    procedure printHi is
    begin
        dbms_output.put_line('Hi');
    end;

    begin
        printHi;
        return temp*2;
    end doubleIt;
end temp_package;