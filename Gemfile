source 'http://rubygems.org'

gem 'rails', '3.1.0'

# Bundle edge Rails instead:
# gem 'rails',     :git => 'git://github.com/rails/rails.git'

group :development do
  gem 'sqlite3'
  # To use debugger
  # gem 'ruby-debug19', :require => 'ruby-debug'
end

group :production do
  gem 'pg'
end

# General gems
gem 'sorcery'  # authentication
# gem 'tlsmail'  # so we can use gmail to send emails
gem 'pony'
gem 'mail'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails', "  ~> 3.1.0"
  gem 'coffee-rails', "~> 3.1.0"
  gem 'uglifier'
end

gem 'jquery-rails'

# Use unicorn as the web server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

group :test do
  # Pretty printed test output
  gem 'turn', :require => false
end

group :test, :development do
  gem 'rspec-rails'
  gem 'shoulda'
  gem 'factory_girl_rails'
  gem 'watchr'
  gem 'ZenTest'
  gem 'autotest-rails'
  # gem 'spork'
end

group :cucumber do
 # gem 'capybara'           # better than webrat
  gem 'database_cleaner'   # clean database between tests
 # gem 'cucumber-rails'
 # gem 'cucumber'
  gem 'rspec-rails'
 # gem 'spork'
  gem 'factory_girl_rails'
end
