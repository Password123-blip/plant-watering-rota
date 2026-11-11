# Plant Watering Rota

**Stop killing your plants**

A full-stack demo built with **Next.js 14 (App Router)**, **Tailwind CSS** and a
**Supabase (Postgres)** backend. Records are written from the browser straight to
Postgres through row-level security policies — no custom API layer to maintain.

---

## Stack

| Layer | Choice |
| --- | --- |
| Framework | Next.js 14, App Router, TypeScript |
| Styling | Tailwind CSS |
| Database | Supabase Postgres, RLS-secured |
| Hosting | GitHub Pages (static export via Actions) |

## Run it locally

```bash
npm install
cp .env.example .env.local   # add your Supabase URL + anon key
npm run dev
```

Open http://localhost:3000.

## Set up the database

Run `supabase/migrations/0001_init.sql` in the Supabase SQL editor. It is
idempotent — safe to run more than once. It creates the `plant_watering_rota_waterings` table,
enables row-level security and adds read/insert policies for anonymous users.

## Data model

Table: `plant_watering_rota_waterings`

| Column | Type |
| --- | --- |
| `plant` | text |
| `location` | text |
| `watered_on` | date |
| `amount_ml` | integer |
| `notes` | text |
| `created_at` | timestamptz |

Every row also has `id uuid` and `created_at timestamptz`.

## Deploy

Deployment is handled by `.github/workflows/deploy-pages.yml`, which builds a
static export and publishes it to GitHub Pages on every push to `main`. Set
`NEXT_PUBLIC_SUPABASE_URL` and `NEXT_PUBLIC_SUPABASE_ANON_KEY` as repository
Actions secrets — the workflow injects them at build time.

## What it does

- **Per-plant history** — Each plant keeps its own watering record.
- **Volume tracking** — Millilitres, not guesses.
- **By location** — Balcony versus indoors behaves differently.

## License

MIT
