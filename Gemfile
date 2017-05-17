source 'https://rubygems.org'
# Workaround for vulernability in Bundler that causes it to load
# gems via an insecure HTTP (not HTTPS) connection.
git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.1'
# Pg is the Ruby interface to the PostgreSQL RDBMS
gem 'pg'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Flexible authentication solution for Rails with Warden
gem 'devise', '~> 4.3'
# Object oriented authorization for Rails applications
gem 'pundit', '~> 1.1'
# ActiveModel::Serializers allows you to generate your JSON in an object-oriented and convention-driven manner.
gem 'active_model_serializers', '~> 0.10.6'
# Forms made easy for Rails! It's tied to a simple DSL, with no opinion on markup.
gem 'simple_form', '~> 3.5'
# The most advanced responsive front-end framework in the world.
gem 'foundation-rails'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'rspec-rails', '~> 3.6'
  gem 'ffaker'
  # factory_girl provides a framework and DSL for defining and using factories
  gem 'factory_girl_rails', '~> 4.8'
  # Used to open pages in browser from Capybara specs for debugging.
  gem 'launchy'
  gem 'listen'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'spring-commands-rspec'
end

group :test do
  gem 'rspec-its', '~> 1.2'
  gem 'database_cleaner', '~> 1.6', '>= 1.6.1'
  gem 'guard-rails'
  gem 'guard-rspec', '~> 4.7', '>= 4.7.3'
  gem 'shoulda-matchers', '~> 3.1', '>= 3.1.1'
  gem 'capybara', '~> 2.13'
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
