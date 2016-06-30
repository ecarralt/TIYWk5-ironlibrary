require "test_helper"

class UserViewBookPathTestTest < Capybara::Rails::TestCase
  setup do
    Author.create! first_name: "Anthony", last_name: "Burgees"
    Book.create!  title: "A Clockwork Orange", price: 34, photo_url: "https://upload.wikimedia.org/wikipedia/en/2/23/Clockwork_orange.jpg", author_id: 1
    User.create! username: "enrique", password: "12345678"

  end

  test "can view book in the homepage" do
    # visit home_path
    # assert_content page, "Anthony" ##checking home page as well
    # click_link "A Clockwork Orange"

    visit '/books/1'
    fill_in('Username', :with => "enrique")
    fill_in('Password', :with => "12345678")
    click_button "Sign In"
    click_link "A Clockwork Orange"
    assert_content page, "A Clockwork Orange" ##checking home page as well

  end
end
