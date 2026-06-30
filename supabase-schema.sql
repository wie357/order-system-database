create table if not exists public.menu_items (
  id text primary key,
  name text not null,
  price numeric not null default 0,
  supplies jsonb not null default '{}'::jsonb,
  sort_order integer not null default 0,
  active boolean not null default true,
  created_at timestamptz not null default now()
);

create table if not exists public.bookings (
  id text primary key,
  group_name text,
  contact_name text,
  mobile text,
  date date not null,
  time text not null,
  people integer not null default 1,
  created_at timestamptz not null default now()
);

alter table public.bookings
add column if not exists group_name text;

alter table public.bookings
add column if not exists contact_name text;

alter table public.bookings
add column if not exists mobile text;

create table if not exists public.orders (
  id text primary key,
  customer_name text,
  customer_phone text,
  subtotal numeric not null default 0,
  discount_type text not null default 'none',
  discount_value numeric not null default 0,
  discount_amount numeric not null default 0,
  total_qty integer not null default 0,
  grand_total numeric not null default 0,
  items jsonb not null default '[]'::jsonb,
  status text not null default 'new',
  created_at timestamptz not null default now()
);

alter table public.menu_items enable row level security;
alter table public.bookings enable row level security;
alter table public.orders enable row level security;

drop policy if exists "public menu read" on public.menu_items;
drop policy if exists "public menu write" on public.menu_items;
drop policy if exists "public bookings read" on public.bookings;
drop policy if exists "public bookings write" on public.bookings;
drop policy if exists "public orders read" on public.orders;
drop policy if exists "public orders write" on public.orders;

create policy "public menu read"
on public.menu_items for select
to anon
using (true);

create policy "public menu write"
on public.menu_items for all
to anon
using (true)
with check (true);

create policy "public bookings read"
on public.bookings for select
to anon
using (true);

create policy "public bookings write"
on public.bookings for all
to anon
using (true)
with check (true);

create policy "public orders read"
on public.orders for select
to anon
using (true);

create policy "public orders write"
on public.orders for all
to anon
using (true)
with check (true);
