class MessagesController < ApplicationController
    
     before_action :authenticate_user!, :only => [:create]

  def create
    if Entry.where(:user_id => current_user.id, :room_id => params[:message][:room_id]).present?
          @message = Message.create(params.require(:message).permit(:user_id, :room_id, :message).merge(:user_id => current_user.id))
        Entry.where(:room_id => @message.room_id).where.not(:user_id => current_user.id).each do |m|
          @unread = Unread.create(message_id: @message.id, user_id: m.user_id)
        end
    else
      flash[:alert] = "無効なユーザー"
    end
    redirect_to :back
  end
end
