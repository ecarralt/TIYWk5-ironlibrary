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
  checkoutuser = User.find_by username: params[:checkout][:username]
  checkoutbook = Book.find_by id: params[:checkout][:id]

  @checkout = Checkout.new
  @checkout.book_id = checkoutbook.id
  @checkout.user_id = checkoutuser.id


  if @checkout.save && checkoutbook.status == "available"
    checkoutbook.status = "not available"
    checkoutbook.save
    redirect_to api_checkout_show_path(book_id: @checkout.book_id, user_id: @checkout.user_id), status: 201 #created
  else
    render json: {errors: @checkout.errors}, status: 422 #error
  end

end

def delete
 checkoutuser = User.find_by username: params[:checkout][:username]
 checkoutbook = Book.find_by id: params[:checkout][:id]

 @checkout = Checkout.find_by(book_id: checkoutbook.id, user_id: checkoutuser.id )

 @checkout.destroy
 checkoutbook.status = "available"
 checkoutbook.save
 render json: {ok: true}, status: 200

end


end
