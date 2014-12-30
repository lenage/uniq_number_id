require 'bundler/setup'
Bundler.setup

require 'uniq_number_id'
require_relative 'models/user'
require_relative 'models/course'

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
