# require "test_helper"
require "application_system_test_case"

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    login_as users(:accountant)
    @quote = Quote.ordered.first
  end

  include Warden::Test::Helpers

  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ]
end
