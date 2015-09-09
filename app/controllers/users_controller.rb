class UsersController < ApplicationController
  before_action :signed_in_user, only: [:edit, :show]
  before_action ->(id = params[:id]) {correct_user(id)}, only: [:edit, :show, :destroy, :update]

  def new
    @user = User.new
  end

  def edit
    @user = current_user
  end

  def show
  end

  def index
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "User created"
      redirect_to root_path
    else
      render "users/new"
    end
  end

  def destroy
  end

  def update
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation, :name)
  end
end
