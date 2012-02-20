require 'rspec/rails'
  
Dir[Rails.root.join("spec/support/**/*.rb")].each {|f| require f}
  
RSpec.configure do |config|
  config.mock_with :mocha

  # Remove this line if you're not using ActiveRecord or ActiveRecord fixtures
  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  # If you're not using ActiveRecord, or you'd prefer not to run each of your
  # examples within a transaction, remove the following line or assign false
  # instead of true.
  config.use_transactional_fixtures = true
  
  # config.include ControllerMacros, :type => :controller
  # config.include AuthenticationHelpers#, :type => :controller
end
