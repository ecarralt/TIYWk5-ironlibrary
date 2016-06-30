class SessionsController < ApplicationController

def new

end

  def create
    user = User.find_by username: params[:username]
    if user && user.authenticate(params[:password])
      session[:username] = params[:username]     # making session[:username] present
      redirect_to home_path, notice: "Welcome!"
    else
      flash.now[:notice] = "Something is wrong with your username and/or password"
      render :new
    end
  end

  def delete
    session.delete :username  # session[:username] = nil (should also work)
    redirect_to home_path, notice: "Signed Out!"
  end

end
