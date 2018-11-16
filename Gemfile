source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.5.1'
gem 'rails', '~> 5.2.1'

#--- db
gem 'pg'

#--- js&css
gem 'coffee-rails', '~> 4.2'
gem 'jbuilder', '~> 2.5' # JSONレスポンスを効率的に書ける
gem 'jquery-rails'
gem 'uglifier', '>= 1.3.0' # JavaScriptの圧縮
gem 'bootstrap-sass'
gem 'sass-rails', '~> 5.0'
gem 'momentjs-rails'
gem 'bootstrap3-datetimepicker-rails'

#--- view
gem 'slim-rails' # HTMLを簡潔に書ける

#--- email
gem 'letter_opener'
gem 'letter_opener_web'

# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Turbolinks makes navigating your web application faster. Read more: https://github.com/turbolinks/turbolinks
gem 'turbolinks', '~> 5'
# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'pry-byebug'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'rspec-rails'
  gem 'rubocop', require: false
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  # Adds support for Capybara system testing and selenium driver
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  # Easy installation and use of chromedriver to run system tests with Chrome
  gem 'chromedriver-helper'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
