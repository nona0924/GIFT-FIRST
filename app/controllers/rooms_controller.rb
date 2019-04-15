class RoomsController < ApplicationController
  
  before_action :authenticate_user!, :only => [:create, :show, :index, :edit, :update]

  def create
    @room = Room.create
    @entry1 = Entry.create(:room_id => @room.id, :user_id => current_user.id)
    @entry2 = Entry.create(params.require(:entry).permit(:user_id, :room_id).merge(:room_id => @room.id))
    redirect_to "/rooms/#{@room.id}"
    flash[:notice] = "チャットを作成しました！"
  end

  def show
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
    @messages = @room.messages
    @message = Message.new
    @entries = @room.entries
  else
    flash[:alert] = "無効なユーザー"
    redirect_to :back
  end
  end

  def index
    @entries = current_user.entries
  end

  def edit
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
    else
      flash[:alert] = "無効なユーザー"
      redirect_to :back
    end
  end

  def update
    @room = Room.find(params[:id])
    if Entry.where(:user_id => current_user.id, :room_id => @room.id).present?
    @room.update(params.require(:room).permit(:room_name))
    flash[:notice] = "チャット情報が変更されました"
    redirect_to :back
  else
    flash[:alert] = "無効なユーザー"
    redirect_to :back
  end
  end

end