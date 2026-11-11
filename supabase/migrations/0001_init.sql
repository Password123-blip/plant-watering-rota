-- Plant Watering Rota — schema
-- Safe to run more than once.

create extension if not exists "pgcrypto";

create table if not exists public.plant_watering_rota_waterings (
  id uuid primary key default gen_random_uuid(),
  plant text,
  location text,
  watered_on date,
  amount_ml integer,
  notes text,
  created_at timestamptz not null default now()
);

create index if not exists plant_watering_rota_waterings_created_idx on public.plant_watering_rota_waterings (created_at desc);

alter table public.plant_watering_rota_waterings enable row level security;

drop policy if exists "plant_watering_rota_waterings_read" on public.plant_watering_rota_waterings;
create policy "plant_watering_rota_waterings_read" on public.plant_watering_rota_waterings for select using (true);

drop policy if exists "plant_watering_rota_waterings_insert" on public.plant_watering_rota_waterings;
create policy "plant_watering_rota_waterings_insert" on public.plant_watering_rota_waterings for insert with check (true);
