require "test_helper"

class CanSeeNewBookTest < Capybara::Rails::TestCase

  setup do
    Author.create! first_name: "George", last_name: "Orwell"
  end

  test "can view new book" do
    visit home_path
    assert_content page, "Iron" ##checking home page as well
    click_link "New Book"

    fill_in('Title', :with => "Animal Farm")
    select('George Orwell', :from => "Author")
    fill_in('Price', :with => 43)
    fill_in('Photo url', :with => 'http://images.contentful.com/7h71s48744nc/zwiR2ft2Zm8lmrS1kwQiBo/2478760d4a1d9b08a6504a977c8b57e9/animal-farm-cover-image')
    click_button "Submit"

    assert_content page, "Animal Farm"


  end


end
