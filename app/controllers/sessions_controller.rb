class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      login user
      redirect_to user
    else
      flash.now[:danger] = "Invalid Email/Password combination."
      render 'new'
    end
  end

  def destroy
    logout
    flash[:success] = "You've been logged out."
    redirect_to root_url
  end
end
