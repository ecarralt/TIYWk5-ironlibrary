class BooksController < ApplicationController

  def home
    @books = Book.all
  end

  def newbook
    @book = Book.new

  end

  def create
    @book = Book.new
    @book.title = params[:book][:title]
    @book.author_id = params[:book][:author_id].to_i
    @book.price = params[:book][:price]
    @book.photo_url = params[:book][:photo_url]

    if @book.save
      redirect_to home_path
    else
      render :new
    end

  end

end
