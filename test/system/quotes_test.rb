require "application_system_test_case"

class QuotesTest < ApplicationSystemTestCase
  setup do
    # @quote = quotes(:first)
    # We need to order quote as well in the system tests
    @user = users(:accountant)

    sign_in_as(@user)
    @quote = Quote.ordered.first
    # puts @quote
    # put @quser
  end

  test "Showing a quote" do
    puts @user == nil

    visit quotes_path

    assert_selector "h1", text: "Quotes"
    click_link @quote.name

    assert_selector "h1", text: @quote.name
  end

  test "Creating a new quote" do
    visit quotes_path
    click_on "New quote"
    fill_in "Name", with: "Capybara quote"
    click_on "Create quote"
    click_link "Capybara quote"
    assert_text "Capybara quote"
  end

  test "Updating a quote" do
    visit quotes_path
    click_on "Edit", match: :first
    fill_in "Name", with: "Updated quote"
    click_on "Update Shop Title"
    assert_selector "a", text: "Updated quote"
  end

  test "Destroying a quote" do
    visit quotes_path
    click_on "Delete", match: :first
    assert_no_text @quote.name
  end
end
