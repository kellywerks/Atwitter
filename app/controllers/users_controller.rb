class UsersController < ApplicationController

  def index
    @users = User.all
    render 'index'
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to root_url, notice: "Thanks for signing up!"
    else
      render 'new'
    end
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    session[:user_id] = nil
    redirect_to root_url, notice:  'Good-bye!'
  end

  private
  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :handle)
  end
end
