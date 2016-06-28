class Book < ActiveRecord::Base

   validates :title, presence: true
   validates :price, presence: true
   validates :image_tag, presence: true
   validates :author_id, presence: true
   belongs_to :author
   
end
