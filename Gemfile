source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.7.1'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails', branch: 'main'
gem 'rails', '~> 6.1.3'
# Use postgresql as the database for Active Record
gem 'pg', '~> 1.1'
# Use Puma as the app server
gem 'puma', '~> 5.0'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
# gem 'jbuilder', '~> 2.7'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
# gem 'image_processing', '~> 1.2'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.4', require: false

# Use Rack CORS for handling Cross-Origin Resource Sharing (CORS), making cross-origin AJAX possible
gem 'rack-cors'

# Authentication
gem 'devise', '~> 4.7', '>= 4.7.3'
gem 'devise-jwt', '~> 0.7.0'
gem 'warden-jwt_auth', '0.4.2'
gem 'fast_jsonapi'
gem 'dotenv', '~> 2.7', '>= 2.7.6'
gem 'dotenv-rails', '~> 2.7', '>= 2.7.6'

#Faker and table_print to inject dummy data in the DB
gem 'faker', '~> 2.16'
gem 'table_print', '~> 1.5', '>= 1.5.7'

# Prettier for clean code purpose
gem 'prettier', '~> 1.5', '>= 1.5.3'

# Stripe for processing payments on the platform
gem 'stripe', '~> 5.30'

# AWS to proceed with S3 in production environment
gem 'aws-sdk-s3', '~> 1.91', require: false

# Fetching content from github
gem 'octokit', '~> 4.0'

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'rspec-rails', '~> 4.0.2'
  gem 'byebug', platforms: %i[mri mingw x64_mingw]
end

group :test do
  gem 'factory_bot_rails', '~> 6.1'
end

group :development do
  gem 'listen', '~> 3.3'
  gem 'letter_opener', '~> 1.7'
  
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]

gem 'active_model_serializers', '~> 0.10.12'
gem 'mailjet', '~> 1.1'
