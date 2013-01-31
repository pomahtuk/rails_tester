source 'https://rubygems.org'

#gem 'rails',     :path => '/usr/local/rvm/gems/ruby-1.9.3-p327@global/gems'
gem 'rails',     github: 'rails/rails'
gem 'journey',   :git => 'git://github.com/rails/journey.git', :branch => '1-0-stable'
#gem 'arel',      :git => 'git://github.com/rails/arel.git', :branch => '3-0-stable'
gem 'arel',      github: 'rails/arel'

#gem 'sqlite3'
gem 'mysql2'
gem 'sorcery'

# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   :git => 'git://github.com/rails/sass-rails.git'#, :branch => '3-2-stable'
  gem 'coffee-rails', :git => 'git://github.com/rails/coffee-rails.git'#, :branch => '3-2-stable'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer', :platforms => :ruby

  gem 'uglifier', '>= 1.0.3'
end

group :test, :development do
  gem 'faker'
  gem 'factory_girl'

  gem "rspec-rails",        :git => "git://github.com/rspec/rspec-rails.git"
  gem "rspec",              :git => "git://github.com/rspec/rspec.git"
  gem "rspec-core",         :git => "git://github.com/rspec/rspec-core.git"
  gem "rspec-expectations", :git => "git://github.com/rspec/rspec-expectations.git"
  gem "rspec-mocks",        :git => "git://github.com/rspec/rspec-mocks.git"
end

group :development do
  # Use unicorn as the app server
  # gem 'unicorn'
  gem 'thin'
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
# gem 'capistrano'

# To use debugger
# gem 'debugger'
