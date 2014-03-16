ENV['RAILS_ENV'] ||= 'test'
require File.expand_path("../dummy/config/environment.rb",  __FILE__)
require 'rspec/rails'
require 'nokogiri'

Rails.backtrace_cleaner.remove_silencers!

# Load support files
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].each { |f| require f }

RSpec.configure do |config|
  # config.before(:suite) do
  #   DatabaseCleaner.strategy = :truncation
  # end
  #
  # config.after(:each) do
  #   DatabaseCleaner.clean
  # end
  #
  config.mock_with :rspec

  config.use_transactional_fixtures = false

  config.infer_base_class_for_anonymous_controllers = false

  # config.order = "random"
  #
  # config.extend WithModel
end
