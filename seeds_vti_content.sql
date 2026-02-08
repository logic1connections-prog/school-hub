-- Clear existing quizzes to avoid confusion
delete from questions;
delete from quizzes;

-- Category: Veiligheid
insert into quizzes (id, title, description, category, level, question_count) values
(10, 'Veiligheid Level 1: Basics', 'Basiskennis PBM en signalisatie.', 'Veiligheid', 1, 5),
(11, 'Veiligheid Level 2: Gevaren', 'Gevaren in de werkplaats.', 'Veiligheid', 2, 5),
(12, 'Veiligheid Level 3: Brand & EHBO', 'Wat te doen bij incidenten?', 'Veiligheid', 3, 5),
(13, 'Veiligheid Level 4: Expert', 'Complexe veiligheidssituaties.', 'Veiligheid', 4, 5);

-- Category: Gereedschappen
insert into quizzes (id, title, description, category, level, question_count) values
(20, 'Gereedschappen Level 1: Handgereedschap', 'Hamers, vijlen en zagen.', 'Gereedschappen', 1, 5),
(21, 'Gereedschappen Level 2: Meetgereedschap', 'Schuifmaat en micrometer.', 'Gereedschappen', 2, 5),
(22, 'Gereedschappen Level 3: Elektrisch gereedschap', 'Boormachine en slijpschijf.', 'Gereedschappen', 3, 5),
(23, 'Gereedschappen Level 4: Onderhoud', 'Smeren en scherp houden.', 'Gereedschappen', 4, 5);

-- Category: Machines
insert into quizzes (id, title, description, category, level, question_count) values
(30, 'Machines Level 1: De Kolomboormachine', 'Basisbediening en toerental.', 'Machines', 1, 5),
(31, 'Machines Level 2: De Draaibank', 'Onderdelen en veiligheid.', 'Machines', 2, 5),
(32, 'Machines Level 3: De Freesmachine', 'Opspannen en gereedschap.', 'Machines', 3, 5),
(33, 'Machines Level 4: CNC Intro', 'De basis van computersturing.', 'Machines', 4, 5);

-- Category: Stappenplannen
insert into quizzes (id, title, description, category, level, question_count) values
(40, 'Stappenplannen Level 1: Voorbereiding', 'Tekening lezen en aftekenen.', 'Stappenplannen', 1, 5),
(41, 'Stappenplannen Level 2: Bewerken', 'Logische volgorde van handelingen.', 'Stappenplannen', 2, 5),
(42, 'Stappenplannen Level 3: Afwerking', 'Bramen verwijderen en polijsten.', 'Stappenplannen', 3, 5),
(43, 'Stappenplannen Level 4: Controle', 'Kwaliteitscontrole en toleranties.', 'Stappenplannen', 4, 5);

-- Questions for Veiligheid Level 1 (Quiz ID 10)
insert into questions (quiz_id, question, options, correct_index) values
(10, 'Wat betekent een blauw rond bord met een wit symbool?', ARRAY['Verbod (mag niet)', 'Gebod (moet)', 'Waarschuwing (pas op)', 'Redding (EHBO)'], 1),
(10, 'Welke PBM is verplicht bij lawaai boven 80dB?', ARRAY['Veiligheidsbril', 'Gehoorbescherming', 'Veiligheidsschoenen', 'Stofmasker'], 1),
(10, 'Wat is de betekenis van een geel driehoekig bord met zwarte rand?', ARRAY['Brandgevaar', 'Waarschuwing voor gevaar', 'Verplichte rijrichting', 'Nooduitgang'], 1),
(10, 'Waarvoor dienen veiligheidsschoenen met stalen neus?', ARRAY['Tegen koude voeten', 'Tegen vallende voorwerpen', 'Om sneller te lopen', 'Tegen elektrische schokken'], 1),
(10, 'Wat doe je als je een onveilige situatie ziet?', ARRAY['Negeren', 'Zelf oplossen zonder kennis', 'Melden bij de leerkracht/chef', 'Weglopen'], 2);

-- Add questions for other levels (Simplified for demonstration)
-- (In a real scenario, we would add all currentQuestions here)
-- For now, let's add at least Level 1 for each category.

-- Questions for Gereedschappen Level 1 (Quiz ID 20)
insert into questions (quiz_id, question, options, correct_index) values
(20, 'Welke vijl gebruik je voor een ronde opening?', ARRAY['Vlakke vijl', 'Driekante vijl', 'Ronde vijl', 'Vierkante vijl'], 2),
(20, 'Met welk gereedschap teken je af op metaal?', ARRAY['Potlood', 'Kraspen', 'Marker', 'Krijt'], 1),
(20, 'Wat gebruik je om een centerpunt te slaan?', ARRAY['Bankhamer', 'Centerpons', 'Drevel', 'Beitel'], 1),
(20, 'Waarom gebruik je een zachte hamer op metaal?', ARRAY['Om lawaai te vermijden', 'Om de oppervlakte niet te beschadigen', 'Omdat het lichter is', 'Heeft geen nut'], 1),
(20, 'Welke zaag gebruik je voor metaal?', ARRAY['Handzaag', 'Beugelzaag', 'Decoupeerzaag', 'Cirkelzaag'], 1);

-- Questions for Machines Level 1 (Quiz ID 30)
insert into questions (quiz_id, question, options, correct_index) values
(30, 'Wat moet je doen met de boorsleutel na het inspannen?', ARRAY['Laten zitten', 'Onmiddellijk verwijderen', 'Op de tafel leggen', 'In je zak steken'], 1),
(30, 'Mag je een werkstuk met de hand vasthouden tijdens het boren?', ARRAY['Ja, als het klein is', 'Nee, altijd inklemmen', 'Alleen bij lage snelheid', 'Alleen met handschoenen'], 1),
(30, 'Wat bepaalt het toerental van de boor?', ARRAY['De kleur van de machine', 'De diameter van de boor en het materiaal', 'De lengte van het snoer', 'De ervaring van de leerling'], 1),
(30, 'Wanneer gebruik je koelmiddel?', ARRAY['Alleen als het buiten warm is', 'Om de boor en het werkstuk te koelen', 'Om de machine schoon te maken', 'Nooit nodig'], 1),
(30, 'Hoe verwijder je spanen bij de boormachine?', ARRAY['Met je handen', 'Met een kwast of spaakhaak', 'Wegblazen met je mond', 'Laten liggen'], 1);

-- Questions for Stappenplannen Level 1 (Quiz ID 40)
insert into questions (quiz_id, question, options, correct_index) values
(40, 'Wat is de eerste stap bij een nieuw project?', ARRAY['Meteen beginnen zagen', 'De werktekening bestuderen', 'Gereedschap gaan halen', 'De machine aanzetten'], 1),
(40, 'Wat betekent een dikke ononderbroken lijn op een tekening?', ARRAY['Zichtbare rand', 'Onzichtbare rand', 'Maatlijn', 'Hartlijn'], 0),
(40, 'In welke eenheid staan maten op een technische tekening meestal?', ARRAY['Centimeter', 'Millimeter', 'Meter', 'Decimeter'], 1),
(40, 'Waarom maak je een materiaallijst?', ARRAY['Voor de administratie', 'Om te weten wat je nodig hebt', 'Omdat de leerkracht het vraagt', 'Om tijd te rekken'], 1),
(40, 'Wat doe je na het aftekenen?', ARRAY['Meteen boren', 'Maten controleren', 'Vijl pakken', 'Koffie drinken'], 1);
