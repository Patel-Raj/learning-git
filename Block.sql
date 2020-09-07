set serveroutput on;
--create or replace procedure r_temp_proc
--is
--begin
--    dbms_output.put_line('r_temp_proc');
--end;
declare
    l_temp_number number := 10;
    l_temp_string varchar2(2); 
    l_grade char(1);
    l_i number;
    l_person_number per_all_people_f.person_number%type;
    r_dir_card pay_dir_cards_f%ROWTYPE;
    type r_card_t is record
    (
        l_dir_card_id pay_dir_cards_f.dir_Card_id%type,
        l_creation_date pay_dir_cards_f.creation_date%type 
    );
    r_card r_card_t;
    
    cursor c_dir_cards is 
    select * from pay_dir_cards_f
    where dir_card_id in(
    100010032874506,
    100010032876106);
    
    CURSOR c_dir_cards_p(l_dir_card_id pay_dir_cards_f.dir_Card_id%type := 1)
    is
    select * from pay_dir_cards_f where dir_card_id = l_dir_card_id;
    
    type t_arr is table of number;
    natural_numbers t_arr := t_arr();
    counter number := 0;
    
    -- procedure
    procedure printIt(temp_str in varchar2 default 'ABCD')
    is
    begin
        dbms_output.put_line(temp_str);
    end printIt;
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
        null;
        --dbms_output.put_line('foe loop i : ' || i);
    end loop;
    
    -- While loop and continue
    l_i := 1;
    while l_i <= 5
    loop
        l_i := l_i+1;
        continue when l_i = 3;
        --dbms_output.put_line('while loop i : ' || l_i);
    end loop;
    
-- Exception handling:
--    select person_number into l_person_number
--    from per_All_people_F
--    where person_id = -1;
    -- Records
    select * into r_dir_card from pay_dir_cards_f where dir_card_id = 100010027300361;
    
    --dbms_output.put_line('r_dir_card.dir_card_id : ' || r_dir_card.dir_card_id);
    -- Type based cursor
    select dir_Card_id, creation_Date into r_card from pay_dir_cards_f where dir_card_id = 100010027300361;
    --dbms_output.put_line('r_dir_card.dir_card_id : ' || r_dir_card.dir_card_id);
    
    -- Cursor
    open c_dir_cards;
    
    loop
        fetch c_dir_cards into r_dir_card;
        exit when c_dir_cards%notfound;
        --dbms_output.put_line('r_dir_card.dir_card_id : ' || r_dir_card.dir_card_id);
        
    end loop;
    close c_dir_cards;
    
    open c_dir_cards_p(100010032874506);
    loop
        fetch c_dir_cards_p into r_dir_card;
        exit when c_dir_cards_p%notfound;
        --dbms_output.put_line('r_dir_card.dir_card_id : ' || r_dir_card.dir_card_id);
    end loop;
    close c_dir_cards_p;
    
    for rec in c_dir_cards_p(100010032874506)
    loop
        null;
        --dbms_output.put_line('rec.dir_card_id : ' || rec.dir_card_id);
    end loop;
    dbms_output.put_line(natural_numbers.count);
    for rec in c_dir_cards
    loop
        counter := counter +1;
        natural_numbers.extend;
        natural_numbers(counter) := rec.dir_card_id;
    end loop;
    dbms_output.put_line(natural_numbers.count);
    
    printIt('PQRS');
exception
    when zero_divide then
        dbms_output.put_line('abcd');
end;
 