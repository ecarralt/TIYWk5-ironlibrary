class Book < ActiveRecord::Base

   validates :title, presence: true
   validates :price, presence: true
   validates :author_id, presence: true
end
