# frozen_string_literal: true

source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "3.0.2"
gem "rails", "~> 7.0.4"

# GENERAL #
gem "amazing_print"
gem "pg", "~> 1.1"
gem "rails_semantic_logger"
gem "puma", "~> 5.0"
gem "jbuilder"
gem "turbo-rails"
gem "redis", "~> 4.0"
gem "tzinfo-data"
gem "bootsnap", require: false
gem "devise"

# ASSETS #
gem "sprockets-rails"
gem "jsbundling-rails"
gem "stimulus-rails"
gem "cssbundling-rails"
# gem "sassc-rails"
# gem "image_processing", "~> 1.2"

# SECURITY #
# gem "kredis"
# gem "bcrypt", "~> 3.1.7"

group :development, :test do
  gem "debug"
  gem "rspec"
  gem "rspec-rails"
  gem "rails-controller-testing"
  gem "faker"
end

group :development do
  gem "web-console"
  gem "rack-mini-profiler"
  gem "spring"
  gem "brakeman", require: false
  gem "bullet"
  gem "bundle-audit"
  gem "listen"
  gem "rubocop", require: false
  gem "rubocop-rails"
  gem "rubocop-performance"
  gem "rubocop-rspec"
  gem "rubocop-shopify"
  gem "solargraph"
  gem "annotate"
end

group :test do
  gem "capybara"
  gem "selenium-webdriver"
  gem "webdrivers"
end
