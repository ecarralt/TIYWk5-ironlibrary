class Checkout < ActiveRecord::Base

   validates :user_id, presence: true
   validates :book_id, presence: true

   belongs_to :books
   belongs_to :users

end
