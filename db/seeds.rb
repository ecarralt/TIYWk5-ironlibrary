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
  {first_name: "Ken", last_name: "Kesey"}
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


User.delete_all
User.create! username: "enrique", password: "12345678"
