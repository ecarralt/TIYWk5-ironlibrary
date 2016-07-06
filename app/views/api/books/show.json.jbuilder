json.book do
  json.id @book.id
  json.title @book.title
  json.price number_to_currency(@book.price)
  json.photo_url @book.photo_url
  json.url api_book_url(id: @book.id)
  json.author do
    json.id @book.author.id
    json.first_name @book.author.first_name
    json.last_name @book.author.last_name
  end
end
