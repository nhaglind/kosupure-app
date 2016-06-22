source 'https://rubygems.org'
ruby "2.3.0"

gem 'rails', '4.2.6'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'bootstrap-sass', '~> 3.3.6'

# active admin
# gem 'activeadmin', github: 'activeadmin'

# pagination
gem 'will_paginate', '~> 3.1.0'
gem 'will_paginate-bootstrap'

# image upload
gem "carrierwave", github: "carrierwaveuploader/carrierwave"
gem "mini_magick"
gem "carrierwave-dropbox"
gem "file_validators"

# secrets
gem "figaro"

# user auth
gem 'devise'
gem 'omniauth-stripe-connect'

# payment
gem 'stripe'

# database
gem 'pg'

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'guard'
  gem 'guard-sass'
  gem 'guard-livereload'
  gem 'guard-rails'
  gem 'rack-livereload'
  gem 'scss_lint', require: false
end

group :development, :test do
	gem 'rspec-rails'
	gem 'factory_girl_rails'
end

group :test do
	gem 'capybara'
	gem 'faker'
	gem 'guard-rspec'
	gem 'launchy'
end

group :production do
	gem 'rails_12factor'
end

group :doc do
	gem 'sdoc', require: false
end

