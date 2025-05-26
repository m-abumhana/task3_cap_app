source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Rails API only
gem "rails", "~> 7.0.8"

# Use sqlite3 as the database for Active Record (dev & test only)
group :development, :test do
  gem "sqlite3", "~> 1.4"
end

# Use Puma as the app server
gem "puma", "~> 5.0"

# For rendering JSON APIs
# (ActiveModelSerializers or fast_jsonapi go here if you like)

# Manage timezones
gem "tzinfo-data", platforms: %i[ mingw mswin x64_mingw jruby ]

# Speed up boot
gem "bootsnap", require: false

# ————————————————————————————————
# Development & Test
group :development, :test do
  # debugging
  gem "debug", platforms: %i[ mri mingw x64_mingw ]

  # web console (dev only)
  gem "web-console",    group: :development
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
end
gem "logger"
# ————————————————————————————————
# Capistrano for deployment (development only)
group :development do
  gem "capistrano",       "~> 3.17", require: false
  gem "capistrano-rails",            require: false
  gem "capistrano-passenger",        require: false  # or capistrano-puma if you use Puma
  gem "capistrano-rbenv",            require: false
end

