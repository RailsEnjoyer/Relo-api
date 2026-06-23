# Relo

Relo is a relocation planning workspace built with Ruby on Rails.

This project focuses on helping users plan a move end-to-end: compare neighborhoods, track listings, manage viewings and applications, organize tasks and deadlines, and collaborate in a shared workspace.

## Tech Stack

- Ruby 3.3.x
- Rails 8.1
- PostgreSQL
- Hotwire (Turbo + Stimulus)
- Tailwind CSS
- Devise
- Pundit
- Sidekiq + Redis
- Stripe
- Active Storage
- PgSearch
- Geocoder
- RSpec + FactoryBot + Faker
- RuboCop (+ Rails/RSpec/Performance)

## Local Setup

### 1. Prerequisites

- Ruby 3.3.x
- PostgreSQL
- Redis
- Bundler

### 2. Install dependencies

```bash
bundle install
```

### 3. Prepare database

```bash
bin/rails db:prepare
```

### 4. Run app

Default app port is `3001`.

```bash
bin/rails s
```

Alternative (Foreman + Procfile):

```bash
bin/dev
```

### 5. Run tests

```bash
bin/rspec spec
```

## Code Quality

Run lint:

```bash
bin/rubocop
```

Run security checks:

```bash
bin/brakeman
bin/bundler-audit
```

## Deployment Direction

- Containerized deployment with Kamal
- Production infra expected to use managed Postgres + Redis
- Background jobs via Sidekiq

## Non-Goals

- generic todo/blog/shop tutorial app
- backend-only API demo
- overengineered SPA or microservices architecture
