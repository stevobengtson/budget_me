# frozen_string_literal: true
source 'https://rubygems.org'

ruby '2.4.0'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'bcrypt', '~> 3.1.7'
gem 'bootstrap_form', '~> 2.5.3'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails', '~> 4.2.2'
gem 'kaminari', '~> 1.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'pundit', '~> 1.1.0'
gem 'rails', '~> 5.0.1'
gem 'sass-rails', '~> 5.0'
gem 'turbolinks', '~> 5'
gem 'uglifier', '~> 3.0.4'

group :development, :test do
  gem 'faker', '~> 1.7.3'
  gem 'pry', '~> 0.10.4'
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
  gem 'minitest-reporters', '~> 1.1.9'
  gem 'mocha', '~> 1.2.1'
  gem 'rails-controller-testing', '~> 0.1.1'
end
