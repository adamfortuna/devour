source 'https://rubygems.org'

ruby '2.3.1'

gem 'rails', '~> 5.0.0', '>= 5.0.0.1'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
gem "haml-rails", '~> 0.9.0'

gem 'jquery-rails'
gem 'jbuilder', '~> 2.5'
gem 'pg'

# Active Admin
gem 'activeadmin', github: 'activeadmin'
gem 'inherited_resources', github: 'activeadmin/inherited_resources'
gem 'devise'

gem 'friendly_id', '~> 5.1.0'
gem 'country_select'

# Maps
gem 'geokit-rails'

# Image processing
gem 'fog'
gem 'fog-aws'
gem 'carrierwave'
gem 'mini_magick'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platform: :mri
  gem 'pry'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> anywhere in the code.
  gem 'web-console'
  gem 'listen', '~> 3.0.5'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
