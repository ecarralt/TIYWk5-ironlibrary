class Api::CheckoutsController < ApplicationController

  before_action do
    request.format = :json
  end

protect_from_forgery with: :null_session


def show
  @book = Book.find_by id: params[:book_id]
  @user = User.find_by id: params[:user_id]
end


def create
  @user = User.find_by username: params[:checkout][:username]
  @book = Book.find_by id: params[:checkout][:book_id]

  @checkout = Checkout.new
  @checkout.book_id = @book.id
  @checkout.user_id = @user.id


  if @book.status == "available"
    @book.status = "not available"

    if @checkout.save && @book.save
    render :show# json: {message: "successfully checked-out:"}
    # redirect_to api_checkout_show_path(book_id: @checkout.book_id, user_id: @checkout.user_id), status: 201 #created
    else
    render json: {errors: "Sorry, unable to save checkout"}, status: 422 #servererror
    end

  else
    render json: {errors: "Sorry, book not available"}, status: 422 #requesterror
  end

end

  def delete
     checkoutuser = User.find_by username: params[:checkout][:username]
     checkoutbook = Book.find_by id: params[:checkout][:book_id]

     @checkout = Checkout.find_by(book_id: checkoutbook.id, user_id: checkoutuser.id)


     if @checkout != nil && @checkout.destroy
       checkoutbook.status = "available"
       checkoutbook.save
       render json: {ok: "Sucessfully checked-in"}, status: 200
     else
       render json: {errors: "Sorry, the book has not been checked out by that user"}, status: 422 #requesterror

     end
   end


end
