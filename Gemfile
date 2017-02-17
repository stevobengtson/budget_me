# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap_form', '~> 2.5.3'
gem 'figaro', '~> 1.1.1'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.2.2'
gem 'kaminari', '~> 1.0.1'
gem 'mysql2', '~> 0.4.5'
gem 'puma', '~> 3.0'
gem 'pundit', '~> 1.1.0'
gem 'rails', '~> 5.0.1'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '~> 3.0.4'

group :development, :test do
  gem 'byebug', '~> 9.0.6'
  gem 'faker', '~> 1.7.3'
  gem 'pry', '~> 0.10.4'
  gem 'pry-byebug', '~> 3.4.2'
  gem 'pry-rails', '~> 0.3.4'
end

group :development do
  gem 'capistrano', '~> 3.7.2'
  gem 'capistrano3-puma', '~> 1.2.1'
  gem 'capistrano-rails', '~> 1.2.2', require: false
  gem 'capistrano-bundler', '~> 1.2.0', require: false
  gem 'capistrano-rvm', '~> 0.1.2'
  gem 'listen', '~> 3.0.5'
  gem 'rubocop', '~> 0.47.1', require: false
  gem 'spring', '~> 2.0.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'web-console', '~> 3.3.0'
end

group :test do
  gem 'minitest-reporters', '~> 1.1.9'
  gem 'mocha', '~> 1.2.1'
  gem 'rails-controller-testing', '~> 0.1.1'
end
