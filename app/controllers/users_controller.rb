class UsersController < ApplicationController
    
    before_action :authenticate_user!, :only => [:show, :index, :edit, :update]
    
  def show
      @user = User.find(params[:id])
    if @user.id == current_user.id
      @entries = current_user.entries
    else
      Entry.where(user_id: @user.id).each do |eu|
        logger.debug("===================================controller_____!!!!!!!!!!!!!!!!!!!!!!eueu#{eu.room_id}")
           @room = Room.find_by(id: Entry.find_by(room_id: eu.room_id, user_id: current_user.id).room_id)
           logger.debug("===================================controller_____!!!!!!!!!!!!!!!!!!!!!!@rooooooooom#{Entry.find_by(room_id: eu.room_id, user_id: current_user.id).id}")
           if @room.present?
             logger.debug("===================================controller_____!!!!room_id#{@room.id}")
           end
      end
      if !@room.present?
         @room = Room.new
         @entry = Entry.new
      end
    end
  end
  
  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:notice] = "アカウント登録しました"
      redirect_to users_path
    else
      flash[:notice] = "アカウント登録できませんでした"
      render 'devise/registrations/new'
    end
  end

  def index
      @users = User.all.order(created_at: :desc)
      @search = User.ransack(params[:q])
      @products = @search.result
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
  
  def following
      @user  = User.find(params[:id])
      @users = @user.followings
      render 'show_follow'
  end

  def followers
    @user  = User.find(params[:id])
    @users = @user.followers
    render 'show_follower'
  end
  
  private

    def user_params
      params.require(:user).permit(:email, :name, :user_type, :gender, :birtyday, :profile, :postcode, :prefecture_name, :address_city, :address_street, :address_building)
    end
  end
  
  