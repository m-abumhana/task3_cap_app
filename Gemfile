source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.2.2"

# Rails API only
gem "rails", "~> 7.0.8"

# Use sqlite3 in development & test
group :development, :test do
  gem "sqlite3", "~> 1.4"
  gem "debug",    platforms: %i[mri mingw x64_mingw]
end

# Use MySQL in all environments
gem "mysql2", ">= 0.5", "< 0.6"

# App server
gem "puma", "~> 5.0"

# Timezone data
gem "tzinfo-data", platforms: %i[mingw mswin x64_mingw jruby]

# Speed up boot time
gem "bootsnap", require: false

# Web console (development only)
group :development do
  gem "web-console"
end

# System & integration testing
group :test do
  gem "capybara"
  gem "selenium-webdriver"
end

# Core logger (if you need any custom logger features)
gem "logger"

# Capistrano for deployment (development only)
group :development do
  gem "capistrano",        "~> 3.19", require: false
  gem "capistrano-rails",           require: false
  gem "capistrano-passenger",       require: false  # or capistrano-puma
  gem "capistrano-rbenv",           require: false
end
