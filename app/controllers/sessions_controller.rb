class SessionsController < ApplicationController
  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = "Welcome back to Hawkins!"
      session[:user_id] = @user.id
      redirect_to '/'
    else
      flash[:alert] = "There was a problem signing in, please try again."
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You have left Hawkins. Please come back soon!"
    redirect_to '/'
  end
end
