require 'rubygems'
require 'spork'

Spork.prefork do
  ENV["RAILS_ENV"] ||= 'test'
  require File.expand_path("../../config/environment", __FILE__)
  
  require 'rspec/rails'
  require "email_spec"
  
  Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  
  RSpec.configure do |config|
    # == Mock Framework
    #
    # If you prefer to use mocha, flexmock or RR, uncomment the appropriate line:
    #
    # config.mock_with :mocha
    # config.mock_with :flexmock
    # config.mock_with :rr
    config.mock_with :mocha

    # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
    config.fixture_path = "#{::Rails.root}/spec/fixtures"

    # If you're not using ActiveRecord, or you'd prefer not to run each of your
    # examples within a transaction, remove the following line or assign false
    # instead of true.
    config.use_transactional_fixtures = true
    
    config.include EmailSpec::Helpers
    config.include EmailSpec::Matchers
    config.include Devise::TestHelpers, :type => :controller
    
    # config.include ControllerMacros, :type => :controller
    # config.include AuthenticationHelpers#, :type => :controller
  end
end

Spork.each_run do
  
end