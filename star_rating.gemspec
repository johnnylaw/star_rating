$:.push File.expand_path("../lib", __FILE__)

# Maintain your gem's version:
require "star_rating/version"

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.required_ruby_version = '~> 2.0'
  s.name        = "star_rating"
  s.version     = StarRating::VERSION
  s.authors     = ["John Lawrence"]
  s.email       = ["johnonrails@gmail.com"]
  s.homepage    = "https://github.com/johnnylaw/star_rating.git"
  s.summary     = "A flexible sass-based star-rating system for Rails."
  s.description = "Makes it easy to place star-rating inputs into any web app. Configurable appearance, number and value of stars"
  s.license     = "MIT"

  s.files = Dir["{app,config,db,lib}/**/*", "MIT-LICENSE", "Rakefile", "README.md"]

  s.add_dependency "rails", "~> 4.0.0"
  s.add_dependency "sass-rails", "~> 4.0.0"

  s.add_development_dependency "sqlite3"
  s.add_development_dependency 'rspec-rails'
  s.add_development_dependency 'nokogiri'
  s.add_development_dependency 'genspec'
end
