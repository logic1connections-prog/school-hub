-- ==========================================
-- SCHOOL HUB CONTENT PACK: VEILIGHEID & TECHNIEK
-- ==========================================

-- 1. Algemene Veiligheid & PBM's
INSERT INTO quizzes (title, description, category, question_count) 
VALUES ('Veiligheid: PBM''s & Signalisatie', 'Ken jij je Persoonlijke Beschermingsmiddelen?', 'Veiligheid', 5);

DO $$
DECLARE quiz_id bigint;
BEGIN
  SELECT id INTO quiz_id FROM quizzes WHERE title = 'Veiligheid: PBM''s & Signalisatie' ORDER BY id DESC LIMIT 1;

  INSERT INTO questions (quiz_id, question, options, correct_index) VALUES
  (quiz_id, 'Wat betekent een blauw rond bord met een wit symbool?', ARRAY['Verbod (mag niet)', 'Gebod (moet)', 'Waarschuwing (pas op)', 'Redding (EHBO)'], 1),
  (quiz_id, 'Welke PBM is verplicht bij lawaai boven 80dB?', ARRAY['Veiligheidsbril', 'Gehoorbescherming', 'Veiligheidsschoenen', 'Stofmasker'], 1),
  (quiz_id, 'Wat is de betekenis van een geel driehoekig bord met zwarte rand?', ARRAY['Brandgevaar', 'Waarschuwing voor gevaar', 'Verplichte rijrichting', 'Nooduitgang'], 1),
  (quiz_id, 'Waarvoor dienen veiligheidsschoenen met stalen neus?', ARRAY['Tegen koude voeten', 'Tegen vallende voorwerpen', 'Om sneller te lopen', 'Tegen elektrische schokken'], 1),
  (quiz_id, 'Wat doe je als je een onveilige situatie ziet?', ARRAY['Negeren', 'Zelf oplossen zonder kennis', 'Melden bij de leerkracht/chef', 'Weglopen'], 2);
END $$;


-- 2. Lassen & Constructie
INSERT INTO quizzes (title, description, category, question_count) 
VALUES ('Techniek: Veilig Lassen', 'Gevaren bij lassen en snijden.', 'Lassen', 5);

DO $$
DECLARE quiz_id bigint;
BEGIN
  SELECT id INTO quiz_id FROM quizzes WHERE title = 'Techniek: Veilig Lassen' ORDER BY id DESC LIMIT 1;

  INSERT INTO questions (quiz_id, question, options, correct_index) VALUES
  (quiz_id, 'Welke straling komt vrij bij elektrisch lassen?', ARRAY['Röntgenstraling', 'UV- en IR-straling', 'Gamma-straling', 'Radiogolven'], 1),
  (quiz_id, 'Waarom draag je een laskap?', ARRAY['Tegen vonken en straling (lasogen)', 'Omdat het stoer staat', 'Tegen het lawaai', 'Om beter te kunnen ademen'], 0),
  (quiz_id, 'Hoe moet je gasflessen opslaan?', ARRAY['Liggend op de grond', 'Rechtop en vastgeketend', 'In de zon', 'Naast de kachel'], 1),
  (quiz_id, 'Wat is een groot gevaar bij lassen in een kleine ruimte?', ARRAY['Verstikking door rookgassen', 'Verveling', 'Koude', 'Te veel licht'], 0),
  (quiz_id, 'Welk materiaal mag je NOOIT lassen zonder speciale voorzorgen?', ARRAY['Staal', 'Gegalvaniseerd staal (zink)', 'IJzer', 'Koper'], 1);
END $$;


-- 3. Mechanica: Verspanen (Draaien/Frezen)
INSERT INTO quizzes (title, description, category, question_count) 
VALUES ('Mechanica: Verspanen', 'Veilig werken aan machines.', 'Mechanica', 5);

DO $$
DECLARE quiz_id bigint;
BEGIN
  SELECT id INTO quiz_id FROM quizzes WHERE title = 'Mechanica: Verspanen' ORDER BY id DESC LIMIT 1;

  INSERT INTO questions (quiz_id, question, options, correct_index) VALUES
  (quiz_id, 'Mag je handschoenen dragen aan een draaibank?', ARRAY['Ja, altijd', 'Nee, nooit (grijpgevaar)', 'Alleen in de winter', 'Als ze van leer zijn'], 1),
  (quiz_id, 'Wat doe je met lange haren bij een boormachine?', ARRAY['Los laten hangen', 'In een staart of haarnetje', 'Afknippen', 'Onder je trui stoppen'], 1),
  (quiz_id, 'Wanneer mag je spanen verwijderen?', ARRAY['Als de machine draait', 'Als de machine stilstaat', 'Met je blote handen', 'Tijdens het boren'], 1),
  (quiz_id, 'Wat is verplicht bij het werken met een slijpschijf?', ARRAY['Zonnebril', 'Veiligheidsbril', 'Leesbril', 'Geen bril'], 1),
  (quiz_id, 'Wat betekent de noodstop?', ARRAY['Pauze nemen', 'Machine onmiddellijk uitschakelen', 'Licht aandoen', 'Snelheid verhogen'], 1);
END $$;


-- 4. Elektriciteit: Basisveiligheid
INSERT INTO quizzes (title, description, category, question_count) 
VALUES ('Elektriciteit: Gevaren', 'Veilig werken met spanning.', 'Elektriciteit', 4);

DO $$
DECLARE quiz_id bigint;
BEGIN
  SELECT id INTO quiz_id FROM quizzes WHERE title = 'Elektriciteit: Gevaren' ORDER BY id DESC LIMIT 1;

  INSERT INTO questions (quiz_id, question, options, correct_index) VALUES
  (quiz_id, 'Wat is de eenheid van spanning?', ARRAY['Ampère', 'Volt', 'Watt', 'Ohm'], 1),
  (quiz_id, 'Wat gebeurt er bij kortsluiting?', ARRAY['De stroom wordt heel groot', 'De spanning wordt heel groot', 'Het licht gaat feller branden', 'Niets'], 0),
  (quiz_id, 'Welke kleur heeft de aardedraad meestal?', ARRAY['Bruin', 'Blauw', 'Geel/Groen', 'Zwart'], 2),
  (quiz_id, 'Mag je een elektrisch apparaat blussen met water?', ARRAY['Ja, altijd', 'Nee, nooit (elektrocutiegevaar)', 'Alleen als het warm water is', 'Als de stekker er nog in zit wel'], 1);
END $$;
