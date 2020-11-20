set time zone 'UTC';
create extension pgcrypto;

CREATE TABLE branches (
    id serial PRIMARY KEY,
    name VARCHAR (255) NOT NULL,
    street VARCHAR (255) NOT NULL,
    city VARCHAR (255) NOT NULL,
    zip VARCHAR (255) NOT NULL
);

INSERT INTO branches (name, street, city, zip) VALUES ('East Schulist', '5231 Port Corners land','East Schulist','28210');
INSERT INTO branches (name, street, city, zip) VALUES ('New Ankunding', '2032 Locks stad','New Ankunding','45206');
INSERT INTO branches (name, street, city, zip) VALUES ('Dallasside', '87386 North Ways port','Dallasside','92191');
INSERT INTO branches (name, street, city, zip) VALUES ('Danielton', '66469 South Square view','Danielton','68107');
INSERT INTO branches (name, street, city, zip) VALUES ('Gulgowskiburgh', '6162 Rapid stad','Gulgowskiburgh','89964');
INSERT INTO branches (name, street, city, zip) VALUES ('Port Berge', '39751 New Alley ville','Port Berge','75432');
INSERT INTO branches (name, street, city, zip) VALUES ('Bartonview', '84354 Extensions ville','Bartonview','62283');

CREATE TABLE users (
    id serial PRIMARY KEY,
    name VARCHAR (255) NOT NULL,
    email VARCHAR (255) NOT NULL,
    street VARCHAR (255) NOT NULL,
    city VARCHAR (255) NOT NULL,
    zip VARCHAR (255) NOT NULL,
    creditcard VARCHAR(255) NOT NULL,
    ccv VARCHAR(255) NOT NULL
    exp VARCHAR(255) NOT NULL
);

INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Margot Langosh', 'carolannearmstrong@hettinger.org', '5231 Port Corners land','East Schulist','28210','6062826300643616', '749', '02/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Santiago Lebsack', 'mertiekoelpin@parker.com', '2032 Locks stad','New Ankunding','45206','2715172735355959', '291', '02/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Darius Nitzsche', 'harmonyjaskolski@moore.io', '87386 North Ways port','Dallasside','92191','5089997969849900', '204', '12/30');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Gerard Orn', 'gerardoparker@daniel.biz', '66469 South Square view','Danielton','68107','62182095795323989', '881', '03/30');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Cecelia Ankunding', 'presleywalsh@volkman.com', '6162 Rapid stad','Gulgowskiburgh','89964','6370955591315688', '481', '10/30');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Maxine Vandervort', 'queenhodkiewicz@gorczany.io', '39751 New Alley ville','Port Berge','75432','6229257938957032279', '287', '04/27');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Vernice Wolff', 'lunametz@hagenes.info', '84354 Extensions ville','Bartonview','62283','3868432924876230091', '128', '09/21');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Milo Runte', 'borislarkin@lynch.net', '259 New Tunnel land','Schroederburgh','36025','6218247454279938', '218', '03/27');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Bud Konopelski', 'stanfordcasper@bartoletti.io', '1952 New Avenue borough','Brandonton','76982','4936980293279', '821', '07/21');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Mariam Schaefer', 'lincolnhand@kerluke.name', '1743 Cove ville','Tristinville','22810','50899951631335935', '878', '08/29');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Leola Cummings', 'madelinelockman@moen.info', '2431 Overpass shire','West Kuvalis','17925','6499484270754303', '110', '02/26');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Shaylee Veum', 'lazaroauer@morar.org', '2100 Summit fort','North Kuphal','54517','50000015470338', '982', '03/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Kyler Ortiz', 'hildegardgreenholt@kunze.biz', '201 New Path burgh','Braunburgh','78324','3643610029585216281', '819', '10/24');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Boris Carter', 'judahsipes@kerluke.biz', '6994 Fords fort','Rosalindtown','23119','2720657099340087', '227', '09/25');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Giovanny Daniel', 'eastonblock@breitenberg.biz', '61243 East Plaza burgh','Cristopherfurt','61184','62823322417247', '954', '02/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Eda Tillman', 'micahbrown@koepp.org', '26239 West Falls mouth','Port Lemke','46915','6444179624911681332', '280', '05/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Noah Aufderhar', 'jarrettpouros@sipes.biz', '38363 Squares mouth','Streichton','20587','622999111377630313', '385', '04/24');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Natalie Conroy', 'elsanikolaus@steuber.name', '43807 Port Station burgh','North Bednar','58536','6375997661648031', '268', '12/26');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Lester Mertz', 'nannieleffler@baumbach.info', '6870 North Shoals burgh','Isaiahton','41904','4346321442540193488', '756', '04/27');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Nikolas Pagac', 'annamaelynch@osinski.io', '8872 West Gateway ville','Bernhardberg','58795','6497709638532179', '913', '01/22');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Talon Schmitt', 'christellekessler@runolfsdottir.org', '6617 South Burgs borough','Bayerland','18047','6370959890004316', '651', '09/26');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Daren Weissnat', 'jedjohns@ebert.net', '891 Lake Forks haven','Yundthaven','34313','2341491019093173', '130', '07/25');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Vita Streich', 'alexiefadel@wehner.io', '565 Port Shoal shire','Padbergmouth','51214','5067798568303', '223', '10/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Jadon Ziemann', 'maymiejones@terry.net', '41467 Mountain shire','Judgeview','53411','36587040182481', '504', '01/27');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Abbigail Bartoletti', 'carriebernhard@conn.biz', '88098 South Squares ton','Smithammouth','85710','5530144120535723', '203', '07/27');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Kaylin Armstrong', 'uriahferry@gutmann.com', '865 Walk furt','Schadenshire','65850','2709108064732176', '219', '07/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Maverick Larson', 'jessycakautzer@lehner.name', '90244 Streets view','Huelport','12156','2619282567329118', '177', '12/25');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Providenci Hane', 'queeniejenkins@bartell.name', '13465 North Skyway port','Ullrichmouth','97266','677597820001409', '688', '05/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Stevie Rosenbaum', 'meggieschneider@ankunding.net', '873 Lake Plain view','Idellmouth','95886','6497249647581693', '488', '09/29');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Hertha Hintz', 'shaniyarodriguez@schaden.info', '9244 New Plain shire','Tianashire','90425','2131076611017268', '247', '09/30');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Gaylord Wolff', 'toneywelch@aufderhar.net', '31216 Port Fords land','Lake Bins','35104','493698029824682', '483', '08/30');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Weston Waelchi', 'eusebioborer@fadel.biz', '87794 East Roads bury','East Beahan','29669','30561140071999', '620', '12/29');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Eusebio Kessler', 'adalinewilderman@franecki.net', '757 Field bury','Nadertown','88421','35896481755149692', '206', '06/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Katelyn Lynch', 'camdenhudson@marks.info', '110 West Inlet borough','Lakinside','39225','6491872117027801358', '425', '10/30');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Jailyn Kessler', 'emorylarkin@price.name', '47661 North Mountains fort','West Von','99592','2720463543170059', '635', '02/26');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Natalie Emmerich', 'jerodmarvin@gislason.info', '442 Court furt','Port Schaden','85697','6370953009514786', '439', '07/30');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Michale Moore', 'aylincormier@blick.org', '3088 West Forge ville','Antonioport','62812','6062820898844652', '566', '03/29');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Daphney Upton', 'justenmoore@hayes.org', '3738 Skyway side','West Auer','46136','2294159067268388', '919', '05/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Madilyn Koch', 'rebekahkemmer@padberg.io', '4456 West Turnpike chester','Jefferyshire','98469','6062823017438604', '440', '09/27');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Hassie Heathcote', 'alenakling@lang.biz', '3619 Neck bury','Funkborough','66785','30592086181062', '469', '07/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Lelia Rice', 'estellakertzmann@daugherty.com', '8355 Canyon ton','Koeppland','21402','6499135075859909', '430', '07/22');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Gracie Ferry', 'providencibaumbach@wilkinson.info', '564 Landing furt','Jaskolskistad','33117','2229754110498568', '672', '09/24');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Ernest Osinski', 'gerdanikolaus@bashirian.name', '7739 Crossroad shire','Pearlton','76406','3589074224077961908', '891', '01/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Kitty Wuckert', 'maeveconnelly@schneider.biz', '92101 South Mill port','Keyonbury','90847','370083753207990', '478', '05/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Sibyl Boehm', 'santinapacocha@schowalter.name', '61789 New Hill view','Welchmouth','70387','1800869229658640823', '454', '07/22');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Virgil Mertz', 'fritzgislason@dicki.io', '51302 Port Village bury','Jerroldmouth','94444','180082502210336695', '373', '11/24');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Jennifer Breitenberg', 'vernicevolkman@west.io', '725 Pike borough','Botsfordberg','16083','3055185583706541', '227', '10/27');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Stanford Collier', 'lorenzalowe@raynor.name', '36870 Skyway port','Elliotburgh','88872','6062829038765669', '614', '11/21');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Garnett Funk', 'demarcuskoch@moore.org', '213 West Spurs view','East Cruickshank','79620','3805825999916266', '124', '12/30');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Carter Fisher', 'ludwigwalker@wehner.info', '3232 South Greens town','East Fadel','13742','629220777059440', '425', '04/26');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Patsy McGlynn', 'lelandherzog@nitzsche.name', '677 Pine fort','Sanfordmouth','13949','6362974296855807', '767', '09/25');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Dulce Reichel', 'uriahswaniawski@maggio.io', '4280 West Port view','Cleveburgh','93971','3632610265584421', '312', '01/26');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Natalia Johnson', 'dollyrowe@zieme.info', '2103 South Rue fort','Ressiemouth','26834','6375680067649650', '824', '12/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Antonina Terry', 'elijahsipes@thiel.net', '61578 Plaza furt','Angelmouth','19701','6509780080575368', '175', '12/26');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Araceli Lebsack', 'lamarroberts@prosacco.io', '140 Port Mill chester','Creminside','12552','6550005738136779', '546', '12/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Jose Shields', 'elsawitting@murray.info', '3145 West Skyway chester','Annettashire','73798','62205886273150', '261', '06/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Alicia McKenzie', 'melbabartell@ratke.com', '753 Creek berg','Port Bode','45145','6506176415777217843', '460', '10/22');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Colt Davis', 'antonettejohns@willms.biz', '479 New Oval berg','Lilianeland','52917','4026252878665263302', '632', '05/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Nya Schmidt', 'calliegrady@parker.net', '342 Junctions burgh','West Weissnat','14387','4803834946833270092', '567', '05/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Ubaldo Bins', 'harrisondibbert@pfannerstill.io', '18872 North Manor land','Maiyaside','29175','4896025792543858', '640', '06/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Genevieve Toy', 'brayanabshire@spencer.name', '863 East Ports stad','Farrelltown','67497','3692193890417834894', '225', '06/24');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Eldridge Schmidt', 'ramonastrosin@leannon.com', '246 Lake haven','West Weissnat','85552','4963284274926069', '458', '12/27');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Wilfrid Stroman', 'kennyhoeger@howell.name', '50990 Shores haven','West Howell','28548','50677970454973158', '452', '11/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Lucy Leuschke', 'vidaldoyle@raynor.com', '273 Bridge berg','Funkton','13769','62769102096323832', '393', '08/25');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Monte Durgan', 'nehalowe@rogahn.net', '382 South Flats stad','Griffinchester','90310','374492526993917', '484', '01/27');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Kevin Thiel', 'brookeframi@effertz.io', '9334 East View furt','Gaylordbury','77494','6370956303523031', '772', '03/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Hugh Runte', 'liabeer@schroeder.name', '3246 Lake Curve ton','Damianview','42269','5124127031659247', '879', '09/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Douglas Toy', 'kayaschowalter@kris.biz', '316 Pines furt','New Tremblay','89716','3589052208726676948', '470', '12/21');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Magali Dach', 'brainwelch@upton.org', '579 South Keys haven','West Crooks','13823','6370957827883638', '613', '03/30');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Liana Littel', 'delphineromaguera@hilll.com', '5183 Shore haven','East Kerluke','15292','341960422472517', '839', '06/29');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Neoma Feest', 'eliezeremmerich@paucek.org', '960 Dam bury','Berniermouth','57625','4001487654866631', '996', '10/26');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Henri Beatty', 'roxannelehner@hermann.net', '11093 Junctions mouth','Tonistad','26344','4783198648960711138', '178', '11/27');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Anthony Miller', 'darwinkerluke@lehner.net', '3226 Summit town','Lake Hartmann','35278','21316401238174929', '517', '12/21');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Aracely Cummerata', 'ezrawindler@rath.io', '1159 Station chester','West Hartmann','72787','6780738366275988', '216', '11/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Loyce Howe', 'michaelkautzer@stanton.info', '2998 Point side','New Leffler','49088','6493132551957766', '143', '03/29');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Ozella Weimann', 'penelopeullrich@monahan.io', '77988 Camp side','Laneland','51784','815210560209348', '998', '04/25');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Vincenza Fay', 'omerhoppe@hammes.org', '271 Rue berg','Schustershire','13144','35899072813678942', '999', '11/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Remington Lindgren', 'jaidaklocko@harber.io', '2110 Lake Expressway shire','Port Gibson','51437','62100253109923', '734', '04/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Maxine Brown', 'mohammedhomenick@heidenreich.io', '80817 Roads berg','Watsicaport','94772','6505984238824561', '663', '12/22');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Laurence Nienow', 'reillylarson@abbott.net', '8368 Lake Green stad','New McKenzie','83078','36891815229349', '278', '09/25');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Cordelia Goodwin', 'edjohnson@little.info', '25180 Run fort','Linwoodberg','97397','344439783744266', '689', '06/26');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Johann Ruecker', 'kallierempel@shanahan.biz', '7171 Flat ville','East Mayert','16791','3945322060440963', '910', '06/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Kaelyn Strosin', 'eusebiolittle@krajcik.io', '812 North Forks land','Schillerfort','59527','8152714552075835', '816', '03/27');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Karelle Anderson', 'rubiemayert@larson.net', '24963 West Ports mouth','Vivienchester','57679','3528052578428174808', '745', '01/24');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Shannon Hudson', 'emilbogisich@jast.info', '229 New Stream town','Garrettchester','39792','35284758833605237', '925', '03/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Jillian Kautzer', 'karolannschroeder@weissnat.com', '885 Port Forest furt','Alejandrinton','16644','81107398775419229', '500', '08/29');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Elenora Johnston', 'angelinamills@shanahan.name', '611 Expressway side','Bauchfurt','65339','3528646824555117050', '328', '10/21');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Alana Hamill', 'meaghanfritsch@block.biz', '8761 Stravenue bury','McClurefort','85467','49369886414574', '439', '08/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Krystina Rath', 'augusthickle@spinka.name', '644 East Shoal haven','Danberg','39826','2131544452245918', '573', '03/21');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Jerad Jacobs', 'eulahmoore@langworth.org', '717 East Mount shire','Arloside','20116','452969915995156859', '774', '09/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Elton Witting', 'dayanaabbott@cormier.io', '657 Port Squares mouth','Tremblayshire','41099','5000006233629092', '137', '10/29');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Jerome Gibson', 'bradyborer@hammes.io', '96200 New Squares furt','East Smitham','14410','5090006129477789', '515', '09/24');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Sid Kris', 'fernejacobs@gutmann.info', '65924 Mount fort','Ernestobury','41154','375901718137777', '714', '04/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Cordelia Dare', 'belldare@rutherford.io', '183 Crest berg','North Gusikowski','39031','2720800721621769', '908', '08/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Greta Kessler', 'alvenawyman@konopelski.name', '35852 East Trace stad','Corwinfurt','59458','2720753323946268', '184', '03/26');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Jamie Stroman', 'niaveum@damore.net', '787 Parkway stad','Kleinton','35540','6750671787319', '236', '08/26');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Brannon Von', 'reymundolowe@bednar.net', '494 North Trail mouth','Satterfieldmouth','26006','5107912423654471', '186', '03/28');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Eleonore Kutch', 'salvadordonnelly@effertz.biz', '64195 Port Walks shire','Port Hamill','39862','424191972544656177', '912', '04/23');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Kim Turcotte', 'elyssawalker@welch.io', '404 Lodge borough','Port Stark','36733','622078093092767139', '118', '06/25');
INSERT INTO users (name, email, street, city, zip, creditcard, ccv, exp) VALUES ('Annabell Balistreri', 'jonathanebert@bartoletti.com', '667 Loaf stad','Willyview','94608','4971697380185884', '685', '06/27');