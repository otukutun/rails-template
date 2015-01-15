# Gemfile

# authentication
if yes?('use devise ?')
  gem 'devise'
  generate 'devise:install'
  rake 'db:migrate'
end

if yes?('use sorcery ?')
  gem 'sorcery'
  generate 'sorcery:install'
  rake 'db:migrate'
end

gem 'mysql2'
gem 'slim-rails'
gem 'settingslogic' # environment variables
gem 'draper', :github => 'drapergem/draper'
gem 'redis'

gem 'carrierwave'
gem 'rmagick'
gem 'fog'

gem 'versionist' # api versioning

gem 'kaminari' # pagination

# grape 
if yes?('use grape ?')
  gem 'grape'
  gem 'grape-jbuilder'
end


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

gem_group :production do
  gem 'unicorn'
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
