# Gemfile
repo_url = 'https://raw.githubusercontent.com/otukutun/rails-template/master'

# authentication
if yes?('use devise ?')
  gem 'devise'
  generate 'devise:install'
  model_name = ask("What would you like the user model to be called? [user]")
  model_name = "user" if model_name.blank?
  generate "devise", model_name
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

gem 'draper'
gem 'redis'

gem 'carrierwave'
#gem 'fog'

gem 'versionist' # api versioning

gem 'kaminari' # pagination

# grape
if yes?('use grape ?')
  gem 'grape'
  gem 'grape-jbuilder'
end


gem_group :development, :test do
  gem 'pry-rails'
  gem 'pry-doc'
  gem 'pry-stack_explorer'
  gem 'pry-byebug'
  gem 'hirb'
  gem 'hirb-unicode'
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'faker'
  gem 'faker-japanese'
  gem 'capybara'
  gem 'database_cleaner'
  gem 'launchy'
  gem 'selenium-webdriver'
  gem 'simplecov'
  gem 'autodoc'
  gem 'rubocop'

  # guard
  gem 'guard'
  gem 'guard-rspec'
  gem 'guard-bundler'
  gem 'guard-rubocop'
  gem 'shoulda-matchers'
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

# .gitignore
remove_file '.gitignore'
get "#{repo_url}/gitignore", '.gitignore'

# .pryrc
get "#{repo_url}/pryrc", '.pryrc'

# git initalize setting
after_bundle do
  git :init
  git add: '.'
  git commit: %Q{ -m 'Initial commit' }
end
