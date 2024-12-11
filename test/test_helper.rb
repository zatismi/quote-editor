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
      fill_in "Email", with: user.email
      fill_in "Password", with: "password"
      click_button "Log in"
      # Debugging output
      puts "Current path after login attempt: #{current_path}"
      # After Adding the next line the test was able to save that the user info as is, otherwhise user was not found somehow, which doesn't make any sense at the moment
      # TicketToaster - Wed - 11.12.2024 - 14:52
      puts "User Email is: #{user.email}"
    end
  end
end
