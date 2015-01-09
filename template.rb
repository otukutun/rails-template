# Gemfile
gem_group :test, :development do
  gem 'rspec-rails'
  gem 'factory_girl_rails'
  gem 'simplecov' if yes?('use simplecov ?')
end

run "rm README.rdoc"

after_bundle do
  git :init
  git add: "."
  git commit: %Q{ -m 'Initial commit' }
end

