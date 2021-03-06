class BooksController < ApplicationController

  before_action except: :home do
    if session[:username].nil?
      redirect_to sign_in_path, notice: "Please sign in before creating, updating, or deleting a book record"
    end
  end


  def home
    @books = Book.all
    @authors = Author.all
  end

  def show
    @book = Book.find_by id: params[:id]
  end

  def newbook
    @book = Book.new

  end
  def create
    @book = Book.new
    @book.title = params[:book][:title]
    @book.author_id = params[:book][:author_id]
    @book.price = params[:book][:price]
    @book.photo_url = params[:book][:photo_url]
    if @book.save
      redirect_to home_path
    else
      render :newbook
    end
  end

  def delete
    @book = Book.find_by id: params[:id]
    @book.destroy
    redirect_to home_path, notice: "Book deleted from the db"
  end

  def editbook
    @book = Book.find_by id: params[:id]
  end

  def update
    @book = Book.find_by id: params[:id]
    @book.title = params[:book][:title]
    @book.author_id = params[:book][:author_id]
    @book.price = params[:book][:price]
    @book.photo_url = params[:book][:photo_url]
    if @book.save
      redirect_to show_path(id: params[:id]), notice: "Your book has been edited!"
    else
      render :editbook
    end
  end

end
