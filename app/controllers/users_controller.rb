class UsersController < ApplicationController
  before_action :set_user, only: %i[show]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to @user, success: "Welcome to the Sample App!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show; end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

  def set_user
    @user = User.find(params[:id])
  end
end
