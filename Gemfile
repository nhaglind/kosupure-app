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

# image upload
gem "carrierwave", github: "carrierwaveuploader/carrierwave"
gem "mini_magick"

# secrets
gem "figaro"

# user auth
gem 'devise'

# payment
gem 'stripe'

# database
gem 'pg'

group :production do
	gem 'rails_12factor'
end

group :development do
  gem 'web-console', '~> 2.0'
  gem 'spring'
  gem 'guard'
  gem 'guard-sass'
  gem 'guard-livereload'
  gem 'guard-rails'
  gem 'rack-livereload'
end

group :doc do
	gem 'sdoc', require: false
end

