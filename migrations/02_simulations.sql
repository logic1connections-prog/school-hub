-- Create table for tracking simulation results
create table if not exists simulation_results (
  id uuid default uuid_generate_v4() primary key,
  user_id uuid references auth.users not null,
  machine_type text not null, -- e.g., 'drill_press'
  module_type text not null, -- 'quiz', 'inspector', 'drill_op'
  score int,
  completed_at timestamp with time zone default now()
);

-- Add RLS policies
alter table simulation_results enable row level security;

create policy "Users can insert their own results"
  on simulation_results for insert
  with check (auth.uid() = user_id);

create policy "Users can view their own results"
  on simulation_results for select
  using (auth.uid() = user_id);
