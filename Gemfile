if RUBY_VERSION =~ /1.9/
  Encoding.default_external = Encoding::UTF_8
  Encoding.default_internal = Encoding::UTF_8
end

source 'http://rubygems.org'

gem 'unicorn'

gem 'rails', '4.0.0.rc1'

gem 'mysql2'
gem 'sorcery', git: "git@github.com:NoamB/sorcery.git"


#gem 'haml-rails'#, :git => 'git://github.com/indirect/haml-rails.git'
gem 'haml-rails', github: 'indirect/haml-rails'
#gem 'haml', '= 3.1.7'
gem 'haml', '~> 4.0'

gem 'awesome_nested_set', github: 'collectiveidea/awesome_nested_set'
gem 'the_sortable_tree', "~> 2.3.0"

gem 'protected_attributes'

gem 'jquery-datatables-rails', github: 'rweng/jquery-datatables-rails'
gem 'ajax-datatables-rails'

#gem 'state_machine'
gem 'state_machine', git: 'git@github.com:pluginaweek/state_machine.git'
gem 'kaminari'

gem 'compass'

gem "paperclip", :git => "git://github.com/thoughtbot/paperclip.git"

gem 'bootstrap-wysihtml5-rails', :require => 'bootstrap-wysihtml5-rails', :git => 'git://github.com/Nerian/bootstrap-wysihtml5-rails.git'

gem 'the_role', path: '/var/www/pman/data/www/the_role'  #github: 'the-teacher/the_role'

gem 'json', '~> 1.7.7'


# Gems used only for assets and not required
# in production environments by default.
group :assets do
  gem 'sass-rails',   :git => 'git://github.com/rails/sass-rails.git'
  gem 'coffee-rails', :git => 'git://github.com/rails/coffee-rails.git'

  gem "less-rails" #Sprockets (what Rails 3.1 uses for its asset pipeline) supports LESS
  gem 'twitter-bootstrap-rails', :git => 'git://github.com/seyhunak/twitter-bootstrap-rails.git'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  gem 'therubyracer', :platforms => :ruby
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
  gem 'thin'
end

gem 'jquery-rails'
gem 'jquery-ui-rails'

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
