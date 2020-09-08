create or replace package temp_package
as
    counter number := 0;
    function doubleIt(temp number default 1) return number;
end temp_package;