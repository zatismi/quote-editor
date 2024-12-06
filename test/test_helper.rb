ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module ActiveSupport
  class TestCase
    # Run tests in parallel with specified workers
    parallelize(workers: :number_of_processors)

    # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
    fixtures :all

    # Add more helper methods to be used by all tests here...
    def sign_in_as(user)
      visit new_user_session_path
      fill_in "Email", with: "accountant@kpmg.com"
      fill_in "Password", with: "password" # Replace "password" with your test user's password
      click_button "Log in"
    end

  end
end
