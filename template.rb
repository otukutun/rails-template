# Gemfile

# authentication
gem 'devise' if yes?('use devise ?')
gem 'sorcery' if yes?('use sorcery ?')

# redis
gem 'redis'
gem 'redis-rails'

# file uploader
gem 'carrierwave'
gem 'rmagick'

# for s3
gem 'fog'

# api versioning
gem 'versionist'

# pagination
gem 'kaminari'

# grape 
if yes?('use grape ?')
  gem 'grape'
  gem 'grape-jbuilder'
end

gem 'mysql2'
gem 'settingslogic'

gem 'draper', :github => 'drapergem/draper'

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'simplecov' if yes?('use simplecov ?')
  gem 'autodoc'
end

gem_group :development do
  gem 'better_errors'
  gem 'binding_of_caller'
end

# rspec initalize setting
run 'bundle install'
run 'rm -rf test'
generate 'rspec:install'

# rm unused files
run "rm README.rdoc"

# git initalize setting
after_bundle do
  git :init
  git add: '.'
  git commit: %Q{ -m 'Initial commit' }
end
