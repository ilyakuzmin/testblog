source 'https://rubygems.org'

gem 'rails', '3.2.3'

gem 'slim'
gem "twitter-bootstrap-rails"
gem 'ancestry'
gem 'acts-as-taggable-on'
gem 'devise'
gem 'cancan'
gem 'aasm'
gem "recaptcha", :require => "recaptcha/rails"

group :assets do
  gem 'sass-rails',   '~> 3.2.3'
  gem 'coffee-rails', '~> 3.2.1'

  gem 'therubyracer', :platform => :ruby

  gem 'uglifier', '>= 1.0.3'
end

gem 'jquery-rails'

group :production do
  gem 'pg'
end

group :test do
  gem 'cucumber-rails'
  gem 'database_cleaner'
  gem 'capybara'
  gem 'pickle'
  gem 'factory_girl_rails'
  gem 'shoulda-matchers'
  gem 'rspec-rails'
end

group :test, :development do
  gem 'mysql2'
  # gem 'linecache19', :git => 'git://github.com/mark-moseley/linecache'
  # gem 'ruby-debug-base19x', '~> 0.11.30.pre4'
  # gem 'ruby-debug19'
end
