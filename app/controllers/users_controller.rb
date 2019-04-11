class UsersController < ApplicationController
    
    before_action :authenticate_user!, :only => [:show, :index, :edit, :update]
    
  def show
      @user = User.find(params[:id])
  end

  def index
      @users = User.all
  end

  def edit
      @user = User.find(params[:id])
      if @user.id == current_user.id
    else
      redirect_to("/posts")
      flash[:alert] = "無効なユーザー"
    end
  end

  def update
      @user = User.find(params[:id])
      if @user.id == current_user.id
      @user.update(params.require(:user).permit(:name, :birdhday, :user_type, :email, :icon, :profile))
  else
      redirect_to("/posts")
      flash[:alert] = "無効なユーザー"
  end
  end
  
end
