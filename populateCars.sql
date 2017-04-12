set serveroutput on
declare
type names is varray(1000) of varchar(20);

  nrRand NUMBER;
  prodyear Number;
  price Number;
  mileage  Number;
  userID NUMBER;
  ind number;
  engine number;
  carmodel number;
  forename names;
  surname names;

begin
  ind :=1;
   forename :=names('Aaren', 'Abbey', 'Abigael', 'Adah', 'Addi', 'Adela', 'Adelice', 'Adelle', 'Adina', 'Adrea', 'Adriane', 'Aeriel', 'Agace', 'Aggie', 'Agnese', 'Aida', 'Ailee', 'Ailina', 'Aimee', 'Ainslie', 'Alanah', 'Albertina', 'Aleece', 'Alene', 'Alexa', 'Alexina', 'Alfreda', 'Alice', 'Alie', 'Alis', 'Alisun', 'Allegra', 'Allina', 'Allsun', 'Allys', 'Almeta', 'Aloysia', 'Alvina', 'Alys', 'Alyss', 'Amalee', 'Amalle', 'Amara', 'Ambur', 'Ameline', 'Amil', 'Amye', 'Anabelle', 'Anastasia', 'Andeee', 'Andrea', 'Andriana', 'Anet', 'Angel', 'Angelika', 'Angelle', 'Anica', 'Anjela', 'Anna-Diane', 'Annabell', 'Annalee', 'Anne', 'Annelise', 'Annice', 'Annmarie', 'Ansley', 'Anthiathia', 'Antonie', 'April', 'Arabele', 'Ardeen', 'Arden', 'Ardisj', 'Ardyth', 'Ariel', 'Arlee', 'Arleta', 'Arlina', 'Arlyn', 'Ashien', 'Ashleigh', 'Ashly', 'Atalanta', 'Auberta', 'Aubrie', 'Audre', 'Audy', 'Aundrea', 'Aurelia', 'Aurlie', 'Austina', 'Averyl', 'Avril', 'Babb', 'Babs', 'Barbabra', 'Barbee', 'Barbra', 'Basia', 'Beatrisa', 'Becka', 'Beilul', 'Belicia', 'Bellanca', 'Bendite', 'Benita', 'Berenice', 'Bernadette', 'Bernelle', 'Bernice', 'Berrie', 'Bertha', 'Bertine', 'Bessie', 'Bethena', 'Bette', 'Bettina', 'Bev', 'Beverly', 'Bibby', 'Bidget', 'Billy', 'Bird', 'Blaire', 'Blanch', 'Blinny', 'Blondelle', 'Bobbee', 'Bobbye', 'Bonita', 'Bonny', 'Brandi', 'Breanne', 'Brena', 'Bria', 'Bridget', 'Brigid', 'Brina', 'Brit', 'Britta', 'Britte', 'Brook', 'Bryana', 'Brynne', 'Cacilia', 'Caitrin', 'Calli', 'Cam', 'Cami', 'Cammi', 'Candice', 'Candra', 'Caren', 'Carey', 'Carilyn', 'Carissa', 'Carleen', 'Carlin', 'Carlotta', 'Carlynne', 'Carmelina', 'Carmencita', 'Caro', 'Carolann', 'Caroline', 'Caron', 'Carroll', 'Casandra', 'Cassandra', 'Cassi', 'Cate', 'Cathe', 'Cathi', 'Cathrine', 'Catie', 'Catrina', 'Cecelia', 'Cecilla', 'Celesta', 'Celestyn', 'Celinda', 'Celle', 'Chandra', 'Charin', 'Charity', 'Charlene', 'Charmain', 'Charmion', 'Chelsea', 'Chere', 'Cherida', 'Cherise', 'Cherry', 'Chiarra', 'Chlo', 'Chrissie', 'Christal', 'Christen', 'Christie', 'Christye', 'Chryste', 'Cilka', 'Cindi', 'Cissiee', 'Clarabelle', 'Clarette', 'Clarie', 'Clarita', 'Claudette', 'Clea', 'Clementine', 'Clerissa', 'Clotilda', 'Cody', 'Colleen', 'Colline', 'Concordia', 'Constance', 'Constantina', 'Cora', 'Coralie', 'Cordey', 'Coreen', 'Corette', 'Corina', 'Corissa', 'Cornelle', 'Corri', 'Corrinne', 'Cosette', 'Crin', 'Cristabel', 'Cristin', 'Crysta', 'Cybil', 'Cyndia', 'Cynthie', 'Dacy', 'Dagmar', 'Daisie', 'Dalila', 'Damita', 'Dani', 'Daniele', 'Danit', 'Danny', 'Daphene', 'Darbie', 'Darcie', 'Darelle', 'Darleen', 'Darrelle', 'Daryl', 'Dasya', 'Davida', 'Dawna', 'Deana', 'Debbi', 'Debi', 'Dede', 'Deeann', 'Deeyn', 'Del', 'Delila', 'Delly', 'Delphine', 'Demetris', 'Denna', 'Denys', 'Desiree', 'Devin', 'Devonna', 'Dian', 'Dianemarie', 'Didi', 'Dinah', 'Dionis', 'Dniren', 'Doe', 'Dolly', 'Dominga', 'Donella', 'Donielle', 'Donny', 'Doralynn', 'Dorella', 'Dorette', 'Dorice', 'Dorise', 'Dorotea', 'Dorree', 'Dorthea', 'Doti', 'Dreddy', 'Drucie', 'Drusilla', 'Dulcia', 'Dulcy', 'Dyane', 'Dynah', 'Ealasaid', 'Ebonee', 'Eddy', 'Edi', 'Editha', 'Edy', 'Eilis', 'Elaine', 'Elbertina', 'Electra', 'Elenore', 'Elfrida', 'Elicia', 'Elisabet', 'Elissa', 'Elka', 'Ellen', 'Ellissa', 'Elna', 'Elonore', 'Elset', 'Elspeth', 'Elvira', 'Elysha', 'Emalee', 'Emeline', 'Emili', 'Emlyn', 'Emmaline', 'Emmey', 'Emogene', 'Enrica', 'Eolande', 'Ericha', 'Erinn', 'Ermina', 'Ernesta', 'Esmaria', 'Essy', 'Estella', 'Estrellita', 'Etheline', 'Ettie', 'Eugine', 'Eustacia', 'Evangelina', 'Eveleen', 'Evie', 'Evy', 'Faina', 'Fanchon', 'Fanni', 'Farah', 'Farrand', 'Fawn', 'Faye', 'Faythe', 'Felice', 'Felisha', 'Ferdinanda', 'Fernandina', 'Fidela', 'Filia', 'Fionna', 'Flo', 'Florella', 'Florette', 'Florina', 'Florry', 'Flss', 'Francine', 'Frank', 'Franny', 'Freddie', 'Frederique', 'Freida', 'Gabbi', 'Gabriel', 'Gabriellia', 'Gail', 'Garnette', 'Gaye', 'Gaylene', 'Geneva', 'Genni', 'Genvieve', 'Georgeta', 'Georgianna', 'Geralda', 'Gerianna', 'Germana', 'Gert', 'Gertruda', 'Giana', 'Gilberte', 'Gill', 'Gilligan', 'Ginger', 'Giorgia', 'Gisele', 'Giulietta', 'Gladys', 'Glenn', 'Gloria', 'Glynda', 'Golda', 'Goldina', 'Grata', 'Grazia', 'Grete', 'Grier', 'Guenna', 'Guinevere', 'Gussi', 'Gustie', 'Gwendolyn', 'Gwennie', 'Gwyneth', 'Haily', 'Halie', 'Hally', 'Hannie', 'Harley', 'Harmony', 'Harrietta', 'Hattie', 'Heather', 'Hedi', 'Hedy', 'Helaine', 'Helenka', 'Helsa', 'Henrieta', 'Hermia', 'Herta', 'Hetti', 'Hildagard', 'Hildy', 'Hollie', 'Honor', 'Hortensia', 'Hyacinthia', 'Ibby', 'Idell', 'Ilene', 'Ilse', 'Imogen', 'Ines', 'Ingaberg', 'Inger', 'Iolanthe', 'Irene', 'Isa', 'Isadora', 'Isobel', 'Ivette', 'Izabel', 'Jacinthe', 'Jacklyn', 'Jaclyn', 'Jacquenetta', 'Jacquie', 'Jaimie', 'Jammie', 'Jandy', 'Janel', 'Janenna', 'Janette', 'Janie', 'Janith', 'Janot', 'Jaquenette', 'Jayme', 'Jean', 'Jeanie', 'Jeannie', 'Jemima', 'Jena', 'Jeniece', 'Jenn', 'Jennica', 'Jenny', 'Jerrie', 'Jerrylee', 'Jessamine', 'Jessica', 'Jewell', 'Jillayne', 'Jillie', 'Jo-Ann', 'Joanie', 'Jobey', 'Jobye', 'Jocelyne', 'Joeann', 'Joelle', 'Joete', 'Johnath', 'Jolee', 'Jolie', 'Jonell');
   surname :=names('Aaron', 'Abbie', 'Abdul', 'Abey', 'Abram', 'Adam', 'Addison', 'Adlai', 'Adolphe', 'Adrien', 'Agustin', 'Akim', 'Alan', 'Alaric', 'Alberik', 'Alden', 'Aldous', 'Aldwin', 'Alessandro', 'Alexandro', 'Alf', 'Alford', 'Ali', 'Alister', 'Allen', 'Allister', 'Alonso', 'Alphonso', 'Alvan', 'Alwin', 'Ambrose', 'Amerigo', 'Anatole', 'Andie', 'Andreas', 'Andris', 'Angel', 'Angus', 'Anthony', 'Antoni', 'Antons', 'Arch', 'Archibaldo', 'Ari', 'Aristotle', 'Arman', 'Arnaldo', 'Arnold', 'Arri', 'Artemas', 'Artie', 'Arv', 'Ase', 'Ashley', 'Aubert', 'Augustine', 'Austen', 'Averill', 'Avrom', 'Aylmer', 'Baillie', 'Baldwin', 'Banky', 'Barde', 'Barnard', 'Barny', 'Barri', 'Bart', 'Bartholomeo', 'Bartlett', 'Barty', 'Basile', 'Bat', 'Baxter', 'Bealle', 'Beauregard', 'Bendicty', 'Benedicto', 'Benjamen', 'Benn', 'Benson', 'Benyamin', 'Berkie', 'Bernard', 'Bernie', 'Berton', 'Bev', 'Bill', 'Binky', 'Blaine', 'Bo', 'Bogey', 'Bondy', 'Boony', 'Bord', 'Boris', 'Boycey', 'Brade', 'Bradney', 'Branden', 'Brandyn', 'Brendan', 'Brennan', 'Brew', 'Briant', 'Briggs', 'Brnaba', 'Brod', 'Brodie', 'Bronny', 'Brose', 'Bryan', 'Bryon', 'Budd', 'Burg', 'Burlie', 'Burtie', 'Byran', 'Cad', 'Cale', 'Calvin', 'Car', 'Carleton', 'Carlos', 'Carny', 'Carson', 'Caryl', 'Caspar', 'Caz', 'Cecilio', 'Cesar', 'Chaddie', 'Chan', 'Chariot', 'Chas', 'Chen', 'Chev', 'Chickie', 'Chris', 'Christiano', 'Christoph', 'Christy', 'Cirillo', 'Clair', 'Clark', 'Claudio', 'Clayborne', 'Clem', 'Clemmie', 'Cletus', 'Cliff', 'Cly', 'Cobb', 'Cody', 'Cole', 'Colman', 'Conn', 'Conrad', 'Constantin', 'Cooper', 'Corby', 'Corey', 'Corney', 'Cort', 'Cosimo', 'Courtnay', 'Craig', 'Crichton', 'Crosby', 'Culley', 'Curcio', 'Curry', 'Cyril', 'DArcy', 'Dale', 'Dallis', 'Dame', 'Dan', 'Daniel', 'Danya', 'Darcy', 'Dario', 'Daron', 'Darrin', 'Dav', 'Davidde', 'Davis', 'Deane', 'Delaney', 'Delmer', 'Demetris', 'Denis', 'Dennison', 'Derby', 'Derrek', 'Derry', 'Desmond', 'Devlen', 'Dewey', 'Diarmid', 'Dieter', 'Dillon', 'Dion', 'Dolf', 'Domingo', 'Don', 'Donavon', 'Donovan', 'Dory', 'Dougy', 'Drew', 'Dud', 'Dugald', 'Dun', 'Dur', 'Dwain', 'Eal', 'Early', 'Ebenezer', 'Edd', 'Edgardo', 'Edouard', 'Edvard', 'Egan', 'Elbert', 'Eldridge', 'Elijah', 'Ellery', 'Ellsworth', 'Elnar', 'Elvin', 'Elwyn', 'Emelen', 'Emlen', 'Emmet', 'Emory', 'Enos', 'Ephrem', 'Erhart', 'Erik', 'Ernest', 'Erny', 'Erv', 'Esra', 'Ethe', 'Euell', 'Eustace', 'Even', 'Evyn', 'Ewen', 'Ezra', 'Fabiano', 'Fairleigh', 'Farlay', 'Farly', 'Faulkner', 'Felice', 'Felix', 'Ferdinand', 'Ferrel', 'Fidole', 'Filberte', 'Filmore', 'Finley', 'Fleming', 'Flinn', 'Flynn', 'Forbes', 'Forrester', 'Fran', 'Franciskus', 'Frankie', 'Franny', 'Franzen', 'Fraze', 'Freddy', 'Frederico', 'Free', 'Fremont', 'Gabbie', 'Gabriel', 'Gaelan', 'Gale', 'Galven', 'Gannon', 'Gardener', 'Gare', 'Garik', 'Garret', 'Garrot', 'Garvey', 'Gary', 'Gaston', 'Gaven', 'Gayelord', 'Gearalt', 'Geoffrey', 'George', 'Gerald', 'Gerhardt', 'Germaine', 'Gerrie', 'Giacomo', 'Gib', 'Giff', 'Giffy', 'Giles', 'Giordano', 'Giraud', 'Giusto', 'Glyn', 'Goddart', 'Gonzales', 'Gordan', 'Gothart', 'Grady', 'Gram', 'Granny', 'Granville', 'Gregoire', 'Gregory', 'Griffith', 'Grove', 'Guilbert', 'Gunner', 'Guss', 'Gustavus', 'Had', 'Hagan', 'Hakim', 'Hall', 'Hamel', 'Hamlen', 'Hank', 'Harbert', 'Harlen', 'Harold', 'Harrison', 'Harv', 'Hashim', 'Hastings', 'Hayes', 'Hazel', 'Hector', 'Hendrick', 'Herb', 'Hercule', 'Hermann', 'Herold', 'Hershel', 'Hewet', 'Hi', 'Hill', 'Hilliard', 'Hilton', 'Hobart', 'Hogan', 'Holt', 'Horacio', 'Horten', 'Hoyt', 'Hubie', 'Hugo', 'Humfrid', 'Hunter', 'Hurleigh', 'Hy', 'Iain', 'Iggy', 'Ignaz', 'Ilaire', 'Ingelbert', 'Ingmar', 'Inness', 'Ira', 'Irwin', 'Isac', 'Isak', 'Isidro', 'Ivar', 'Izaak', 'Jackie', 'Jacques', 'Jakie', 'Jameson', 'Jamill', 'Janos', 'Jarib', 'Jarrett', 'Jasen', 'Jay', 'Jdavie', 'Jeddy', 'Jefferson', 'Jehu', 'Jerald', 'Jeremiah', 'Jermaine', 'Jerrie', 'Jess', 'Jesus', 'Jimmy', 'Jock', 'Joe', 'Johannes', 'Johnny', 'Jonathan', 'Jorgan', 'Joseph', 'Josiah', 'Jud', 'Judon', 'Julio', 'Justino', 'Kain', 'Kalil', 'Karel', 'Karlik', 'Kasper', 'Keary', 'Keenan', 'Kelby', 'Kelly', 'Kendal', 'Kenn', 'Kennie', 'Kenton', 'Kermie', 'Kerwin', 'Kevin', 'Kile', 'Killy', 'Kin', 'Kingston', 'Kipp', 'Kirby', 'Klement', 'Konrad', 'Kory', 'Krispin', 'Kristofor', 'Kurtis', 'Lalo', 'Lamont', 'Laney', 'Lanny', 'Lauren', 'Lauritz', 'Lay', 'Lazarus', 'Leif', 'Lem', 'Lenard', 'Leon', 'Leonid', 'Les', 'Lev', 'Levy', 'Lezley', 'Lincoln', 'Lindy', 'Lion', 'Lloyd', 'Lodovico', 'Lonnie', 'Lorenzo', 'Lothaire', 'Lovell', 'Loydie', 'Lucho', 'Lucio', 'Luigi', 'Luther', 'Lyman', 'Mace', 'Madison', 'Maje', 'Malcolm', 'Manfred', 'Manuel', 'Marcellus', 'Marcus', 'Mark', 'Marlon', 'Marshal', 'Martie', 'Marv', 'Mason', 'Mathe', 'Matt', 'Matthias', 'Mattie', 'Maurise', 'Maxie', 'Maximo', 'Mayne', 'Meier', 'Menard', 'Meredith', 'Merrick', 'Merwin');

   loop
    nrRand := TRUNC(DBMS_RANDOM.VALUE(1,500));
 /*  prodyear := TRUNC(DBMS_RANDOM.VALUE(1900,2017));   */
 price := TRUNC(DBMS_RANDOM.VALUE(1,500000));
  userID := TRUNC(DBMS_RANDOM.VALUE(1,10001));
  carmodel := TRUNC(DBMS_RANDOM.VALUE(1185, 4612));
  engine := TRUNC(DBMS_RANDOM.VALUE(100,6000));
  mileage := TRUNC(DBMS_RANDOM.VALUE(1,1000000));
  insert into cars (id, title, price, model , mileage ,engine_capacity,user_id) values (ind , surname(nrRand) , price ,carmodel , mileage ,engine,userID);
   ind:=ind+1;
   exit when ind = 11000;
   end loop;

end;
