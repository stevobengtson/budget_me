source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'rails', '~> 5.0.1'
gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '~> 1.3.0'
gem 'jquery-rails', '~> 4.2.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

gem 'bootstrap-sass', '~> 3.3.6'
gem 'bootstrap_form', '~> 2.5.3'

group :development, :test do
  gem 'byebug', '~> 9.0.6'
  gem 'pry', '~> 0.10.4'
  gem 'pry-byebug', '~> 3.4.2'
  gem 'pry-rails', '~> 0.3.4'
end

group :development do
  gem 'web-console', '~> 3.3.0'
  gem 'listen', '~> 3.0.5'
  gem 'spring', '~> 2.0.1'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'rails-controller-testing', '~> 0.1.1'
  gem 'minitest-reporters', '~> 1.1.9'
  gem 'guard', '~> 2.13.0'
  gem 'guard-minitest', '~> 2.4.4'
  gem 'mocha', '~> 1.2.1'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
