-- صندوق طلبات البوابة العامة — نفّذ مرة واحدة في Supabase ← SQL Editor
create table if not exists rhms_applications (
  id text primary key,
  job_id text,
  payload jsonb not null,
  imported boolean not null default false,
  created_at timestamptz not null default now()
);
alter table rhms_applications enable row level security;
create policy "public submit" on rhms_applications for insert to anon with check (imported = false);
create policy "staff read"   on rhms_applications for select to authenticated using (true);
create policy "staff update" on rhms_applications for update to authenticated using (true);
create policy "staff delete" on rhms_applications for delete to authenticated using (true);
