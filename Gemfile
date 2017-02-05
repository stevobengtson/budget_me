# frozen_string_literal: true
source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootstrap_form', '~> 2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.2.2'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'pundit', '~> 1.1.0'
gem 'rails', '~> 5.0.1'
gem 'redis', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '~> 3.0.4'

group :development, :test do
  gem 'byebug', '~> 9.0.6'
  gem 'pry', '~> 0.10.4'
  gem 'pry-byebug', '~> 3.4.2'
  gem 'pry-rails', '~> 0.3.4'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'rubocop', '~> 0.47.1', require: false
  gem 'spring', '~> 2.0.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '~> 3.3.0'
end

group :test do
  gem 'guard', '~> 2.13.0'
  gem 'guard-bundler', '~> 2.1.0', require: false
  gem 'guard-minitest', '~> 2.4.4'
  gem 'guard-rubocop', '~> 1.2.0'
  gem 'minitest-reporters', '~> 1.1.9'
  gem 'mocha', '~> 1.2.1'
  gem 'rails-controller-testing', '~> 0.1.1'
  gem 'simplecov', '~> 0.13.0', require: false
end
