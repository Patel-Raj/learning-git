create or replace package body temp_package
as
    function doubleIt(temp number default 1)
    return number
    is
    begin
        return temp*2;
    end doubleIt;
end temp_package;