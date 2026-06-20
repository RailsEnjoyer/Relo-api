# frozen_string_literal: true

Geocoder.configure(
  timeout: 5,
  lookup: :nominatim,

  http_headers: { 'User-Agent' => 'RelocationApp/1.0 (kaito@relo-app.local)' }
)
