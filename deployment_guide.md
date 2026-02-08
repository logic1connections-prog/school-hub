# Deployment Guide: School Hub Online

Omdat dit een moderne web-app is, gebruiken we **Vercel** voor de hosting en **Supabase** voor de database.

## Stap 1: Supabase Voorbereiden
1. Ga naar je [Supabase Dashboard](https://supabase.com).
2. Open de **SQL Editor**.
3. Kopieer de inhoud van [production_ready_setup.sql](file:///home/birger/agent-zero/school-hub/production_ready_setup.sql) en plak het in een nieuwe query.
4. Klik op **Run**. Je database is nu volledig klaar (tabellen, functies en quiz content).

## Stap 2: Onlinezetten via Vercel (Aanbevolen)
1. Zorg dat je code in een GitHub repo staat (bijv. `frdel/agent-zero`).
2. Log in op [Vercel](https://vercel.com) en kies "Add New" -> "Project".
3. Importeer je GitHub repo.
4. Bij **Root Directory**, kies `school-hub`.
5. **CRUCIAAL**: Voeg de Environment Variables toe bij "Environment Variables":
   - `VITE_SUPABASE_URL`: (Vind je in Supabase Project Settings -> API)
   - `VITE_SUPABASE_ANON_KEY`: (Vind je in Supabase Project Settings -> API)
6. Klik op **Deploy**.

## Stap 3: Leerlingen Toegang Geven
Zodra de deployment klaar is, geeft Vercel je een URL (bijv. `school-hub-vti.vercel.app`). 
Deel deze URL met de leerlingen. Ze kunnen zich registreren en direct aan de slag!

---

**Belangrijke Opmerking over Beveiliging:**
De app gebruikt **Row Level Security (RLS)**. Dit betekent dat leerlingen alleen hun eigen gegevens kunnen aanpassen. De admin-functies zijn beveiligd; alleen gebruikers met `is_admin = true` in de `students` tabel kunnen bij het admin dashboard.
