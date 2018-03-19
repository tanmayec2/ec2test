source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.1.3'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.3.18', '< 0.5'
# Use Puma as the app server
gem 'puma', '~> 3.7'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.2'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 3.0'
# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'
gem 'beautiful_scaffold', '1.0.1'
# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development
gem 'therubyracer'
group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '~> 2.13'
  gem 'selenium-webdriver'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :development do
  gem 'capistrano', '>= 3.2.1'
  gem 'capistrano-rbenv', '~> 2.0'           # idiomatic rbenv support
  gem 'capistrano-rbenv-install'             # ensures the right ruby version is installed
  gem 'capistrano-bundler', '~> 1.1.2'       # support for bundler
  gem 'capistrano-rails', '~> 1.0'           # automatic migrations and asset compilation
  gem 'capistrano-unicorn-nginx', '~> 2.0'   # plug-n-play nginx and unicorn
  gem 'capistrano-postgresql', '~> 3.0'      # plug-n-play postgresql
  gem 'capistrano-safe-deploy-to', '~> 1.1'  # ensures deploy path for the app exists
  gem 'capistrano-ssh-doctor'                # helps with debugging ssh-agent forwarding
end
# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]

gem 'less-rails', '2.8.0'
gem 'will_paginate'
gem 'ransack', '1.8.2'
gem 'polyamorous', '1.3.1'
gem 'jquery-ui-rails'
gem 'prawn', '2.1.0'
gem 'prawn-table', '0.2.2'
gem 'sanitize'
gem 'twitter-bootstrap-rails', '3.2.2'
gem 'chardinjs-rails'
gem 'momentjs-rails', '>= 2.9.0'
gem 'bootstrap3-datetimepicker-rails', '~> 4.17.47'