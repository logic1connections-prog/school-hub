-- ==========================================
-- SCHOOL HUB: FULL CONTENT SEED (VTI METAL)
-- ==========================================

-- Clear existing questions and quizzes for a clean slate
delete from questions;
delete from quizzes;

-- ==========================================
-- 1. CATEGORY: VEILIGHEID
-- ==========================================
insert into quizzes (id, title, description, category, level, question_count) values
(10, 'Veiligheid Level 1: Basics', 'Basiskennis PBM en signalisatie.', 'Veiligheid', 1, 5),
(11, 'Veiligheid Level 2: Gevaren', 'Gevaren in de werkplaats.', 'Veiligheid', 2, 5),
(12, 'Veiligheid Level 3: Brand & EHBO', 'Wat te doen bij incidenten?', 'Veiligheid', 3, 5),
(13, 'Veiligheid Level 4: Expert', 'Complexe veiligheidssituaties.', 'Veiligheid', 4, 5);

-- Questions for Veiligheid Level 1 (ID 10)
insert into questions (quiz_id, question, options, correct_index) values
(10, 'Wat betekent een blauw rond bord met een wit symbool?', ARRAY['Verbod', 'Gebod (verplichting)', 'Waarschuwing', 'Informatie'], 1),
(10, 'Welke PBM is verplicht bij lawaai boven 80dB?', ARRAY['Veiligheidsbril', 'Gehoorbescherming', 'Slijpmasker', 'Laskap'], 1),
(10, 'Wat is de betekenis van een geel driehoekig bord?', ARRAY['Veiligheid', 'Verbod', 'Waarschuwing voor gevaar', 'Eerste hulp'], 2),
(10, 'Wat doe je bij een onveilige situatie?', ARRAY['Negeren', 'Zelf repareren', 'Melden bij de leerkracht', 'Wachten op het einde van de les'], 2),
(10, 'Waarvoor dient een veiligheidsbril?', ARRAY['Tegen fel licht', 'Tegen stof en rondvliegende deeltjes', 'Om beter te zien', 'Tegen warmte'], 1);

-- Questions for Veiligheid Level 2: Gevaren (ID 11)
insert into questions (quiz_id, question, options, correct_index) values
(11, 'Welk gevaar vormt een loszittende mouw bij een draaiende machine?', ARRAY['Vervuiling van het werkstuk', 'Grijpgevaar (meesleuren)', 'Verschroeien', 'Geen gevaar'], 1),
(11, 'Wat is een groot risico bij het gebruik van perslucht?', ARRAY['Koude lucht op de huid', 'Inbrengen van lucht in de bloedbaan (bij diepe wonden)', 'Lawaai', 'Stofontwikkeling'], 1),
(11, 'Waarom is orde en netheid belangrijk voor veiligheid?', ARRAY['Omdat de leerkracht dat wil', 'Om struikelgevaar te voorkomen', 'Om meer ruimte te hebben', 'Om sneller te werken'], 1),
(11, 'Welke straling is het gevaarlijkst voor de ogen bij het lassen?', ARRAY['Radiogolven', 'Infrarood en UV-straling', 'Microgolven', 'Zichtbaar licht'], 1),
(11, 'Wat is het gevaar van een beschadigde elektrische kabel?', ARRAY['Hoger verbruik', 'Elektrocutiegevaar', 'Minder kracht', 'Warmere machine'], 1);

-- Questions for Veiligheid Level 3: Brand & EHBO (ID 12)
insert into questions (quiz_id, question, options, correct_index) values
(12, 'Wat doe je onmiddellijk bij een brandwonde?', ARRAY['Eerst hulp gaan zoeken', 'Minstens 20 minuten spoelen met lauw water', 'Boter of zalf smeren', 'Niets doen'], 1),
(12, 'Welk blusmiddel gebruik je bij een elektrische brand?', ARRAY['Water', 'CO2 of poederblusser', 'Schuimblusser', 'Zand'], 1),
(12, 'Wat is het eerste wat je doet bij een ongeval?', ARRAY['Slachtoffer verplaatsen', 'De leerkracht/hulpdiensten waarschuwen', 'Zelf direct gaan helpen', 'Foto maken'], 1),
(12, 'Wat betekent een groen rechthoekig bord met een wit kruis?', ARRAY['Gevaarlijke stoffen', 'Nooduitgang', 'Eerste Hulp (EHBO)', 'Verzamelplaats'], 2),
(12, 'Waar moet je op letten tijdens een evacuatie?', ARRAY['Snel je spullen pakken', 'Kalm blijven en de gemarkeerde route volgen', 'De lift gebruiken', 'Zelf de brand gaan zoeken'], 1);

-- Questions for Veiligheid Level 4: Expert (ID 13)
insert into questions (quiz_id, question, options, correct_index) values
(13, 'Wat is een VCA-certificaat?', ARRAY['Een diploma voor techniek', 'Een veiligheidscertificaat voor aannemers', 'Een rijbewijs voor de heftruck', 'Een merk van gereedschap'], 1),
(13, 'Wanneer moet een machine een CE-markering hebben?', ARRAY['Alleen als ze groot zijn', 'Als ze na 1995 op de Europese markt zijn gebracht', 'Alleen bij export', 'Nooit verplicht'], 1),
(13, 'Wat is de functie van een nuleisbewaking op een machine?', ARRAY['Zorgen dat de machine op nul start', 'Voorkomen dat de machine automatisch herstart na stroomuitval', 'De snelheid regelen', 'Het verbruik meten'], 1),
(13, 'Welke klasse blusmiddel is specifiek voor metaalbranden?', ARRAY['Klasse A', 'Klasse D', 'Klasse F', 'Klasse B'], 1),
(13, 'Wat is een LMRA?', ARRAY['Een lange machine', 'Last Minute Risico Analyse', 'Een soort laskap', 'Een meetinstrument'], 1);

-- ==========================================
-- 2. CATEGORY: GEREEDSCHAPPEN
-- ==========================================
insert into quizzes (id, title, description, category, level, question_count) values
(20, 'Gereedschappen Level 1: Handgereedschap', 'Hamers, vijlen en zagen.', 'Gereedschappen', 1, 5),
(21, 'Gereedschappen Level 2: Meetgereedschap', 'Schuifmaat en micrometer.', 'Gereedschappen', 2, 5),
(22, 'Gereedschappen Level 3: Elektrisch gereedschap', 'Boormachine en slijpschijf.', 'Gereedschappen', 3, 5),
(23, 'Gereedschappen Level 4: Onderhoud', 'Smeren en scherp houden.', 'Gereedschappen', 4, 5);

-- Questions for Gereedschappen Level 1 (ID 20)
insert into questions (quiz_id, question, options, correct_index) values
(20, 'Welke vijl gebruik je voor een ronde opening?', ARRAY['Vlakke vijl', 'Half-ronde of ronde vijl', 'Vierkante vijl', 'Driekante vijl'], 1),
(20, 'Met welk gereedschap teken je af op metaal?', ARRAY['Potlood', 'Kraspen', 'Viltstift', 'Balpen'], 1),
(20, 'Waarom gebruik je een centerpons?', ARRAY['Om een gat te vullen', 'Om de boor een beginpunt te geven', 'Om te markeren', 'Om metaal door te slaan'], 1),
(20, 'Welke hamer gebruik je om iets NIET te beschadigen?', ARRAY['Bankhamer', 'Kunststof of rubber hamer', 'Voorhamer', 'Klauwhamer'], 1),
(20, 'Welke zaag gebruik je voor metaal?', ARRAY['Handzaag (hout)', 'Beugelzaag met fijn getand blad', 'Kapzaag', 'Schrobzaag'], 1);

-- Questions for Gereedschappen Level 2: Meetgereedschap (ID 21)
insert into questions (quiz_id, question, options, correct_index) values
(21, 'Wat is de nauwkeurigheid van een standaard schuifmaat?', ARRAY['0,1 mm', '0,05 of 0,02 mm', '1,0 mm', '0,5 mm'], 1),
(21, 'Welk deel van de schuifmaat gebruik je voor dieptematen?', ARRAY['De grote bekken', 'De kleine bekken', 'De dieptemaatstang', 'De nonius'], 2),
(21, 'Hoe noem je de schaalverdeling op de loper van een schuifmaat?', ARRAY['Liniaal', 'Nonius', 'Maatlat', 'Trommel'], 1),
(21, 'Wat is nauwkeuriger: een schuifmaat of een micrometer?', ARRAY['Schuifmaat', 'Micrometer', 'Zijn gelijk', 'Geen van beide'], 1),
(21, 'Waarvoor dient de ratel op een micrometer?', ARRAY['Om lawaai te maken', 'Om een constante meetdruk te garanderen', 'Om sneller te draaien', 'Om de micrometer vast te zetten'], 1);

-- Questions for Gereedschappen Level 3: Elektrisch gereedschap (ID 22)
insert into questions (quiz_id, question, options, correct_index) values
(22, 'Mag je een boormachine gebruiken met loshangende handschoenen?', ARRAY['Ja', 'Nee, nooit', 'Alleen bij kleine boren', 'Als ze van staal zijn wel'], 1),
(22, 'Waarop moet je letten bij het wisselen van een slijpschijf?', ARRAY['De kleur', 'Het maximaal toerental van de schijf', 'De prijs', 'De dikte'], 1),
(22, 'Wat doe je voor je een elektrisch gereedschap instelt?', ARRAY['Stekker uit het stopcontact', 'Machine aanzetten', 'Handschoenen aandoen', 'Leerkracht bellen'], 0),
(22, 'Waarvoor dient de kap boven een slijpschijf?', ARRAY['Tegen stof', 'Om vonken en schijfelementen op te vangen', 'Om de schijf te koelen', 'Tegen het lawaai'], 1),
(22, 'Hoeveel handen gebruik je bij een haakse slijper?', ARRAY['1 hand', '2 handen voor maximale controle', 'Wat je zelf wil', '3 handen'], 1);

-- Questions for Gereedschappen Level 4: Onderhoud (ID 23)
insert into questions (quiz_id, question, options, correct_index) values
(23, 'Hoe reinig je een vijl na gebruik?', ARRAY['Met water', 'Met een vijlenborstel', 'Afkloppen tegen de bank', 'In de olie leggen'], 1),
(23, 'Waarom moeten meetinstrumenten na gebruik gereinigd en geolied worden?', ARRAY['Om ze te laten glanzen', 'Tegen corrosie (roest) en slijtage', 'Omdat het zo hoort', 'Voor de kleur'], 1),
(23, 'Hoe controleer je of een slijpsteen nog in goede staat is?', ARRAY['De klanktest (tikken)', 'Ruiken', 'Proeven', 'Niet controleren'], 0),
(23, 'Wat gebeurt er als een boor blauw uitslaat?', ARRAY['Hij is mooier', 'Hij is oververhit en de hardheid is weg', 'Hij is scherper geworden', 'Niets'], 1),
(23, 'Waarom mag je een meetinstrument nooit bij snijgereedschap leggen?', ARRAY['Vanwege de geur', 'Om krassen en beschadigingen te voorkomen', 'Te weinig plaats', 'Mag wel'], 1);

-- ==========================================
-- 3. CATEGORY: MACHINES
-- ==========================================
insert into quizzes (id, title, description, category, level, question_count) values
(30, 'Machines Level 1: De Kolomboormachine', 'Basisbediening en toerental.', 'Machines', 1, 5),
(31, 'Machines Level 2: De Draaibank', 'Onderdelen en veiligheid.', 'Machines', 2, 5),
(32, 'Machines Level 3: De Freesmachine', 'Opspannen en gereedschap.', 'Machines', 3, 5),
(33, 'Machines Level 4: CNC Intro', 'De basis van computersturing.', 'Machines', 4, 5);

-- Questions for Machines Level 1 (ID 30)
insert into questions (quiz_id, question, options, correct_index) values
(30, 'Wat moet je doen met de boorsleutel na gebruik?', ARRAY['In de boorkop laten', 'Direct uit de boorkop halen', 'Op de machine leggen', 'Ophangen'], 1),
(30, 'Hoe klem je een klein werkstuk vast bij het boren?', ARRAY['Met de hand', 'In een machineklem', 'Met een tang', 'Niet klemmen'], 1),
(30, 'Wanneer gebruik je een lager toerental?', ARRAY['Bij een kleine boordiameter', 'Bij een grote boordiameter', 'Bij zacht materiaal', 'Als je haast hebt'], 1),
(30, 'Waarvoor dient koelmiddel tijdens het boren?', ARRAY['Smeren en koelen van de boor', 'Schoonmaken van het werkstuk', 'Minder lawaai maken', 'Tegen het stof'], 0),
(30, 'Hoe verwijder je spanen bij een stilstaande machine?', ARRAY['Met je blote handen', 'Met een borstel of kwast', 'Wegblazen met je mond', 'Laten liggen'], 1);

-- Questions for Machines Level 2: De Draaibank (ID 31)
insert into questions (quiz_id, question, options, correct_index) values
(31, 'Wat draait er bij een draaibank?', ARRAY['Het gereedschap (beitel)', 'Het werkstuk', 'De leerkracht', 'De machineklem'], 1),
(31, 'Hoe noem je het onderdeel waarin het werkstuk wordt geklemd?', ARRAY['Beitelhouder', 'Klauwplaat', 'Losse kop', 'Bed'], 1),
(31, 'Wat is de functie van de losse kop?', ARRAY['Het werkstuk aan de linkerkant vasthouden', 'Ondersteunen van lange werkstukken of boren', 'Snelheid regelen', 'Aandrijving'], 1),
(31, 'Wat mag je NOOIT doen als de draaibank draait?', ARRAY['Kijken naar het werkstuk', 'Het werkstuk of de klauwplaat aanraken', 'Koelen', 'Afstand houden'], 1),
(31, 'Hoe stel je de beitel in ten opzichte van het werkstuk?', ARRAY['Boven de centerhoogte', 'Precies op centerhoogte', 'Onder de centerhoogte', 'Maakt niet uit'], 1);

-- Questions for Machines Level 3: De Freesmachine (ID 32)
insert into questions (quiz_id, question, options, correct_index) values
(32, 'Wat draait er bij een freesmachine?', ARRAY['Het werkstuk', 'Het gereedschap (de frees)', 'De tafel', 'De motoren'], 1),
(32, 'In welke richtingen kan de tafel van een freesmachine bewegen?', ARRAY['Alleen links/rechts', 'X, Y en Z-as', 'Alleen omhoog/omlaag', 'Vast'], 1),
(32, 'Wat is meelopend frezen?', ARRAY['Draairichting frees is gelijk aan de voedingsrichting', 'Heeft niets met richting te maken', 'Frees staat stil', 'Tegen de richting in'], 0),
(32, 'Waarom is de opspanning bij frezen zeer belangrijk?', ARRAY['Voor de kleur', 'Vanwege de grote snijkrachten', 'Omdat het minder lawaai maakt', 'Niet belangrijk'], 1),
(32, 'Welk gereedschap gebruik je om een vlak te maken?', ARRAY['Boor', 'Vlakfrees', 'Ruimer', 'Tappen'], 1);

-- Questions for Machines Level 4: CNC Intro (ID 33)
insert into questions (quiz_id, question, options, correct_index) values
(33, 'Wat betekent de afkorting CNC?', ARRAY['Computerized Numerical Control', 'Creative New Construction', 'Computer Netwerk Controle', 'Cool Nieuwe Machine'], 0),
(33, 'Wat is een G-code in CNC-programmering?', ARRAY['Een geheimschrift', 'Een commando voor geometrie of beweging', 'De naam van de programmeur', 'Een foutmelding'], 1),
(33, 'Waarvoor dient de "single block" functie op een CNC machine?', ARRAY['Om de hele dag te draaien', 'Om het programma regel voor regel te controleren', 'Om sneller te gaan', 'Om alles uit te zetten'], 1),
(33, 'Wat is het nulpunt van de machine?', ARRAY['Het midden van de wereld', 'Een vast referentiepunt van de constructeur', 'Waar de operator staat', 'Elke dag anders'], 1),
(33, 'Wat is een CAD/CAM systeem?', ARRAY['Een soort videogame', 'Software voor ontwerpen en omzetten naar machine-code', 'Een besturingssysteem voor computers', 'Alleen voor tekenen'], 1);

-- ==========================================
-- 4. CATEGORY: STAPPENPLANNEN
-- ==========================================
insert into quizzes (id, title, description, category, level, question_count) values
(40, 'Stappenplannen Level 1: Voorbereiding', 'Tekening lezen en aftekenen.', 'Stappenplannen', 1, 5),
(41, 'Stappenplannen Level 2: Bewerken', 'Logische volgorde van handelingen.', 'Stappenplannen', 2, 5),
(42, 'Stappenplannen Level 3: Afwerking', 'Bramen verwijderen en polijsten.', 'Stappenplannen', 3, 5),
(43, 'Stappenplannen Level 4: Controle', 'Kwaliteitscontrole en toleranties.', 'Stappenplannen', 4, 5);

-- Questions for Stappenplannen Level 1 (ID 40)
insert into questions (quiz_id, question, options, correct_index) values
(40, 'Wat is de eerste stap bij een technische opdracht?', ARRAY['Meteen materiaal zagen', 'De tekening analyseren en maten begrijpen', 'Gereedschap pakken', 'De machine aanzetten'], 1),
(40, 'In welke eenheid staan maten op een technische tekening (VTI)?', ARRAY['Centimeter', 'Millimeter', 'Meter', 'Decimeter'], 1),
(40, 'Wat betekent een stippellijn op een tekening?', ARRAY['Een onzichtbare rand', 'Een hartlijn', 'Een breuklijn', 'Een maatlijn'], 0),
(40, 'Waarom maak je een materiaallijst?', ARRAY['Voor de administratie', 'Om efficiënt te werken en fouten te voorkomen', 'Omdat de leerkracht het vraagt', 'Om tijd te rekken'], 1),
(40, 'Wat doe je direct na het aftekenen?', ARRAY['Boren', 'Maten controleren (meten is weten)', 'Vijlen', 'Vakantie vieren'], 1);

-- Questions for Stappenplannen Level 2: Bewerken (ID 41)
insert into questions (quiz_id, question, options, correct_index) values
(41, 'Wat doe je eerst bij het maken van een gat in metaal?', ARRAY['Meteen de grote boor gebruiken', 'Centerponsen en eventueel voorboren', 'Vijl pakken', 'Slijpen'], 1),
(41, 'Wanneer voer je de draaibewerkingen uit?', ARRAY['Helemaal op het einde', 'Meestal voor de boorbewerkingen', 'Maakt niet uit', 'Tussen het slijpen door'], 1),
(41, 'Waarom is de volgorde van bewerkingen belangrijk?', ARRAY['Voor de vorm', 'Om nauwkeurigheid te garanderen en tijd te besparen', 'Om minder lawaai te maken', 'Is niet belangrijk'], 1),
(41, 'Wat doe je voor je een werkstuk definitief afkort?', ARRAY['Een gebedje doen', 'Controleren of er genoeg overmaat is', 'De machine op vol vermogen zetten', 'De kleur checken'], 1),
(41, 'Hoe kies je de juiste machine voor een bewerking?', ARRAY['Kijken welke vrij is', 'Op basis van de bewerking op de tekening', 'Op basis van de grootste machine', 'De leerkracht laten beslissen'], 1);

-- Questions for Stappenplannen Level 3: Afwerking (ID 42)
insert into questions (quiz_id, question, options, correct_index) values
(42, 'Wat is een braam?', ARRAY['Een soort fruit', 'Een scherp randje aan bewerkt metaal', 'Een meetfout', 'Een soort boor'], 1),
(42, 'Hoe verwijder je een braam het beste?', ARRAY['Met je vingers', 'Met een vijl of ontbramer', 'Met een hamer', 'Laten zitten'], 1),
(42, 'Waarom ontbraam je een werkstuk?', ARRAY['Zodat het glanst', 'Voor de veiligheid en een goede passing', 'Om gewicht te besparen', 'Voor de kleur'], 1),
(42, 'Wat doe je om metaal te beschermen tegen roest?', ARRAY['Met water wassen', 'Invetten, oliën of schilderen', 'Buiten leggen', 'Niets'], 1),
(42, 'Wat is polijsten?', ARRAY['Iets kapot maken', 'De oppervlakte zeer glad en glanzend maken', 'Ruwe gaten boren', 'Smerig maken'], 1);

-- Questions for Stappenplannen Level 4: Controle (ID 43)
insert into questions (quiz_id, question, options, correct_index) values
(43, 'Wat betekent een tolerantie op een tekening?', ARRAY['Dat je mag doen wat je wil', 'De toegestane afwijking op een maat', 'De hardheid van het materiaal', 'De prijs van de opdracht'], 1),
(43, 'Wat is een kwaliteitscontrole?', ARRAY['Controleren of je klaar bent om naar huis te gaan', 'Nagaan of het werkstuk voldoet aan alle eisen van de tekening', 'Kijken of de machine nog werkt', 'De leerkracht bedanken'], 1),
(43, 'Met welk instrument controleer je een haakse hoek?', ARRAY['Schuifmaat', 'Blokhaak', 'Liniaal', 'Passer'], 1),
(43, 'Wat doe je als een maat buiten de tolerantie valt?', ARRAY['Verbergen', 'Melden en kijken of het hersteld kan worden', 'Gewoon inleveren', 'Weggooien zonder te zeggen'], 1),
(43, 'Waarom is een eindcontrole essentieel?', ARRAY['Voor de punten', 'Om te garanderen dat het onderdeel functioneel is', 'Om tijd te doden', 'Mag je overslaan'], 1);

-- ==========================================
-- 5. CATEGORY: LASSEN
-- ==========================================
insert into quizzes (id, title, description, category, level, question_count) values
(50, 'Lassen Level 1: Basics', 'Basiskennis lassen en PBM''s.', 'Lassen', 1, 5),
(51, 'Lassen Level 2: Elektrode (BMBE)', 'Basis van het booglassen.', 'Lassen', 2, 5),
(52, 'Lassen Level 3: MIG/MAG & TIG', 'Halfautomaten en precisielassen.', 'Lassen', 3, 5),
(53, 'Lassen Level 4: Lasfouten & Controle', 'Kwaliteit en visuele inspectie.', 'Lassen', 4, 5);

-- Questions for Lassen Level 1: Basics (ID 50)
insert into questions (quiz_id, question, options, correct_index) values
(50, 'Welke PBM beschermt je tegen ''lasogen''?', ARRAY['Veiligheidsbril', 'Laskap met juiste filter', 'Zonnebril', 'Stofmasker'], 1),
(50, 'Wat is het gevaar van lassen op gegalvaniseerd staal?', ARRAY['Het plakt niet', 'Giftige zinkdampen', 'Het wordt te warm', 'Geen gevaar'], 1),
(50, 'Welke kleur heeft een zuurstoffles meestal?', ARRAY['Rood', 'Blauw', 'Grijs', 'Groen'], 1),
(50, 'Waarom draag je lederen handschoenen bij het lassen?', ARRAY['Tegen de kou', 'Tegen hitte, vonken en UV-straling', 'Voor meer grip', 'Omdat het verplicht is voor de kleur'], 1),
(50, 'Wat doe je als je klaar bent met lassen?', ARRAY['Meteen weggaan', 'Apparaat uitschakelen en de werkplek laten afkoelen', 'Ventilatie uitzetten', 'In de kast leggen'], 1);

-- Questions for Lassen Level 2: Elektrode (BMBE) (ID 51)
insert into questions (quiz_id, question, options, correct_index) values
(51, 'Wat betekent de afkorting BMBE?', ARRAY['Booglassen Met Beklede Elektrode', 'Buiten Metaal Bewerken Enzo', 'Basis Metaal Bewerking Elektriciteit', 'Beter Maar Buiten Elektriciteit'], 0),
(51, 'Waarvoor dient de bekleding van een elektrode?', ARRAY['Voor de kleur', 'Beschermgas vormen en slak maken', 'Om de elektrode te isoleren', 'Om de elektrode sterker te maken'], 1),
(51, 'Hoe noem je de beschermlaag die op de lasnaad ligt na het lassen?', ARRAY['Roest', 'Slak', 'Verf', 'Vet'], 1),
(51, 'Wat gebeurt er als de booglengte te groot is?', ARRAY['De las wordt mooier', 'Veel spatten en een onstabiele boog', 'De machine gaat kapot', 'Minder lawaai'], 1),
(51, 'Welke beweging maak je meestal met de elektrode?', ARRAY['Snel heen en weer', 'Een rustige zwaaibeweging of rechte lijn', 'Cirkels trekken', 'Stippen zetten'], 1);

-- Questions for Lassen Level 3: MIG/MAG & TIG (ID 52)
insert into questions (quiz_id, question, options, correct_index) values
(52, 'Wat is het grootste verschil tussen MIG en MAG lassen?', ARRAY['De machine', 'Het type beschermgas (inert vs actief)', 'De lassnelheid', 'De prijs'], 1),
(52, 'Wat betekent de afkorting TIG?', ARRAY['Tungsten Inert Gas', 'Totaal Ingerichte Garage', 'Technisch Is Goed', 'Tegen Iedereen Gelijk'], 0),
(52, 'Welk gas wordt meestal gebruikt als beschermgas bij TIG lassen?', ARRAY['CO2', 'Argon', 'Zuurstof', 'Lachgas'], 1),
(52, 'Welk voordeel heeft MIG/MAG ten opzichte van Elektrode?', ARRAY['Het is goedkoper', 'Continu lassen zonder elektrode te wisselen', 'Minder materiaal nodig', 'Geen stroom nodig'], 1),
(52, 'Is de wolfraam elektrode bij TIG lassen afsmeltend?', ARRAY['Ja', 'Nee', 'Alleen bij aluminium', 'Soms'], 1);

-- Questions for Lassen Level 4: Lasfouten & Controle (ID 53)
insert into questions (quiz_id, question, options, correct_index) values
(53, 'Wat is een ''randinkerving''?', ARRAY['Een inkeping naast de lasrups door te hoge stroom', 'Een soort beitel', 'Een meetfout', 'Een soort lasnaad'], 0),
(53, 'Wat is de oorzaak van porositeit (gaatjes) in de las?', ARRAY['Te veel stroom', 'Te weinig of geen beschermgas', 'Te dikke plaat', 'Te koud water'], 1),
(53, 'Wat is een ''bindfout''?', ARRAY['De las is niet samengesmolten met het basismateriaal', 'De machine is niet verbonden', 'De elektrode zit vast', 'Fout in het stappenplan'], 0),
(53, 'Hoe controleer je een las visueel?', ARRAY['Met een hamer', 'Met het blote oog en eventueel een lasnaadmeter', 'Met een röntgenapparaat', 'Proeven'], 1),
(53, 'Waarom is slakinsluiting een probleem?', ARRAY['Het ziet er niet uit', 'Het verzwakt de lasverbinding', 'Het is te zwaar', 'Geen probleem'], 1);
