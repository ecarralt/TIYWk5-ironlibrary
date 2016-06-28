class Author < ActiveRecord::Base

   validates :first_name, presence: true
   validates :last_name, presence: true
   has_many :books

end
