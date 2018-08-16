ENV["RACK_ENV"] ||= "test"

require File.expand_path("../../config/environment", __FILE__)
require 'bundler'
require 'rspec'
require 'capybara/dsl'

Bundler.require(:default, :test)

Capybara.app = LittleShopApp

DatabaseCleaner.strategy = :truncation

RSpec.configure do |c|
  c.before(:all) do
    DatabaseCleaner.clean
  end
  c.after(:each) do
    DatabaseCleaner.clean
  end

  c.include Capybara::DSL
end

Capybara.save_path = 'tmp/capybara'
