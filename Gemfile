# frozen_string_literal: true

source "https://rubygems.org"

ruby File.read(".ruby-version").strip

gem "rails", "~> 7.0.4"
gem "puma"

# databases
gem "pg"
gem "redis"

gem "oj"
gem "bootsnap", require: false

# app specific gems...................................................................
gem "acts-as-taggable-on"
gem "acts_as_votable"
gem "acts_as_list"
gem "activestorage"
gem "ahoy_matey"
gem "amazing_print"
gem "avo"
gem "chartkick"
gem "counter_culture"
gem "dalli"
gem "devise"
gem "dotenv-rails"
gem "faraday"
gem "faraday-multipart"
gem "font-awesome-rails"
gem "hashie"
gem "image_processing"
gem "mini_magick"
gem "nokogiri"
gem "omniauth-facebook"
gem "omniauth-google-oauth2"
gem "omniauth-rails_csrf_protection"
gem "pagy"
gem "pg_search"
gem "pundit"
gem "ransack"
gem "rails_autolink"
gem "rails-i18n"
gem "scenic"
gem "shimmer"
gem "slim-rails"
gem "sidekiq"
gem "sidekiq-scheduler"
gem "sidekiq-throttled"
gem "sitemap_generator"
gem "streamio-ffmpeg"
gem "net-ssh"
gem "yael"

# Assets
gem "jsbundling-rails"
gem "cssbundling-rails"
gem "stimulus-rails"
gem "autoprefixer-rails"
gem "turbo-rails"
gem "serviceworker-rails"
gem "hotwire-livereload"
gem "propshaft"

# External Services
gem "aws-sdk-s3"
gem "deepl-rb", require: "deepl"
gem "yt"
gem "rspotify"
gem "newrelic_rpm"
gem "barnes" # enables detailed metrics within heroku
gem "skylight"
gem "sentry-ruby"
gem "sentry-rails"

group :development, :test do
  gem "rspec-rails"
  gem "standard"
  gem "capybara"
  gem "cuprite"
  gem "i18n-tasks", "0.9.35"
  gem "rack_session_access"
  gem "chusaku", require: false
  gem "pry-rails"
  gem "pry-byebug"
  gem "pry-doc"
  gem "rspec-retry"
  gem "webmock", require: false
  gem "capybara-screenshot-diff"
end

group :development do
  gem "listen"
  gem "web-console"
  gem "annotate"
  gem "rb-fsevent"
  gem "letter_opener"
  gem "debug"
  gem "guard"
  gem "guard-rspec"
  gem "solargraph"
  gem "solargraph-standardrb"
  gem "rubocop-rails"
  gem "rubocop-performance"
  gem "rubocop-rspec"
  gem "rubocop-rake"
end
