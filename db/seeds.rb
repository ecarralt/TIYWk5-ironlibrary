# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Author.delete_all
author_names = [
  {first_name: "Geroge", last_name: "Orwell"},
  {first_name: "Aldous", last_name: "Huxley"},
  {first_name: "Ken", last_name: "Kesey"},
  {first_name: "Anthony", last_name: "Burgees"}
]

author_names.each do |name|
  author = Author.new
  author.first_name = name[:first_name]
  author.last_name = name[:last_name]
  if author.save
    puts "Created author: #{author}"
  else
    puts "DID NOT CREATE author: #{author}"
  end

end

Book.delete_all

book_titles = ["A Clockwork Orange", "Brave New World"]
book_prices = [33,44]
book_photos = [
  "https://upload.wikimedia.org/wikipedia/en/2/23/Clockwork_orange.jpg",
  "http://t2.gstatic.com/images?q=tbn:ANd9GcRJi53V3AjTNrRKw0671gh9beveuwzSy4Wdr8jr8XUhHDH0zSRF"
]
book_author_ids = [4, 2]


i=-1
book_titles.each do
  i = i+1
  book = Book.new
  book.title = book_titles[i]
  book.price = book_prices[i]
  book.photo_url = book_photos[i]
  book.author_id = book_author_ids[i]
  if book.save
    puts "Created book: #{book}"
  else
    puts "DID NOT CREATE book: #{book}"
  end

end

# Book.create! title: book_titles[1], price: book_prices[1] photo_url: book_photos[1], :author_id: book_author_ids[1]
# Book.create! title: book_titles[2], price: book_prices[2] photo_url: book_photos[2], :author_id: book_author_ids[2]



User.delete_all
User.create! username: "enrique", password: "12345678"
