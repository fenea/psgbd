set serveroutput on;
declare
    type name is varray(100) of varchar2(255);
    v_first_name name; --prenume
    v_second_name name; --nume
    v_username varchar2(255);
    v_email varchar2(255);
    v_phone varchar2(11);
    v_number number(9) := 740000000;
    v_id NUMBER(9, 0) := 1;
begin
    v_first_name := name('Alexandra', 'Mihaela', 'Valentin', 'Andreea', 'Alexandru', 'Cosmin', 'Eduard', 'Camelia', 'Adina', 'Ema', 'Victor',
                         'Paula', 'Marius', 'Catalin', 'Dan', 'Ana', 'Cristian', 'Denise', 'Niculita', 'Andrei', 'Nicolae', 'Anca', 'Vladimir',
                         'Codrin', 'Ioan', 'Silviu', 'Tudor', 'Diana', 'Simina', 'Florian', 'Andra', 'Madalina', 'George', 'Ioana', 'Razvan',
                         'Radu', 'Giani', 'Mircea', 'Stefan', 'Petruta', 'Richard', 'Dorin', 'Iaroslav', 'Emma', 'Emil', 'Vlad', 'Iustin', 'Petru',
                         'Eusebiu', 'Iolanda', 'Dimitrie', 'Vasile', 'Iulian', 'Stolniceanu', 'Monica', 'Elena', 'Ionut', 'Ileana', 'Roland', 'Bianca',
                         'Georgiana', 'Adrian', 'Raluca', 'Elvis', 'Bogdan', 'Gabriel', 'Mihai', 'Constantin', 'Stefana', 'Ilie', 'Romanescu', 'Dumitru',
                         'Robert', 'Sebastian', 'Dragos', 'Alex', 'Ionel', 'Daniel', 'Munteanu', 'Sergiu', 'Paul', 'Nicu', 'Vadim', 'Oana', 'Loredana',
                         'Irinel', 'Xena', 'Octavian', 'Iulia', 'Samuel', 'Ilona', 'Rares', 'Laurentiu', 'Larisa', 'Timofte', 'Teodor', 'Matei', 'Damian',
                         'Andreia', 'Camil');
    v_second_name := name('Citea', 'Lazar', 'Damoc', 'Ghergu', 'Vlad', 'Chiriac', 'Tuduri', 'Macariu', 'Ababei', 'Balica', 'Boca', 'Miron', 'Carp', 'Danila',
                          'Crainiceanu', 'Hutanu', 'Chistol', 'Ionesi', 'Goldan', 'Ciucanu', 'Vrabie', 'Chitic', 'Dimache', 'Filibiu', 'Dochitei', 'Rosca',
                          'Corodescu', 'Ventaniuc', 'Harpa', 'Robu', 'Munteanu', 'Alexandru', 'Patras', 'Motrescu', 'Andrian', 'Covatariu', 'Corduneanu',
                          'Botezatu', 'Huma', 'Pascaru', 'Rusu', 'Moscu', 'Lupu', 'Cimpoesu', 'Popa', 'Iacob', 'Tesu', 'Craciunas', 'Ciornei', 'Netedu',
                          'Samson', 'Platon', 'Maties', 'Mihailescu', 'Edu', 'Manole', 'Mazur', 'Sleghel', 'Andros', 'Asofiei', 'Cretu', 'Iacobuta', 'Stan',
                          'Agape', 'Aioanei', 'Suhani', 'Stoica', 'Arteni', 'Bizu', 'Huzum', 'Giurgila', 'Iftimesei', 'Luca', 'Mihalcea', 'Burloiu', 'Neghina',
                          'Stefan', 'Chmilevski', 'Anghelina', 'Arhire', 'Iordache-Tiroiu', 'Dascalu', 'Nechita', 'Dorneanu', 'Gherman', 'Gherase', 'Mazareanu',
                          'Ghibirdic', 'Tincu', 'Matei', 'Dudau', 'Calinescu', 'Pojar', 'Timofte', 'Maganu', 'Vinatoru', 'Olariu', 'Duceac', 'Trifan', 'Scortanu');

    for i in v_first_name.first .. v_first_name.last loop
        for j in v_second_name.first .. v_second_name.last loop
            v_username := lower(v_first_name(i)) || '.' || lower(v_second_name(j));
            v_email := v_username || '@gmail.com';
            v_phone := '0' || v_number;
            insert into Users values(v_id, v_first_name(i), v_second_name(j), v_username, v_email,v_username, v_phone);
            v_number := v_number + 1;
            v_id := v_id + 1;
        end loop;
    end loop;
end;
