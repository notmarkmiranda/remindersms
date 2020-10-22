source "https://rubygems.org"
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

gem "rails", "~> 6.0.3", ">= 6.0.3.4"
gem "pg", ">= 0.18", "< 2.0"
gem "puma", "~> 4.1"
gem "sass-rails", ">= 6"
gem "webpacker", "~> 4.0"
gem "jbuilder", "~> 2.7"
gem "bootsnap", ">= 1.4.2", require: false

gem "devise"
gem "jwt"

group :development, :test do
  gem "capybara"
  gem "factory_bot_rails"
  gem "faker"
  gem "pry"
  gem "rspec-rails"
  gem "standardrb"
end

group :development do
  gem "listen", "~> 3.2"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "shoulda-matchers", "~> 4.0"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
