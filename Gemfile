source 'https://rubygems.org'
ruby '2.3.1'

gem 'rails', '~> 5.0.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'jbuilder', '~> 2.0'

gem 'bootstrap-sass'
gem 'devise'
gem 'devise-i18n'
gem 'high_voltage'
gem 'simple_form'
gem 'slim-rails'
gem "wysiwyg-rails"
gem 'truncate_html'
gem 'kaminari'
gem 'carrierwave', '>= 1.0.0.rc', '< 2.0' # Add user avatar
gem "mini_magick" # for carrierwave
gem 'devise_lastseenable' # for symply add user.last_seen

gem 'puma' # change WEBrick server

group :development do
  # gem 'quiet_assets'
  gem 'annotate'

  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'better_errors'
  gem 'foreman'
  gem 'guard-bundler'
  gem 'guard-rails'
  gem 'guard-rspec'
  gem 'rails_layout'
  gem 'rb-fchange', :require=>false
  gem 'rb-fsevent', :require=>false
  gem 'rb-inotify', :require=>false
  gem 'spring-commands-rspec'
end

group :development, :test do
  gem 'byebug'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'pry-rescue'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'sqlite3'
end

group :production do
  gem 'pg'
  gem 'rails_12factor'
end

group :test do
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
end
