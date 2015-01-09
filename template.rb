# Gemfile
# implements API
gem 'grape'
gem 'grape-jbuilder'
gem 'mysql2'
gem 'settingslogic'

gem 'draper', :github => 'drapergem/draper'

gem_group :development, :test do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'simplecov' if yes?('use simplecov ?')
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
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end
