source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.1.0.rc1'
gem 'pg'
gem 'puma', '~> 3.7'
gem 'sass-rails', github: "rails/sass-rails"
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise', '~> 4.2'
gem 'slim', '~> 3.0'
gem 'bootstrap-sass', '~> 3.3'
gem 'devise-bootstrap-views', '~> 0.0'
gem 'jquery-rails', '~> 4.1'
gem 'react-rails', '~> 1.10'
gem 'acts_as_list', '~> 0.9'

group :development, :test do
  gem 'factory_girl_rails', '~> 4.7'
  gem 'faker', '~> 1.6'
  gem 'pry-rails', '~> 0.3'
  gem 'pry-nav', '~> 0.2'
  gem 'rspec-rails', '~> 3.5'
  gem 'capybara', '~> 2.13.0'
  gem 'selenium-webdriver'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'letter_opener', '~> 1.4'
end

group :test do
  gem 'database_cleaner'
end
