# frozen_string_literal: true

source "https://rubygems.org"

gem "rake"

group :development, :test do
  gem "irb"
end

group :development do
  gem "sorbet"
  gem "tapioca", require: false

  gem "rubocop", require: false
  gem "rubocop-minitest", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rake", require: false
  gem "rubocop-shopify", require: false
  gem "rubocop-sorbet", require: false

  gem "bundler-audit", require: false
end

group :test do
  gem "minitest"
  gem "minitest-reporters"
end
