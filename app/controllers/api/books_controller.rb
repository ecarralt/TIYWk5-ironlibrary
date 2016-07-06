class Api::BooksController < ApplicationController

  before_action do
    request.format = :json
  end

  protect_from_forgery with: :null_session



  def index
    @books = Book.all
    @authors = Author.all
    render json: @books
  end

  def show
    @book = Book.find_by id: params[:id]

    render json: @book
  end


end
