class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to users_path, notice: "#{user.handle} is atwitter!"
    else
      flash.now.alert = "Email or password is invalid."
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  # private

  # def session_params
  #   params.permit(:email, :password, :password_confirmation)
  # end
end
