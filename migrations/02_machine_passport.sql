-- NEW TABLES FOR MACHINE PASSPORT

-- 1. Machines Table
create table if not exists machines (
  id uuid default uuid_generate_v4() primary key,
  name text not null,
  description text,
  image_url text,
  safety_manual_url text,
  quiz_id bigint references quizzes(id) on delete set null,
  created_at timestamp with time zone default timezone('utc'::text, now()) not null
);

-- 2. Machine Certificates Table
create table if not exists machine_certificates (
  id uuid default uuid_generate_v4() primary key,
  student_id uuid references students(id) on delete cascade not null,
  machine_id uuid references machines(id) on delete cascade not null,
  status text check (status in ('certified', 'pending', 'locked')) default 'locked',
  issued_at timestamp with time zone,
  unique(student_id, machine_id)
);

-- 3. Seed some machines (optional, but good for demo)
-- insert into machines (name, description, image_url) values 
-- ('Kolomboormachine', 'Voor het boren van gaten in metaal.', 'assets/machines/boormachine.jpg'),
-- ('Draaibank', 'Voor het draaien van ronde werkstukken.', 'assets/machines/draaibank.jpg'),
-- ('Slijpmachine', 'Voor het afbramen en slijpen van beitels.', 'assets/machines/slijpmachine.jpg');
