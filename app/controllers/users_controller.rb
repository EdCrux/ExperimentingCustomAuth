class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :update, :destroy]
  
  #GET /signup
  def new
    @user = User.new
  end
  
  #GET /users/1/edit
  def edit
  end


  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome! #{@user.username}"
      redirect_to articles_path
    else
      render :new
    end
  end

  def update
    if @user.update(user_params)
        flash[:success] = "Your account was updated successfully!"
        redirect_to articles_path
    else
      render 'edit'
    end
  end
  

  private

  def user_params
    params.require(:user).permit(:username, :email, :password)
  end
  def set_user
    @user = User.find(params[:id])
  end
end