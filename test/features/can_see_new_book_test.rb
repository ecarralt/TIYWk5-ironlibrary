require "test_helper"

class CanSeeNewBookTest < Capybara::Rails::TestCase


  test "can view new book" do
    visit new_book_path
    fill_in('Title', :with => 'Animal Farm')
    select('Author', :from => 'George Orwell')
    fill_in('Price', :with => 43)
    fill_in('Photo url', :with => 'http://images.contentful.com/7h71s48744nc/zwiR2ft2Zm8lmrS1kwQiBo/2478760d4a1d9b08a6504a977c8b57e9/animal-farm-cover-image')
    click_button "Submit"
  end


end
